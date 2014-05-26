# encoding: utf-8
#
# Cookbook Name: os-hardening
# Recipe: default
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

include_recipe('os-hardening::packages')
include_recipe('os-hardening::limits')
include_recipe('os-hardening::login_defs')
include_recipe('os-hardening::minimize_access')
include_recipe('os-hardening::pam')
include_recipe('os-hardening::profile')
include_recipe('os-hardening::securetty')
include_recipe('os-hardening::suid_sgid') if node['security']['suid_sgid']['enforce']
include_recipe('os-hardening::sysctl')
