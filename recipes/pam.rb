# encoding: utf-8
#
# Cookbook Name: os-hardening
# Recipe: pam.rb
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

execute 'update-pam' do
  command 'pam-auth-update --package'
  action :nothing
end

# remove ccreds if not necessary
package 'pam-ccreds' do
  package_name node['packages']['pam_ccreds']
  action :remove
end

case node['platform_family']
# do pam config for ubuntu
when 'debian'

  passwdqc_path = '/usr/share/pam-configs/passwdqc'
  tally2_path   = '/usr/share/pam-configs/tally2'

  # See NSA 2.3.3.1.2
  if node['auth']['pam']['passwdqc']['enable']

    # remove pam_cracklib, because it does not play nice wiht passwdqc
    package 'pam-cracklib' do
      package_name node['packages']['pam_cracklib']
      action :remove
    end

    # get the package for strong password checking
    package 'pam-passwdqc' do
      package_name node['packages']['pam_passwdqc']
    end

    # configure passwdqc via central module:
    template passwdqc_path do
      source 'pam_passwdqc.erb'
      mode 0640
      owner 'root'
      group 'root'
    end

  # deactivate passwdqc
  else

    # delete passwdqc file on ubuntu and debian
    file passwdqc_path do
      action :delete
    end

    # make sure the package is not on the system,
    # if this feature is not wanted
    package 'pam-passwdqc' do
      package_name node['packages']['pam_passwdqc']
      action :remove
    end
  end

  # configure tally2
  if node['auth']['retries'] > 0
    # tally2 is needed for pam
    package 'libpam-modules'

    template tally2_path do
      source 'pam_tally2.erb'
      mode 0640
      owner 'root'
      group 'root'
    end
  else

    file tally2_path do
      action :delete
    end
  end

  execute 'update-pam'

# do config for rhel-family
when 'rhel', 'fedora'

  # we do not allow to use authconfig, because it does not use the /etc/sysconfig/authconfig as a basis
  # therefore we edit /etc/pam.d/system-auth-ac/
  # @see http://serverfault.com/questions/292406/puppet-configuration-using-augeas-fails-if-combined-with-notify

  if node['auth']['pam']['passwdqc']['enable']

    # remove pam_cracklib, because it does not play nice wiht passwdqc
    package 'pam-cracklib' do
      package_name node['packages']['pam_cracklib']
      action :remove
    end

    # get the package for strong password checking
    package 'pam-passwdqc' do
      package_name node['packages']['pam_passwdqc']
    end

  # deactivate passwdqc
  else

    # make sure the package is not on the system,
    # if this feature is not wanted
    package 'pam-passwdqc' do
      package_name node['packages']['pam_passwdqc']
      action :remove
    end
  end

  # run the standard config

  # configure passwdqc and tally via central system-auth confic:
  template '/etc/pam.d/system-auth-ac' do
    source 'rhel_system_auth.erb'
    mode 0640
    owner 'root'
    group 'root'
  end

  # NSA 2.3.3.5 Upgrade Password Hashing Algorithm to SHA-512
  template '/etc/libuser.conf' do
    source 'rhel_libuser.conf.erb'
    mode 0640
    owner 'root'
    group 'root'
  end

end
