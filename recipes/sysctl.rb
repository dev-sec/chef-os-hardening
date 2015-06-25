# encoding: utf-8
#
# Cookbook Name: os-hardening
# Recipe: sysctl
#
# Copyright 2012, Dominik Richter
# Copyright 2014, Deutsche Telekom AG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# include sysctl recipe and set /etc/sysctl.d/99-chef-attributes.conf
# TODO: This is deprecated. Remove after sysctl >= 0.6.0
if cookbook_version('sysctl', '< 0.6.0')
  log 'DEPRECATION: You use an older version of chef-sysctl. chef-os-hardening will not support this version in future releases.' do
    level :warn
  end
  include_recipe 'sysctl'
else
  include_recipe 'sysctl::apply'
end

# try to determine the real cpu vendor
begin
  cpu_vendor = node['cpu']['0']['vendor_id'].
               sub(/^.*GenuineIntel.*$/, 'intel').
               sub(/^.*AuthenticAMD.*$/, 'amd')
  node.default['security']['cpu_vendor'] = cpu_vendor
rescue
  log 'WARNING: Could not properly determine the cpu vendor. Fallback to intel cpu.' do
    level :warn
  end
end

# protect sysctl.conf
file '/etc/sysctl.conf' do
  mode 0440
  owner 'root'
  group 'root'
end

# NSA 2.2.4.1 Set Daemon umask
# do config for rhel-family
case node['platform_family']
when 'rhel', 'fedora'
  template '/etc/sysconfig/init' do
    source 'rhel_sysconfig_init.erb'
    mode 0544
    owner 'root'
    group 'root'
    variables
  end
end

# do initramfs config for ubuntu and debian
case node['platform_family']
when 'debian'

  # rebuild initramfs with starting pack of modules,
  # if module loading at runtime is disabled
  unless node['security']['kernel']['enable_module_loading']
    template '/etc/initramfs-tools/modules' do
      source 'modules.erb'
      mode 0440
      owner 'root'
      group 'root'
      variables(
        x86_64: (!(node['kernel']['machine'] =~ /x86_64/).nil?),
        cpuVendor: node['security']['cpu_vendor']
      )
    end

    execute 'update-initramfs' do
      command 'update-initramfs -u'
      action :run
    end
  end
end

# Conditional handling of procps reload
# TODO: This is deprecated. Remove after sysctl >= 0.6.0
# ignore FC023: @see https://github.com/acrmp/foodcritic/issues/151
if cookbook_version('sysctl', '< 0.6.0') # ~FC023
  case node['platform_family']
  when 'debian'
    service_provider = node['platform'] == 'ubuntu' ? Chef::Provider::Service::Upstart : nil
    service 'procps' do
      provider service_provider
      supports restart: false, reload: false
      action [:enable, :start]
    end
  end
end
