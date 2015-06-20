# encoding: utf-8
#
# Cookbook Name:: os-hardening
# Attributes:: sysctl
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

# Only enable IP traffic forwarding, if required.
default['sysctl']['params']['net']['ipv4']['ip_forward'] =
  node['network']['forwarding'] ? 1 : 0
default['sysctl']['params']['net']['ipv6']['conf']['all']['forwarding'] =
  (node['network']['ipv6']['enable'] && node['network']['forwarding']) ? 1 : 0

# Enable RFC-recommended source validation feature. It should not be used for
# routers on complex networks, but is helpful for end hosts and routers serving
# small networks.
default['sysctl']['params']['net']['ipv4']['conf']['all']['rp_filter'] = 1
default['sysctl']['params']['net']['ipv4']['conf']['default']['rp_filter'] = 1

# Reduce the surface on SMURF attacks. Make sure to ignore ECHO broadcasts,
# which are only required in broad network analysis.
default['sysctl']['params']['net']['ipv4']['icmp_echo_ignore_broadcasts'] = 1

# There is no reason to accept bogus error responses from ICMP, so ignore them
# instead.
default['sysctl']['params']['net']['ipv4']['icmp_ignore_bogus_error_responses'] = 1

# Limit the amount of traffic the system uses for ICMP.
default['sysctl']['params']['net']['ipv4']['icmp_ratelimit'] = 100

# Adjust the ICMP ratelimit to include: ping, dst unreachable, source quench,
# time exceed, param problem, timestamp reply, information reply
default['sysctl']['params']['net']['ipv4']['icmp_ratemask'] = 88089

# Disable or Enable IPv6 as it is needed.
default['sysctl']['params']['net']['ipv6']['conf']['all']['disable_ipv6'] =
    node['network']['ipv6']['enable'] ? 0 : 1

# Protect against wrapping sequence numbers at gigabit speeds:
default['sysctl']['params']['net']['ipv4']['tcp_timestamps'] = 0

# arp_announce - INTEGER
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
default['sysctl']['params']['net']['ipv4']['conf']['all']['arp_ignore'] =
    node['network']['arp']['restricted'] ? 1 : 0

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
default['sysctl']['params']['net']['ipv4']['conf']['all']['arp_announce'] =
    node['network']['arp']['restricted'] ? 2 : 0

# RFC 1337 fix F1
default['sysctl']['params']['net']['ipv4']['tcp_rfc1337'] = 1

# Syncookies is used to prevent SYN-flooding attacks.
default['sysctl']['params']['net']['ipv4']['tcp_syncookies'] = 1

default['sysctl']['params']['net']['ipv4']['conf']['all']['shared_media'] = 1
default['sysctl']['params']['net']['ipv4']['conf']['default']['shared_media'] = 1

# Accepting source route can lead to malicious networking behavior, so disable
# it if not needed.
default['sysctl']['params']['net']['ipv4']['conf']['all']['accept_source_route'] = 0
default['sysctl']['params']['net']['ipv4']['conf']['default']['accept_source_route'] = 0

# Accepting redirects can lead to malicious networking behavior, so disable
# it if not needed.
default['sysctl']['params']['net']['ipv4']['conf']['all']['accept_redirects'] = 0
default['sysctl']['params']['net']['ipv4']['conf']['default']['accept_redirects'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['all']['accept_redirects'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['accept_redirects'] = 0
default['sysctl']['params']['net']['ipv4']['conf']['all']['secure_redirects'] = 0
default['sysctl']['params']['net']['ipv4']['conf']['default']['secure_redirects'] = 0

# For non-routers: don't send redirects, these settings are 0
default['sysctl']['params']['net']['ipv4']['conf']['all']['send_redirects'] = 0
default['sysctl']['params']['net']['ipv4']['conf']['default']['send_redirects'] = 0

# log martian packets
default['sysctl']['params']['net']['ipv4']['conf']['all']['log_martians'] = 0

# ipv6 config
# NSA 2.5.3.2.5 Limit Network-Transmitted Configuration
default['sysctl']['params']['net']['ipv6']['conf']['default']['router_solicitations'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['accept_ra_rtr_pref'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['accept_ra_pinfo'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['accept_ra_defrtr'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['autoconf'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['dad_transmits'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['max_addresses'] = 1

# Disable acceptance of router advertisements
#
# * **0**  - do not accept router advertisements
# * **1**  - accept router advertisements if forwarding is disabled
# * **2**  - accept router advertisements even if forwarding is enabled
default['sysctl']['params']['net']['ipv6']['conf']['all']['accept_ra'] = 0
default['sysctl']['params']['net']['ipv6']['conf']['default']['accept_ra'] = 0

# System
# ------

# This settings controls how the kernel behaves towards module changes at
# runtime. Setting to 1 will disable module loading at runtime.
# Setting it to 0 is actually never supported.
unless node['security']['kernel']['enable_module_loading']
  default['sysctl']['params']['kernel']['modules_disabled'] = 1
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
default['sysctl']['params']['kernel']['sysrq'] =
  node['security']['kernel']['enable_sysrq'] ? node['security']['kernel']['secure_sysrq'] : 0

# Prevent core dumps with SUID. These are usually only needed by developers and
# may contain sensitive information.
default['sysctl']['params']['fs']['suid_dumpable'] =
  node['security']['kernel']['enable_core_dump'] ? 1 : 0

# ExecShield protection against buffer overflows
# unless node['platform'] == "ubuntu" # ["nx"].include?(node['cpu'][0]['flags']) or
case platform_family
when 'rhel', 'fedora'
  default['sysctl']['params']['kernel']['exec-shield'] = 1
end

# Virtual memory regions protection
default['sysctl']['params']['kernel']['randomize_va_space'] = 2
