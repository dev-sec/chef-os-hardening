#
# Cookbook Name:: base-os-hardening
# Library:: gpgcheck
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

class Chef::Recipe::GPG
  def self.check( file )
    File.open(file) do |f|
      f.each_line do |line|
        log file + ": gpgcheck=1 not properly configured" do
          level :error
          only_if { pattern.match(line) }
        end
      end
    end
  end
end



