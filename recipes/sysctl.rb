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

# default attributes
# We can not set this kind of defaults in the attribute files
# as we react on value of other attributes
# https://github.com/dev-sec/chef-ssh-hardening/issues/140#issuecomment-267779720

# Only enable IP traffic forwarding, if required.
node.default['sysctl']['params']['net']['ipv4']['ip_forward'] =
  node['os-hardening']['network']['forwarding'] ? 1 : 0
node.default['sysctl']['params']['net']['ipv6']['conf']['all']['forwarding'] =
  node['os-hardening']['network']['ipv6']['enable'] && node['os-hardening']['network']['forwarding'] ? 1 : 0

# include sysctl recipe and set /etc/sysctl.d/99-chef-attributes.conf
include_recipe 'sysctl::apply'

# try to determine the real cpu vendor
begin
  cpu_vendor = node['cpu']['0']['vendor_id'].
               sub(/^.*GenuineIntel.*$/, 'intel').
               sub(/^.*AuthenticAMD.*$/, 'amd')
  node.default['os-hardening']['security']['cpu_vendor'] = cpu_vendor
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
    variables(
      prompt: node['os-hardening']['security']['init']['prompt'],
      single: node['os-hardening']['security']['init']['single']
    )
  end
end

# do initramfs config for ubuntu and debian
case node['platform_family']
when 'debian'

  # rebuild initramfs with starting pack of modules,
  # if module loading at runtime is disabled
  unless node['os-hardening']['security']['kernel']['enable_module_loading']
    template '/etc/initramfs-tools/modules' do
      source 'modules.erb'
      mode 0440
      owner 'root'
      group 'root'
      variables(
        x86_64: !(node['kernel']['machine'] =~ /x86_64/).nil?,
        cpuVendor: node['os-hardening']['security']['cpu_vendor']
      )
    end

    execute 'update-initramfs' do
      command 'update-initramfs -u'
      action :run
    end
  end
end
