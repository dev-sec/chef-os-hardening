# encoding: UTF-8
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

require_relative '../spec_helper'

describe 'os-hardening::adduser' do

  conffile = '/etc/adduser.conf'

  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['env']['umask'] = '067'
      node.set['auth']['uid_min'] = 5000
      node.set['auth']['gid_min'] = 3000
      node.set['useradd']['usergroups'] = 'no'
      node.set['useradd']['users_gid'] = '42'
      node.set['useradd']['skel'] = '/etc/.skel'
      node.set['useradd']['dhome'] = '/user/dirs'
    end.converge(described_recipe)
  end

  it 'creates ' + conffile do
    expect(chef_run).to create_template(conffile).
      with(mode: '0444').
      with(owner: 'root').
      with(group: 'root')
  end

  it 'uses uid_min, gid_min, usergroups and umask in ' + conffile do
    expect(chef_run).to render_file(conffile).
      with_content(/^FIRST_UID=5000$/).
      with_content(/^FIRST_GID=3000$/).
      with_content(/^USERGROUPS=no$/).
      with_content(/^DIR_MODE=0710$/)
  end

  it 'uses users_gid, skel, and dhome in ' + conffile do
    expect(chef_run).to render_file(conffile).
      with_content(/^USERS_GID=42$/).
      with_content(%r{^SKEL=/etc/\.skel$}).
      with_content(%r{^DHOME=/user/dirs$})
  end
end
