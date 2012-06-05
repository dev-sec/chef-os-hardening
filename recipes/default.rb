#
# Cookbook Name:: security
# Recipe:: default
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

template "/etc/login.defs" do
  source "login.defs.erb"
  mode 0444
  owner "root"
  group "root"
  variables(
    :additional_user_paths => node[:env][:extra_user_paths].join(":"), # :/usr/local/games:/usr/games
    :umask => node[:env][:umask],
    :password_max_age => node[:auth][:pw_max_age],
    :password_min_age => node[:auth][:pw_min_age],
    :login_retries => node[:auth][:retries],
    :login_timeout => node[:auth][:timeout],
    :chfn_restrict => "", # "rwh"
    :allow_login_without_home => node[:auth][:allow_homeless]
  )
end

template "/etc/security/limits.d/10-hard-core.conf" do
  source "limits.conf.erb"
  mode 0440
  owner "root"
  group "root"
  only_if{ node[:security][:kernel][:disable_core_dump] }
end

template "/etc/profile.d/pinerolo_profile.sh" do
  source "profile.conf.erb"
  mode 0755
  owner "root"
  group "root"
  only_if{ node[:security][:kernel][:disable_core_dump] }
end

include_recipe("security::sysctl")
include_recipe("security::minimize_access")
include_recipe("security::suid_sgid") if node[:security][:suid_sgid][:enforce]
