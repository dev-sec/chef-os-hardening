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

describe 'os-hardening::pam' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new.converge(described_recipe)
  end

  subject { chef_run }

  it 'remove pam-ccreds' do
    is_expected.to remove_package('pam-ccreds')
  end

  it 'runs pam-auth-update only when a profile changes' do
    expect(chef_run.execute('update-pam')).to do_nothing
    expect(chef_run.template('/usr/share/pam-configs/tally2')).to notify('execute[update-pam]').to(:run).delayed
    expect(chef_run.file('/usr/share/pam-configs/passwdqc')).to notify('execute[update-pam]').to(:run).delayed
  end
end
