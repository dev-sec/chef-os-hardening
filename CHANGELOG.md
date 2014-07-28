# Changelog

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
