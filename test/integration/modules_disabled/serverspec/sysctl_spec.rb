require 'spec_helper'

describe 'kernel modules' do

    describe file('/etc/initramfs-tools/modules') do
        its(:content) { should match /^ghash-clmulni-intel/ }
        its(:content) { should match /^aesni-intel/ }
        its(:content) { should match /^kvm-intel/ }
    end

    context linux_kernel_parameter('kernel.modules_disabled') do
        its(:value) { should eq 1 }
    end

end
