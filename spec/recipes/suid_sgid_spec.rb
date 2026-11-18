# frozen_string_literal: true

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

describe 'os-hardening::suid_sgid' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new.converge(described_recipe)
  end

  subject { chef_run }

  before do
    allow(::File).to receive(:setuid?).and_return(false)
    allow(::File).to receive(:setgid?).and_return(false)
  end

  context 'when a blacklisted file has a SUID bit' do
    before do
      allow(::File).to receive(:setuid?).with('/usr/bin/rcp').and_return(true)
    end

    it 'run remove_suid_from_blacklists ruby_block' do
      is_expected.to run_ruby_block('remove_suid_from_blacklists')
    end
  end

  context 'when no blacklisted file has a SUID or SGID bit' do
    it 'does not run remove_suid_from_blacklists ruby_block' do
      is_expected.not_to run_ruby_block('remove_suid_from_blacklists')
    end
  end
end
