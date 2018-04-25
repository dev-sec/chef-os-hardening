# encoding: utf-8

#
# Cookbook Name: os-hardening
# Recipe: sysctl
#
# Copyright 2012, Dominik Richter
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

# cleanup of old sysctl related configurations. This can be removed at some point in the future
# https://github.com/dev-sec/chef-os-hardening/issues/166#issuecomment-322433264
# https://github.com/sous-chefs/sysctl/pull/61/files#diff-25e5d4a4446ae12a0d6f1162b6160375
old_sysctl_conf_file = '/etc/sysctl.conf'
if platform_family?('arch', 'debian', 'rhel', 'fedora', 'amazon', 'suse')
  old_sysctl_conf_file = if platform_family?('suse') && node['platform_version'].to_f < 12.0
                           '/etc/sysctl.conf'
                         else
                           '/etc/sysctl.d/99-chef-attributes.conf'
                         end
end

file 'cleanup of old sysctl settings' do
  path old_sysctl_conf_file
  action :delete
end

# default attributes
# We can not set this kind of defaults in the attribute files
# as we react on value of other attributes
# https://github.com/dev-sec/chef-ssh-hardening/issues/140#issuecomment-267779720

# Enable RFC-recommended source validation feature. It should not be used for
# routers on complex networks, but is helpful for end hosts and routers serving
# small networks.
sysctl_param 'net.ipv4.conf.all.rp_filter' do
  value 1
end
sysctl_param 'net.ipv4.conf.default.rp_filter' do
  value 1
end

# Reduce the surface on SMURF attacks. Make sure to ignore ECHO broadcasts,
# which are only required in broad network analysis.
sysctl_param 'net.ipv4.icmp_echo_ignore_broadcasts' do
  value 1
end

# There is no reason to accept bogus error responses from ICMP, so ignore them
# instead.
sysctl_param 'net.ipv4.icmp_ignore_bogus_error_responses' do
  value 1
end

# Limit the amount of traffic the system uses for ICMP.
sysctl_param 'net.ipv4.icmp_ratelimit' do
  value 100
end

# Adjust the ICMP ratelimit to include: ping, dst unreachable, source quench,
# time exceed, param problem, timestamp reply, information reply
sysctl_param 'net.ipv4.icmp_ratemask' do
  value 88089
end

# Protect against wrapping sequence numbers at gigabit speeds:
sysctl_param 'net.ipv4.tcp_timestamps' do
  value 0
end

# RFC 1337 fix F1
sysctl_param 'net.ipv4.tcp_rfc1337' do
  value 1
end

# Syncookies is used to prevent SYN-flooding attacks.
sysctl_param 'net.ipv4.tcp_syncookies' do
  value 1
end

sysctl_param 'net.ipv4.conf.all.shared_media' do
  value 1
end
sysctl_param 'net.ipv4.conf.default.shared_media' do
  value 1
end

# Accepting source route can lead to malicious networking behavior, so disable
# it if not needed.
sysctl_param 'net.ipv4.conf.all.accept_source_route' do
  value 0
end
sysctl_param 'net.ipv4.conf.default.accept_source_route' do
  value 0
end

# Accepting redirects can lead to malicious networking behavior, so disable
# it if not needed.
sysctl_param 'net.ipv4.conf.all.accept_redirects' do
  value 0
end
sysctl_param 'net.ipv4.conf.default.accept_redirects' do
  value 0
end
sysctl_param 'net.ipv6.conf.all.accept_redirects' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.accept_redirects' do
  value 0
end
sysctl_param 'net.ipv4.conf.all.secure_redirects' do
  value 0
end
sysctl_param 'net.ipv4.conf.default.secure_redirects' do
  value 0
end

# For non-routers: don't send redirects, these settings are 0
sysctl_param 'net.ipv4.conf.all.send_redirects' do
  value 0
end
sysctl_param 'net.ipv4.conf.default.send_redirects' do
  value 0
end

# log martian packets
sysctl_param 'net.ipv4.conf.all.log_martians' do
  value 1
end
sysctl_param 'net.ipv4.conf.default.log_martians' do
  value 1
end

# ipv6 config
# NSA 2.5.3.2.5 Limit Network-Transmitted Configuration
sysctl_param 'net.ipv6.conf.default.router_solicitations' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.accept_ra_rtr_pref' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.accept_ra_pinfo' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.accept_ra_defrtr' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.autoconf' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.dad_transmits' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.max_addresses' do
  value 1
end

# Disable acceptance of router advertisements
#
# * **0**  - do not accept router advertisements
# * **1**  - accept router advertisements if forwarding is disabled
# * **2**  - accept router advertisements even if forwarding is enabled
sysctl_param 'net.ipv6.conf.all.accept_ra' do
  value 0
end
sysctl_param 'net.ipv6.conf.default.accept_ra' do
  value 0
end

# ExecShield protection against buffer overflows
case node['platform_family']
when 'rhel', 'fedora'
  # on RHEL 7 its enabled per default and can't be disabled
  if node['platform_version'].to_f < 7
    sysctl_param 'kernel.exec-shield' do
      value 1
    end
  end
end

# Virtual memory regions protection
sysctl_param 'kernel.randomize_va_space' do
  value 2
end

# Only enable IP traffic forwarding, if required.
sysctl_param 'net.ipv4.ip_forward' do
  value node['os-hardening']['network']['forwarding'] ? 1 : 0
end
sysctl_param 'net.ipv6.conf.all.forwarding' do
  value(node['os-hardening']['network']['ipv6']['enable'] && node['os-hardening']['network']['forwarding'] ? 1 : 0)
end

# Disable or Enable IPv6 as it is needed.
sysctl_param 'net.ipv6.conf.all.disable_ipv6' do
  value node['os-hardening']['network']['ipv6']['enable'] ? 0 : 1
end

# Define different modes for sending replies in response to received ARP requests that resolve local target IP addresses:
#
# * **0** - (default): reply for any local target IP address, configured on
#           any interface
# * **1** - reply only if the target IP address is local address configured
#           on the incoming interface
# * **2** - reply only if the target IP address is local address configured
#           on the incoming interface and both with the sender's IP address are
#           part from same subnet on this interface
# * **3** - do not reply for local addresses configured with scope host, only
#           resolutions for global and link addresses are replied
# * **4-7** - reserved
# * **8** - do not reply for all local addresses
sysctl_param 'net.ipv4.conf.all.arp_ignore' do
  value node['os-hardening']['network']['arp']['restricted'] ? 1 : 0
end

# Define different restriction levels for announcing the local source IP
# address from IP packets in ARP requests sent on interface:
#
# * **0** - (default) Use any local address, configured on any interface
# * **1** - Try to avoid local addresses that are not in the target's subnet
#           for this interface. This mode is useful when target hosts reachable
#           via this interface require the source IP address in ARP requests to
#           be part of their logical network configured on the receiving
#           interface. When we generate the request we will check all our
#           subnets that include the target IP and will preserve the source
#           address if it is from such subnet. If there is no such subnet we
#           select source address according to the rules for level 2.
# * **2** - Always use the best local address for this target. In this mode
#           we ignore the source address in the IP packet and try to select
#           local address that we prefer for talks with the target host. Such
#           local address is selected by looking for primary IP addresses on
#           all our subnets on the outgoing interface that include the target
#           IP address. If no suitable local address is found we select the
#           first local address we have on the outgoing interface or on all
#           other interfaces, with the hope we will receive reply for our
#           request and even sometimes no matter the source IP address we
#           announce.
#
sysctl_param 'net.ipv4.conf.all.arp_announce' do
  value node['os-hardening']['network']['arp']['restricted'] ? 2 : 0
end

# This setting controls how the kernel behaves towards module changes at
# runtime. Setting to 1 will disable module loading at runtime.
# Setting it to 0 is actually never supported.
sysctl_param 'kernel.modules_disabled' do
  value 1
  not_if { node['os-hardening']['security']['kernel']['enable_module_loading'] }
end

# Magic Sysrq should be disabled, but can also be set to a safe value if so
# desired for physical machines. It can allow a safe reboot if the system hangs
# and is a 'cleaner' alternative to hitting the reset button.
# The following values are permitted:
#
# * **0**   - disable sysrq
# * **1**   - enable sysrq completely
# * **>1**  - bitmask of enabled sysrq functions:
# * **2**   - control of console logging level
# * **4**   - control of keyboard (SAK, unraw)
# * **8**   - debugging dumps of processes etc.
# * **16**  - sync command
# * **32**  - remount read-only
# * **64**  - signalling of processes (term, kill, oom-kill)
# * **128** - reboot/poweroff
# * **256** - nicing of all RT tasks
sysctl_param 'kernel.sysrq' do
  value node['os-hardening']['security']['kernel']['enable_sysrq'] ? node['os-hardening']['security']['kernel']['secure_sysrq'] : 0
end

# Prevent core dumps with SUID. These are usually only needed by developers and
# may contain sensitive information.
sysctl_param 'fs.suid_dumpable' do
  value node['os-hardening']['security']['kernel']['enable_core_dump'] ? 2 : 0
end

# try to determine the real cpu vendor
begin
  cpu_vendor = node['cpu']['0']['vendor_id'].
               sub(/^.*GenuineIntel.*$/, 'intel').
               sub(/^.*AuthenticAMD.*$/, 'amd')
  node.default['os-hardening']['security']['cpu_vendor'] = cpu_vendor
rescue
  log 'WARNING: Could not properly determine the cpu vendor. Fallback to intel cpu.' do
    level :warn
  end
end

# protect sysctl.conf
file '/etc/sysctl.conf' do
  mode 0440
  owner 'root'
  group 'root'
end

# NSA 2.2.4.1 Set Daemon umask
# do config for rhel-family
case node['platform_family']
when 'rhel', 'fedora', 'amazon'
  template '/etc/sysconfig/init' do
    source 'rhel_sysconfig_init.erb'
    mode 0544
    owner 'root'
    group 'root'
    variables(
      prompt: node['os-hardening']['security']['init']['prompt'],
      single: node['os-hardening']['security']['init']['single']
    )
  end
end

# do initramfs config for ubuntu and debian
case node['platform_family']
when 'debian'

  # rebuild initramfs with starting pack of modules,
  # if module loading at runtime is disabled
  unless node['os-hardening']['security']['kernel']['enable_module_loading']
    template '/etc/initramfs-tools/modules' do
      source 'modules.erb'
      mode 0440
      owner 'root'
      group 'root'
      variables(
        x86_64: !(node['kernel']['machine'] =~ /x86_64/).nil?,
        cpuVendor: node['os-hardening']['security']['cpu_vendor']
      )
    end

    execute 'update-initramfs' do
      command 'update-initramfs -u'
      action :run
    end
  end
end

# CIS requirement: disable unused filesystems
if node['os-hardening']['security']['kernel']['disable_filesystems'].empty?
  file '/etc/modprobe.d/dev-sec.conf' do
    action :delete
  end
else
  template '/etc/modprobe.d/dev-sec.conf' do
    source 'filesystem_blacklisting.erb'
    mode 0440
    owner 'root'
    group 'root'
    variables filesystems: node['os-hardening']['security']['kernel']['disable_filesystems']
  end
end
