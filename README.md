# os-hardening (Chef cookbook)

[![Supermarket](http://img.shields.io/cookbook/v/os-hardening.svg)][1]
[![Build Status](http://img.shields.io/travis/hardening-io/chef-os-hardening.svg)][2]
[![Code Coverage](http://img.shields.io/coveralls/hardening-io/chef-os-hardening.svg)][3]
[![Dependencies](http://img.shields.io/gemnasium/hardening-io/chef-os-hardening.svg)][4]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][5]

## Description

This cookbook provides numerous security-related configurations, providing all-round base protection.

It configures:

 * Configures package management e.g. allows only signed packages
 * Remove packages with known issues
 * Configures `pam` and `pam_limits` module
 * Shadow password suite configuration
 * Configures system path permissions
 * Disable core dumps via soft limits
 * Restrict Root Logins to System Console
 * Set SUIDs
 * Configures kernel parameters via sysctl

It will not:

 * Update system packages
 * Install security patches

## Requirements

* Opscode chef
* Cookbooks:
  * Opscode sysctl `https://github.com/onehealth-cookbooks/sysctl`
  * Opscode apt `https://github.com/opscode-cookbooks/apt.git`
  * Opscode yum `https://github.com/opscode-cookbooks/yum.git`

**Note for `sysctl` usage:**

We deprecated `sysctl` version before `0.6.0`. Future versions of this cookbook will depend on version 0.6.0 and greater. If you are going to use version 0.6.0, use `sysctl::apply` instead of `sysctl::default` in your runlist to ensure the configuration change will be applied.

*Optional*: you can use [berkshelf](http://berkshelf.com/) to install dependencies.

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
* `['security']['suid_sgid']['remove_from_unknown'] = false`
  true if you want to remove SUID/SGID bits from any file, that is not explicitly configured in a `blacklist`. This will make every Chef run search through the mounted filesystems looking for SUID/SGID bits that are not configured in the default and user blacklist. If it finds an SUID/SGID bit, it will be removed, unless this file is in your `whitelist`.
* `['security']['suid_sgid']['dry_run_on_unknown'] = false`
  like `remove_from_unknown` above, only that SUID/SGID bits aren't removed.
  It will still search the filesystems to look for SUID/SGID bits but it will only print them in your log. This option is only ever recommended, when you first configure `remove_from_unknown` for SUID/SGID bits, so that you can see the files that are being changed and make adjustments to your `whitelist` and `blacklist`.
* `['security']['packages']['clean']  = true` 
  removes packages with known issues. See section packages.

## Packages

We remove the following packages:

 * xinetd ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.1)
 * inetd ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.1)
 * tftp-server ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.5)
 * ypserv ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.4)
 * telnet-server ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.2)
 * rsh-server ([NSA](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf), Chapter 3.2.3)

## Usage

Add the recipes to the `run_list`, it should be last:

    "recipe[os-hardening]"

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

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

http://kitchen.ci/docs/getting-started


## Contributors + Kudos

* Dominik Richter [arlimus](https://github.com/arlimus)
* Bernhard Weisshuhn [bkw](https://github.com/bkw)
* Christoph Hartmann [chris-rock](https://github.com/chris-rock)
* Edmund Haselwanter [ehaselwanter](https://github.com/ehaselwanter)
* Patrick Meier [atomic111](https://github.com/atomic111)

This cookbook is mostly based on guides by:

* [Arch Linux wiki, Sysctl hardening](https://wiki.archlinux.org/index.php/Sysctl)
* [NSA: Guide to the Secure Configuration of Red Hat Enterprise Linux 5](http://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf)
* [Ubuntu Security/Features](https://wiki.ubuntu.com/Security/Features)
* [Deutsche Telekom, Group IT Security, Security Requirements (German)](http://www.telekom.com/static/-/155996/7/technische-sicherheitsanforderungen-si)

Thanks to all of you!!

## Contributing

See [contributor guideline](CONTRIBUTING.md).

## License and Author

* Author:: Dominik Richter <dominik.richter@googlemail.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://supermarket.getchef.com/cookbooks/os-hardening
[2]: http://travis-ci.org/hardening-io/chef-os-hardening
[3]: https://coveralls.io/r/hardening-io/chef-os-hardening
[4]: https://gemnasium.com/hardening-io/chef-os-hardening
[5]: https://gitter.im/hardening-io/general
