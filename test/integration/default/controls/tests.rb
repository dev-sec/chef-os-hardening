include_controls 'linux-baseline' do
  # TODO: check and align with following tests
  skip_control 'os-14'
  skip_control 'os-15'
  skip_control 'os-16'
  skip_control 'sysctl-21'
  skip_control 'sysctl-26'
  skip_control 'sysctl-34'
  # skip entropy test, as our short living test VMs usually do not
  # have enough
  skip_control 'os-08'
end
