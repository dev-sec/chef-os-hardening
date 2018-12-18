# encoding: utf-8

#
# Cookbook Name: os-hardening
# Recipe: pack_yum.rb
#
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

# NSA chapter: NSA 2.1.2.3.3
# verify package signatures
# search /etc/yum.conf gpgcheck=1
ruby_block 'check package signature in repo files' do
  block do
    # TODO: harmonize with latter function
    config_file = '/etc/yum.conf'
    # Only check files not listed in gpg_exclude array
    unless node['os-hardening']['yum']['gpg_exclude'].include? config_file
      GPGCheck.check(config_file)
    end

    Dir.glob('/etc/yum.repos.d/*').each do |file|
      config_file = '/etc/yum.conf'
      # Only check files not listed in gpg_exclude array
      unless node['os-hardening']['yum']['gpg_exclude'].include? file
        GPGCheck.check(file)
      end
    end

    rhn_conf = '/etc/yum/pluginconf.d/rhnplugin.conf'
    File.file?(rhn_conf) do
      # Only check files not listed in gpg_exclude array
      unless node['os-hardening']['yum']['gpg_exclude'].include? rhn_conf
        GPGCheck.check(rhn_conf)
      end
    end
  end
  action :run
end

if node['os-hardening']['security']['packages']['clean']

  # remove unused repos
  %w[CentOS-Debuginfo CentOS-Media CentOS-Vault].each do |repo|
    yum_repository repo do
      action :remove
    end
  end

  # remove packages
  node['os-hardening']['security']['packages']['list'].each do |pkg|
    package pkg do
      action :purge
    end
  end

end
