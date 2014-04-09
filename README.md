# base-os-hardening (Chef cookbook)

## Description

This cookbook provides numerous security-related configurations, providing all-round base protection.

## Requirements

* Opscode chef

## Attributes

* `['desktop']['enable'] = false`
  true if this is a desktop system, ie Xorg, KDE/GNOME/Unity/etc
* `['network']['forwarding'] = false`
  true if this system requires packet forwarding (eg Router), false otherwise
* `['network']['ipv6']['enable'] = false`
* `['network']['arp']['restricted'] = true`
  true if you want the behavior of announcing and replying to ARP to be restricted, false otherwise
* `['env']['extra_user_paths'] = []`
  add additional paths to the user's `PATH` variable (default is empty).
* `['env']['umask'] = "027"`
* `['env']['root_path'] = "/"`
  where root is mounted
* `['auth']['pw_max_age'] = 60`
  maximum password age
* `['auth']['pw_min_age'] = 7`
  minimum password age (before allowing any other password change)
* `['auth']['retries'] = 5`
  the maximum number of authentication attempts, before the account is locked for some time
* `['auth']['lockout_time'] = 600`
  time in seconds that needs to pass, if the account was locked due to too many failed authentication attempts
* `['auth']['timeout'] = 60`
  authentication timeout in seconds, so login will exit if this time passes
* `['auth']['allow_homeless'] = false`
  true if to allow users without home to login
* `['auth']['pam']['passwdqc']['enable'] = true`
  true if you want to use strong password checking in PAM using passwdqc
* `['auth']['pam']['passwdqc']['options'] = "min=disabled,disabled,16,12,8"`
  set to any option line (as a string) that you want to pass to passwdqc
* `['security']['users']['allow'] = []`
  list of things, that a user is allowed to do. May contain: `change_user`
* `['security']['kernel']['enable_module_loading'] = true`
  true if you want to allowed to change kernel modules once the system is running (eg `modprobe`, `rmmod`)
* `['security']['kernel']['enable_sysrq'] = false`
* `['security']['kernel']['enable_core_dump'] = false`
* `['security']['suid_sgid']['enforce'] = true`
  true if you want to reduce SUID/SGID bits. There is already a list of items which are searched for configured, but you can also add your own
* `['security']['suid_sgid']['blacklist'] = []`
  a list of paths which should have their SUID/SGID bits removed
* `['security']['suid_sgid']['whitelist'] = []`
  a list of paths which should not have their SUID/SGID bits altered
* `['security']['suid_sgid']['remove_from_unkown'] = false`
  true if you want to remove SUID/SGID bits from any file, that is not explicitly configured in a whitelist or blacklist
* `['security']['suid_sgid']['dry_run_on_unkown'] = false`
  like `remove_from_unknown`, only that changes aren't applied but only printed


## Usage

Add the recipes to the run_list, it should be last:

    "recipe[base-os-hardening]"

Configure attributes:

    "security" : {
      "kernel" : {
        "enable_module_loading" : true
      }
    },

## Local Testing

For local testing you can use vagrant and Virtualbox of VMWare to run tests locally. You will have to install Virtualbox and Vagrant on your system. See [Vagrant Downloads](http://downloads.vagrantup.com/) for a vagrant package suitable for your system. For all our tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

Next install test-kitchen:

    gem install test-kitchen kitchen-vagrant

Next install berkshelf for dependency management

    gem install berkshelf

Create a local kitchen configuration:

    cp .kitchen.local.yml{.example,}

You should now be able to run tests:

    kitchen test

http://kitchen.ci/docs/getting-started


## Contributors + Kudos

* Dominik Richter
* Christoph Hartmann
* Patrick Meier
* Bernhard K. Weisshuhn

This cookbook is mostly based on guides by:

* [Arch Linux wiki, Sysctl hardening](https://wiki.archlinux.org/index.php/Sysctl)
* [NSA: Guide to the Secure Configuration of Red Hat Enterprise Linux 5](www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf)
* [Ubuntu Security/Features](https://wiki.ubuntu.com/Security/Features)
* [Deutsche Telekom, Group IT Security, Security Requirements (German)](http://www.telekom.com/static/-/155996/7/technische-sicherheitsanforderungen-si)

Thanks to all of you!!



## TODO

* NSA 2.2.4.4 Enable Execute Disable (XD) or No Execute (NX) Support on 32-bit x86 Sys- tems for 32 bit systems
* ensure pam-cracklib is not configured at the same time as pam-passwdqc
* NSA 2.3.1.2 & 2.3.1.3, possibly via sudo module
* NSA 2.3.1.4 Block Shell and Login Access for Non-Root System Accounts
* NSA 2.3.1.5.1 Verify that No Accounts Have Empty Password Fields
* NSA 2.3.1.5.2 Verify that All Account Password Hashes are Shadowed
* NSA 2.3.1.6 Verify that No Non-Root Accounts Have UID 0
* NSA 2.3.1.7.1 Remove Password Parameters from libuser.conf
* NSA 2.3.1.8 Remove Legacy ’+’ Entries from Password Files
* NSA 2.3.2.2 Create and Maintain a Group Containing All Human Users


## License and Author

Author:: Dominik Richter <dominik.richter@googlemail.com>
Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
