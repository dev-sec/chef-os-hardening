# Changelog

## 1.3.0

* feature: implement ipv6 router advertisement settings #78
* feature: chef 11 and chef 12 support #77
* feature: RHN config check #71
* bugfix: 12.4.0 support #81
* bugfix SUID/SGID bit cleaning API spelling

## 1.2.0

* feature: make UID and GID_MIN configurable in login.defs
* feature: integrate chefspec
* improvement: linting
* improvement: only restart procps for sysctl when necessary
* improvement: cpu detection for lockdown profile
* bugfix: add missing ohai dependency for standalone installation
* bugfix: site location in Berkshelf


## 1.1.2

* improvement: extend support for chef-sysctl from 0.3.x-0.6.x
* improvement: fix linting to current rubocop (0.25)

## 1.1.1

* improvement: specified supported operating systems in metadata

## 1.1.0

* improvement: remove NTP from os-hardening
  Configure it via upstream modules as needed
  We might add a NTP hardening layer in the future
* improvement: move /usr/bin/screen to SGID whitelisting
* improvement: changed the log_martians value to 0 in attributes/sysctl.rb
* bugfix: make sysctl arp restrictions apply to all devices

* improvement: unify linting and testing; includes huge improvements to style and test scope
* improvement: make kitchen run optional in guard, use export RUN_KITCHEN=true to enable it
* improvement: clarify SUID/SGID options in readme

## 1.0.1

* feature: remove some dangerous packages by default
* improvement: added contributor guideline
* bugfix: correctly enable sysrqs if desired
* bugfix: determine ipv6 forwarding from user forwarding + ipv6 configuration
* bugfix: determine ipv4 forwarding from user forwarding configuration

## 1.0.0

* imported hardening project and updated to current version with full test suite
