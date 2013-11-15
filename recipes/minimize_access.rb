#
# Cookbook Name:: security
# Recipe:: minimize_access
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

file "/etc/shadow" do
  owner "root"
  group "root"
  mode "0600"
end

file "/bin/su" do
  owner "root"
  group "root"
  mode "0750"
  only_if { ! node[:security][:users][:allow].include?("change_user") }
end
