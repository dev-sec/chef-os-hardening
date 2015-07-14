# encoding: utf-8
#
# Cookbook Name: os-hardening
# Recipe: adduser.rb
#
# Copyright 2015, Deutsche Telekom AG
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

template node['adduser']['conf'] do
  only_if { File.exist?(node['adduser']['conf']) }
  source 'adduser.conf.erb'
  mode '0444'
  owner 'root'
  group 'root'
  variables(
    dhome: node['useradd']['dhome'],
    skel: node['useradd']['skel'],
    usergroups: node['useradd']['usergroups'],
    users_gid: node['useradd']['users_gid'],
    dir_mode: '0' + (0777 & ~(node['env']['umask'].to_i(8))).to_s(8),
    gid_min: node['auth']['gid_min'],
    uid_min: node['auth']['uid_min']
  )
end
