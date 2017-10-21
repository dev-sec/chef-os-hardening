include_controls 'os-hardening-integration-tests'

control 'SELinux-01' do
  impact 1.0
  title 'Verify SELinux enforcing'
  desc 'Verify SELinux enforcing'

  describe file('/etc/selinux/config') do
    its('content') { should include 'SELINUX=enforcing' }
  end

  describe command('getenforce') do
    its('stdout') { should eq "Enforcing\n" }
    its('stderr') { should eq '' }
  end
end
