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

if node[:auth][:pam][:passwdqc][:enable]
  # get the package for strong password checking
  package "libpam-passwdqc"

  # configure passwdqc via central module:
  template "/usr/share/pam-configs/passwdqc" do
    source "passwdqc.erb"
    mode 0644
    owner "root"
    group "root"
  end

  # now update pam configuration
  execute "update-pam" do
    command "pam-auth-update --package"
  end

else

  # make sure the package is not on the system,
  # if this feature is not wanted
  package "libpam-passwdqc" do
    action :remove
  end
end