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
    cached(:intel_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['sysctl']['conf_dir'] = '/etc/sysctl.d'
        node.normal['cpu']['0']['vendor_id'] = 'GenuineIntel'
      end.converge(described_recipe)
    end

    describe 'attributes' do
      subject { intel_run.node['os-hardening']['security']['cpu_vendor'] }

      it 'should detect intel cpu' do
        is_expected.to eq('intel')
      end
    end

    describe 'chef run' do
      subject { intel_run }

      it 'creates /etc/sysctl.conf' do
        is_expected.to create_file('/etc/sysctl.conf').with(
          user: 'root',
          group: 'root',
          mode: 0440
        )
      end

      it 'not write log for cpu_vendor fallback' do
        is_expected.to_not write_log(
          'WARNING: Could not properly determine the cpu vendor. Fallback to ' \
            'intel cpu.'
        ).with(
          level: :warn
        )
      end
    end
  end

  context 'amd' do
    cached(:amd_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['sysctl']['conf_dir'] = '/etc/sysctl.d'
        node.normal['cpu']['0']['vendor_id'] = 'AuthenticAMD'
      end.converge(described_recipe)
    end

    describe 'attributes' do
      subject { amd_run.node['os-hardening']['security']['cpu_vendor'] }

      it 'should detect amd cpu' do
        is_expected.to eq('amd')
      end
    end

    describe 'chef run' do
      subject { amd_run }

      it 'creates /etc/sysctl.conf' do
        is_expected.to create_file('/etc/sysctl.conf').with(
          user: 'root',
          group: 'root',
          mode: 0440
        )
      end

      it 'not write log for cpu_vendor fallback' do
        is_expected.to_not write_log(
          'WARNING: Could not properly determine the cpu vendor. Fallback to ' \
            'intel cpu.'
        ).with(
          level: :warn
        )
      end
    end
  end

  context 'fallback' do
    cached(:fallback_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['sysctl']['conf_dir'] = '/etc/sysctl.d'
      end.converge(described_recipe)
    end

    describe 'attributes' do
      subject { fallback_run.node['os-hardening']['security']['cpu_vendor'] }

      it 'should detect intel cpu' do
        is_expected.to eq('intel')
      end
    end

    describe 'chef run' do
      subject { fallback_run }

      it 'creates /etc/sysctl.conf' do
        is_expected.to create_file('/etc/sysctl.conf').with(
          user: 'root',
          group: 'root',
          mode: 0440
        )
      end

      it 'not write log for cpu_vendor fallback' do
        is_expected.to write_log(
          'WARNING: Could not properly determine the cpu vendor. Fallback to ' \
            'intel cpu.'
        ).with(
          level: :warn
        )
      end
    end
  end
end
