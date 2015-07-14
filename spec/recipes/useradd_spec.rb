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

describe 'os-hardening::useradd' do

  conffile = '/etc/default/useradd'

  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['useradd']['users_gid'] = '47'
      node.set['useradd']['skel'] = '/etc/.skel'
      node.set['useradd']['dhome'] = '/home/dirs'
    end.converge(described_recipe)
  end

  it 'creates ' + conffile do
    expect(chef_run).to create_template(conffile).
      with(mode: '0444').
      with(owner: 'root').
      with(group: 'root')
  end

  it 'uses users_gid, skel, and dhome in ' + conffile do
    expect(chef_run).to render_file(conffile).
      with_content(/^GROUP=47$/).
      with_content(%r{^SKEL=/etc/\.skel$}).
      with_content(%r{^HOME=/home/dirs$})
  end
end
