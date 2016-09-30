# encoding: UTF-8
#
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

require_relative '../spec_helper'

describe 'os-hardening::login_defs' do

  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.normal['os-hardening']['auth']['uid_min'] = 5000
      node.normal['os-hardening']['auth']['gid_min'] = 5000
    end.converge(described_recipe)
  end

  it 'creates /etc/login.defs' do
    expect(chef_run).to create_template('/etc/login.defs').
      with(mode: '0444').
      with(owner: 'root').
      with(group: 'root')
  end

  it 'uses uid_min and gid_min in /etc/login.defs' do
    expect(chef_run).to render_file('/etc/login.defs').
      with_content(/^UID_MIN\s+5000$/).
      with_content(/^GID_MIN\s+5000$/)
  end
end
