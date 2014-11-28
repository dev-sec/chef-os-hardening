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

describe 'os-hardening::default' do

  # converge
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      # sysctl/attributes/default.rb will set the config dir
      # on rhel and debian, but apply requires it for notification
      # therefore we set it manually here
      node.set['sysctl']['conf_dir'] = '/etc/sysctl.d'
      node.set['cpu']['0']['vendor_id'] = 'GenuineIntel'
    end.converge(described_recipe)
  end

  # check that the recipres are executed
  it 'default should include os-hardening recipes by default' do
    expect(chef_run).to include_recipe 'os-hardening::packages'
    expect(chef_run).to include_recipe 'os-hardening::limits'
    expect(chef_run).to include_recipe 'os-hardening::login_defs'
    expect(chef_run).to include_recipe 'os-hardening::minimize_access'
    expect(chef_run).to include_recipe 'os-hardening::pam'
    expect(chef_run).to include_recipe 'os-hardening::profile'
    expect(chef_run).to include_recipe 'os-hardening::securetty'
    expect(chef_run).to include_recipe 'os-hardening::sysctl'
  end

end
