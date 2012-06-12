Description
===========

This cookbook provides numerous security-related configurations, providing all-round base protection.

Requirements
============

* Opscode chef

Attributes
==========

* `[:desktop][:enable]` - true if this is a desktop system, ie Xorg, KDE/GNOME/Unity/etc
* `[:network][:forwarding]` - true if this is not a router, deactivate traffic forwarding
* `[:network][:ipv6][:enable]` - true if IPv6 is used
* `[:network][:nfs][:enable]` - true if NFS (<4) is used
* `[:network][:nfs4][:enable]` - true if NFS v4 is used
* `[:env][:extra_user_paths]` - add additional paths to the user's `PATH` variable (default is empty). 
* `[:env][:umask]` - which umask to configure for the system
* `[:env][:root_path]` - where root is mounted
* `[:auth][:pw_max_age]` - maximum password age
* `[:auth][:pw_min_age]` - minimum password age (before allowing any other password change)
* `[:auth][:retries]` - authentication tries/retries
* `[:auth][:timeout]` - authentication timeout, to prevent brute-force
* `[:auth][:allow_homeless]` - true if to allow users without home to login
* `[:auth][:kerberos][:enable]` - true if Kerberos is used/configured
* `[:auth][:pam][:caching]` - true if PAM caching is used/configured
* `[:security][:users][:allow]` - list of things, that a user is allowed to do. May contain: `cron`, `consolemssaging`, `self_management`, `locate`, `fuse`, `change_user`
* `[:security][:kernel][:enable_module_loading]` - true if you want to allowed to change kernel modules once the system is running (eg `modprobe`, `rmmod`)
* `[:security][:suid_sgid][:enforce]` - true if you want to reduce SUID/SGID bits. There is already a list of items which are searched for configured, but you can also add your own
* `[:security][:suid_sgid][:blacklist]` - a list of paths which should have their SUID/SGID bits removed 
* `[:security][:suid_sgid][:whitelist]` - a list of paths which should not have their SUID/SGID bits altered
* `[:security][:suid_sgid][:remove_from_unkown]` - true if you want to remove SUID/SGID bits from any file, that is not explicitly configured in a whitelist or blacklist
* `[:security][:suid_sgid][:dry_run_on_unkown]` - like `remove_from_unknown`, only that changes aren't applied but only printed
* `[:security][:sudo][:enable]` - true if you want to enable sudo
* `[:security][:pkexec][:enable]` - true if you want to enable pkexec

Usage
=====

Add the recipes to the run_list, it should be last:
    
    "recipe[security]"

Configure attributes:

    "security" : {
      "kernel" : {
        "enable_module_loading" : true
      },
      "sudo" : { "enable" : true }
    },


Kudos
=====

This cookbook is mostly based on guides by:

* [Arch Linux wiki, Sysctl hardening](https://wiki.archlinux.org/index.php/Sysctl)
* [NSA: Guide to the Secure Configuration of Red Hat Enterprise Linux 5](http://www.nsa.gov/ia/_files/os/redhat/rhel5-pamphlet-i731.pdf)
* [Ubuntu Security/Features](https://wiki.ubuntu.com/Security/Features)
* Deutsche Telekom, Group IT Security, Security Requirements (not publicly available)

Thanks to all of you!!



License and Author
==================
Author:: Dominik Richter <dominik.richter@googlemail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
