#
# Cookbook Name: base-os-hardening
# Recipe: pack_yum.rb
#
# Copyright 2013, Deutsche Telekom AG
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

include_recipe "yum"

# remove unused repos
yum_repository "CentOS-Debuginfo" do
  action :remove
end

yum_repository "CentOS-Media" do
  action :remove
end

yum_repository "CentOS-Vault" do
  action :remove
end

# NSA chapter: NSA 2.1.2.3.3 
# verify package signatures
# search /etc/yum.conf gpgcheck=1
ruby_block "check package signature in repo files" do
  block do
    pattern = /gpgcheck\s*=\s*0/

    #TODO harmonize with latter function
    file = "/etc/yum.conf"
    if File.file?(file)
        File.open(file) do |f|
            f.each_line do |line|
                if pattern.match(line)
                    log file + ": gpgcheck=1 not properly configured" do
                        level :error
                    end
                end
            end
        end
    end

    Dir.glob('/etc/yum.repos.d/*').each do |file|
        next unless File.file?(file)
            File.open(file) do |f|
                f.each_line do |line|
                    if pattern.match(line)
                        log file + ": gpgcheck=1 not properly configured" do
                            level :error
                        end
                    end
            end
        end
    end
  end
  action :run
end

# remove yum automatic updates
yum_package "yum-cron" do
  action :purge
end

yum_package "yum-updatesd" do
  action :purge
end

# remove non ssl servers
yum_package "erase" do
  action :purge
end

yum_package "xinetd" do
  action :purge
end

yum_package "inetd" do
  action :purge
end

yum_package "tftp-server" do
  action :purge
end

yum_package "ypserv" do
  action :purge
end

yum_package "telnet-server" do
  action :purge
end

yum_package "rsh-server" do
  action :purge
end

# updates the system
# consider https://github.com/cookbooks/yum as replacement
execute "yum-update" do
  command "yum -y update"
  ignore_failure true
  action :run
end

execute "yum store installed packages" do
  command "yum list installed >> ~/installed_$(date -d 'today' +'%Y%m%d%H%M').txt"
  ignore_failure true
  action :run
end

