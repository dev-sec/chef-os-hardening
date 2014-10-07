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

describe 'os-hardening::sysctl' do

  context 'intel' do

    let(:intel_run) do
      ChefSpec::Runner.new do |node|
        node.set['sysctl']['conf_dir'] = '/etc/sysctl.d'
        node.set['cpu']['0']['vendor_id'] = 'GenuineIntel'
      end
    end

    it 'should detect intel cpu' do
      intel_run.converge(described_recipe)
      expect(intel_run.node['security']['cpu_vendor']).to eq('intel')
    end

  end

  context 'amd' do

    let(:amd_run) do
      ChefSpec::Runner.new do |node|
        node.set['sysctl']['conf_dir'] = '/etc/sysctl.d'
        node.set['cpu']['0']['vendor_id'] = 'AuthenticAMD'
      end
    end

    it 'should detect amd cpu' do
      amd_run.converge(described_recipe)
      expect(amd_run.node['security']['cpu_vendor']).to eq('amd')
    end
  end

  context 'fallback' do

    let(:fallback_run) do
      ChefSpec::Runner.new do |node|
        node.set['sysctl']['conf_dir'] = '/etc/sysctl.d'
      end
    end

    it 'should detect intel cpu' do
      fallback_run.converge(described_recipe)
      expect(fallback_run.node['security']['cpu_vendor']).to eq('intel')
    end
  end
end
