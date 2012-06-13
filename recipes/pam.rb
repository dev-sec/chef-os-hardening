#
# Cookbook Name:: security
# Recipe:: pam.rb
#
# Copyright 2012, Dominik Richter
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

passwdqc_path = "/usr/share/pam-configs/passwdqc"
tally2_path   = "/usr/share/pam-configs/tally2"

execute "update-pam" do
  command "pam-auth-update --package"
  action :nothing
end

# remove ccreds if not necessary
package "libpam-ccreds" do
  action :remove
end


if node[:auth][:pam][:passwdqc][:enable]
  # get the package for strong password checking
  package "libpam-passwdqc"

  # configure passwdqc via central module:
  template passwdqc_path do
    source "pam_passwdqc.erb"
    mode 0640
    owner "root"
    group "root"
  end
else

  file passwdqc_path do
    action :delete
  end

  # make sure the package is not on the system,
  # if this feature is not wanted
  package "libpam-passwdqc" do
    action :remove
  end
end


if node[:auth][:retries] > 0
  # tally2 is needed for pam 
  package "libpam-modules"

  template tally2_path do
    source "pam_tally2.erb"
    mode 0640
    owner "root"
    group "root"
  end
else

  file tally2_path do
    action :delete
  end
end


execute "update-pam"