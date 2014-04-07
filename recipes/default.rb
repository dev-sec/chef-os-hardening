#
# Cookbook Name: base-os-hardening
# Recipe: default
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

include_recipe("base-os-hardening::packages")
include_recipe("base-os-hardening::limits")
include_recipe("base-os-hardening::login_defs")
include_recipe("base-os-hardening::minimize_access")
include_recipe("base-os-hardening::pam")
include_recipe("base-os-hardening::profile")
include_recipe("base-os-hardening::securetty")
include_recipe("base-os-hardening::suid_sgid") if node[:security][:suid_sgid][:enforce]
include_recipe("base-os-hardening::sysctl")
