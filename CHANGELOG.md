# Change Log

## [v1.4.1](https://github.com/dev-sec/chef-os-hardening/tree/v1.4.1) (2016-05-29)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.3.1...v1.4.1)

**Implemented enhancements:**

- Update changelog [\#103](https://github.com/dev-sec/chef-os-hardening/pull/103) ([chris-rock](https://github.com/chris-rock))
- added inspec to gemfile and inspec verifier to kitchen.yml [\#101](https://github.com/dev-sec/chef-os-hardening/pull/101) ([atomic111](https://github.com/atomic111))

**Closed issues:**

- pam recipe failing with chef client \> 12.8.1 [\#112](https://github.com/dev-sec/chef-os-hardening/issues/112)
- pam\_passwdqc installation fails on CentOS 7.1 [\#102](https://github.com/dev-sec/chef-os-hardening/issues/102)
- tests fail in travis [\#94](https://github.com/dev-sec/chef-os-hardening/issues/94)
- Fails when used in conjunction with openldap::auth recipe [\#91](https://github.com/dev-sec/chef-os-hardening/issues/91)
- packages with known issues are not actually removed on debian/ubuntu [\#90](https://github.com/dev-sec/chef-os-hardening/issues/90)
- Actually log martians? [\#89](https://github.com/dev-sec/chef-os-hardening/issues/89)
- Archlinux doesn't have a limits.d directory by default [\#84](https://github.com/dev-sec/chef-os-hardening/issues/84)
- Support Centos 7 [\#79](https://github.com/dev-sec/chef-os-hardening/issues/79)

**Merged pull requests:**

- Pam options and fixes [\#111](https://github.com/dev-sec/chef-os-hardening/pull/111) ([foonix](https://github.com/foonix))
- Enable martian logging for ipv4 [\#109](https://github.com/dev-sec/chef-os-hardening/pull/109) ([foonix](https://github.com/foonix))
- Initial support for CentOS/RHEL 5 [\#108](https://github.com/dev-sec/chef-os-hardening/pull/108) ([foonix](https://github.com/foonix))
- Enable pam\_pwquality in rhel-family \> 7 [\#104](https://github.com/dev-sec/chef-os-hardening/pull/104) ([boldandbusted](https://github.com/boldandbusted))
- Fix bug in execute\[update-pam\] resource in newer version of Chef. [\#100](https://github.com/dev-sec/chef-os-hardening/pull/100) ([patcon](https://github.com/patcon))
- Expose list of packages to remove as an attribute [\#99](https://github.com/dev-sec/chef-os-hardening/pull/99) ([mikemoate](https://github.com/mikemoate))
- Fix pam\_passwdqc template [\#98](https://github.com/dev-sec/chef-os-hardening/pull/98) ([chris-rock](https://github.com/chris-rock))
- Berkshelf 4 Upgrade and Ruby 1.9.3 drop [\#96](https://github.com/dev-sec/chef-os-hardening/pull/96) ([chris-rock](https://github.com/chris-rock))
- Remove packages with known issues on debian/ubuntu [\#93](https://github.com/dev-sec/chef-os-hardening/pull/93) ([mikemoate](https://github.com/mikemoate))
- Add SINGLE and PROMPT parameters. [\#92](https://github.com/dev-sec/chef-os-hardening/pull/92) ([foonix](https://github.com/foonix))
- update common kitchen.yml platforms [\#87](https://github.com/dev-sec/chef-os-hardening/pull/87) ([chris-rock](https://github.com/chris-rock))
- Allow sys uid min/max and sys gid min/max to be configured [\#86](https://github.com/dev-sec/chef-os-hardening/pull/86) ([joshgarnett](https://github.com/joshgarnett))
- fixes \#84 [\#85](https://github.com/dev-sec/chef-os-hardening/pull/85) ([chris-rock](https://github.com/chris-rock))

## [v1.3.1](https://github.com/dev-sec/chef-os-hardening/tree/v1.3.1) (2015-07-04)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.3.0...v1.3.1)

**Closed issues:**

- 1.3.0 release on supermarket is broken [\#83](https://github.com/dev-sec/chef-os-hardening/issues/83)

## [v1.3.0](https://github.com/dev-sec/chef-os-hardening/tree/v1.3.0) (2015-06-29)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.2.0...v1.3.0)

**Closed issues:**

- possible incompatibility with Chef client release 12.4 [\#82](https://github.com/dev-sec/chef-os-hardening/issues/82)
- ERROR: No resource or method named `File' for `Chef::Recipe "sysctl"' [\#80](https://github.com/dev-sec/chef-os-hardening/issues/80)
- update tutorial.md [\#67](https://github.com/dev-sec/chef-os-hardening/issues/67)
- Installation doesnt work [\#66](https://github.com/dev-sec/chef-os-hardening/issues/66)

**Merged pull requests:**

- Update sysctl.rb [\#81](https://github.com/dev-sec/chef-os-hardening/pull/81) ([Rockstar04](https://github.com/Rockstar04))
- feature: implement ipv6 router advertisement settings [\#78](https://github.com/dev-sec/chef-os-hardening/pull/78) ([chris-rock](https://github.com/chris-rock))
- update common Gemfile for chef11+12 [\#77](https://github.com/dev-sec/chef-os-hardening/pull/77) ([arlimus](https://github.com/arlimus))
- common files: centos7 + rubocop [\#76](https://github.com/dev-sec/chef-os-hardening/pull/76) ([arlimus](https://github.com/arlimus))
- update common kitchen.yml platforms [\#75](https://github.com/dev-sec/chef-os-hardening/pull/75) ([arlimus](https://github.com/arlimus))
- update common readme badges [\#74](https://github.com/dev-sec/chef-os-hardening/pull/74) ([arlimus](https://github.com/arlimus))
- fix SUID/SGID bit cleaning API spelling \(unkown -\> unknown\) [\#72](https://github.com/dev-sec/chef-os-hardening/pull/72) ([dupuy](https://github.com/dupuy))
- RHN config check should work [\#71](https://github.com/dev-sec/chef-os-hardening/pull/71) ([rapenchukd](https://github.com/rapenchukd))
- update tutorial [\#68](https://github.com/dev-sec/chef-os-hardening/pull/68) ([chris-rock](https://github.com/chris-rock))

## [v1.2.0](https://github.com/dev-sec/chef-os-hardening/tree/v1.2.0) (2015-01-08)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.1.2...v1.2.0)

**Fixed bugs:**

- Chef::Exceptions::Exec: yum\_package\[xinetd\] \(os-hardening::yum line 50\) [\#57](https://github.com/dev-sec/chef-os-hardening/issues/57)

**Closed issues:**

- deactivate pw\_max\_age [\#58](https://github.com/dev-sec/chef-os-hardening/issues/58)
- can't convert String into Integer for package 'pam-ccreds' [\#54](https://github.com/dev-sec/chef-os-hardening/issues/54)
- Better error handling for cpu detection [\#42](https://github.com/dev-sec/chef-os-hardening/issues/42)
- ChefSpec and Ohai/Fauxhai: cpu  [\#41](https://github.com/dev-sec/chef-os-hardening/issues/41)

**Merged pull requests:**

- updating common files [\#65](https://github.com/dev-sec/chef-os-hardening/pull/65) ([arlimus](https://github.com/arlimus))
- Idempotency [\#64](https://github.com/dev-sec/chef-os-hardening/pull/64) ([rmoriz](https://github.com/rmoriz))
- Badges [\#63](https://github.com/dev-sec/chef-os-hardening/pull/63) ([chris-rock](https://github.com/chris-rock))
- make uid\_min and gid\_min of login.defs configurable [\#62](https://github.com/dev-sec/chef-os-hardening/pull/62) ([bkw](https://github.com/bkw))
- standalone installation needs ohai cookbook as dep [\#61](https://github.com/dev-sec/chef-os-hardening/pull/61) ([aschmidt75](https://github.com/aschmidt75))
- updating common files [\#59](https://github.com/dev-sec/chef-os-hardening/pull/59) ([arlimus](https://github.com/arlimus))
- fix chefspec depreciation warning about `should` [\#56](https://github.com/dev-sec/chef-os-hardening/pull/56) ([bkw](https://github.com/bkw))
- improve cpu detection and implement intel fallback [\#55](https://github.com/dev-sec/chef-os-hardening/pull/55) ([chris-rock](https://github.com/chris-rock))
- updating common files [\#53](https://github.com/dev-sec/chef-os-hardening/pull/53) ([arlimus](https://github.com/arlimus))
- chefspec test for limites [\#52](https://github.com/dev-sec/chef-os-hardening/pull/52) ([chris-rock](https://github.com/chris-rock))
- Introduce Chef Spec [\#51](https://github.com/dev-sec/chef-os-hardening/pull/51) ([chris-rock](https://github.com/chris-rock))
- improvement: switch to site location in berkshelf [\#50](https://github.com/dev-sec/chef-os-hardening/pull/50) ([chris-rock](https://github.com/chris-rock))
- bugfix: fix failing conditional for procps [\#49](https://github.com/dev-sec/chef-os-hardening/pull/49) ([arlimus](https://github.com/arlimus))
- Drop procps service [\#47](https://github.com/dev-sec/chef-os-hardening/pull/47) ([bkw](https://github.com/bkw))

## [v1.1.2](https://github.com/dev-sec/chef-os-hardening/tree/v1.1.2) (2014-09-08)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.1.1...v1.1.2)

**Closed issues:**

- sysctl dependency [\#44](https://github.com/dev-sec/chef-os-hardening/issues/44)

**Merged pull requests:**

- Sysctl update to 0.6.0 [\#46](https://github.com/dev-sec/chef-os-hardening/pull/46) ([arlimus](https://github.com/arlimus))
- Lint [\#43](https://github.com/dev-sec/chef-os-hardening/pull/43) ([chris-rock](https://github.com/chris-rock))
- add more documentation about test run [\#40](https://github.com/dev-sec/chef-os-hardening/pull/40) ([chris-rock](https://github.com/chris-rock))

## [v1.1.1](https://github.com/dev-sec/chef-os-hardening/tree/v1.1.1) (2014-07-28)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.1.0...v1.1.1)

## [v1.1.0](https://github.com/dev-sec/chef-os-hardening/tree/v1.1.0) (2014-07-28)
**Implemented enhancements:**

- Conservative package update [\#10](https://github.com/dev-sec/chef-os-hardening/issues/10)

**Closed issues:**

- Tagged Release [\#34](https://github.com/dev-sec/chef-os-hardening/issues/34)
- passwordless users not able to log in [\#32](https://github.com/dev-sec/chef-os-hardening/issues/32)
- remove ntp [\#19](https://github.com/dev-sec/chef-os-hardening/issues/19)
- Tests for suid bits [\#15](https://github.com/dev-sec/chef-os-hardening/issues/15)
- forwarding isnt configured [\#9](https://github.com/dev-sec/chef-os-hardening/issues/9)
- properly handle sysctl again [\#8](https://github.com/dev-sec/chef-os-hardening/issues/8)
- enfore security updates [\#7](https://github.com/dev-sec/chef-os-hardening/issues/7)
- enable\_sysrq-check is faulty [\#6](https://github.com/dev-sec/chef-os-hardening/issues/6)
- Validate suid-bit removal from /bin/screen [\#5](https://github.com/dev-sec/chef-os-hardening/issues/5)

**Merged pull requests:**

- updated kitchen images to current batch \(mysql-equivalent\) [\#39](https://github.com/dev-sec/chef-os-hardening/pull/39) ([arlimus](https://github.com/arlimus))
- intend fix [\#38](https://github.com/dev-sec/chef-os-hardening/pull/38) ([chris-rock](https://github.com/chris-rock))
- fix wrong class definition [\#37](https://github.com/dev-sec/chef-os-hardening/pull/37) ([arlimus](https://github.com/arlimus))
- fix wrong class definition [\#36](https://github.com/dev-sec/chef-os-hardening/pull/36) ([chris-rock](https://github.com/chris-rock))
- add commont lint task. fix issues [\#35](https://github.com/dev-sec/chef-os-hardening/pull/35) ([ehaselwanter](https://github.com/ehaselwanter))
- update with common run\_all\_linters task [\#33](https://github.com/dev-sec/chef-os-hardening/pull/33) ([ehaselwanter](https://github.com/ehaselwanter))
- add Gemfile.lock to ignore list and remove it from tree [\#31](https://github.com/dev-sec/chef-os-hardening/pull/31) ([ehaselwanter](https://github.com/ehaselwanter))
- streamline .rubocop config [\#30](https://github.com/dev-sec/chef-os-hardening/pull/30) ([ehaselwanter](https://github.com/ehaselwanter))
- bugfix: make sysctl arp restrictions apply to all [\#29](https://github.com/dev-sec/chef-os-hardening/pull/29) ([arlimus](https://github.com/arlimus))
- Lint [\#28](https://github.com/dev-sec/chef-os-hardening/pull/28) ([chris-rock](https://github.com/chris-rock))
- various rubocop style fixes [\#27](https://github.com/dev-sec/chef-os-hardening/pull/27) ([ehaselwanter](https://github.com/ehaselwanter))
- fix FC019: Access node attributes in a consistent manner, use single quotes [\#26](https://github.com/dev-sec/chef-os-hardening/pull/26) ([ehaselwanter](https://github.com/ehaselwanter))
- make kitchen run optional, ignore shred test repo [\#25](https://github.com/dev-sec/chef-os-hardening/pull/25) ([ehaselwanter](https://github.com/ehaselwanter))
- changed the log\_martians value to 0 in attributes/sysctl.rb [\#24](https://github.com/dev-sec/chef-os-hardening/pull/24) ([atomic111](https://github.com/atomic111))
- improvement: clarify SUID/SGID options in readme [\#23](https://github.com/dev-sec/chef-os-hardening/pull/23) ([arlimus](https://github.com/arlimus))
- be more forgiving and relax rubocop [\#22](https://github.com/dev-sec/chef-os-hardening/pull/22) ([ehaselwanter](https://github.com/ehaselwanter))
- add linting, spec, guard infrastructure as well as config files [\#21](https://github.com/dev-sec/chef-os-hardening/pull/21) ([ehaselwanter](https://github.com/ehaselwanter))
- remove ntp [\#20](https://github.com/dev-sec/chef-os-hardening/pull/20) ([arlimus](https://github.com/arlimus))
- new gem release for sharing just the integration folder [\#18](https://github.com/dev-sec/chef-os-hardening/pull/18) ([ehaselwanter](https://github.com/ehaselwanter))
- Use shared test-repo [\#17](https://github.com/dev-sec/chef-os-hardening/pull/17) ([ehaselwanter](https://github.com/ehaselwanter))
- improvement: move /usr/bin/screen to SGID whitelisting [\#14](https://github.com/dev-sec/chef-os-hardening/pull/14) ([arlimus](https://github.com/arlimus))
- Packages [\#12](https://github.com/dev-sec/chef-os-hardening/pull/12) ([chris-rock](https://github.com/chris-rock))
- sysctl fixes [\#11](https://github.com/dev-sec/chef-os-hardening/pull/11) ([arlimus](https://github.com/arlimus))
- Contributing guide [\#4](https://github.com/dev-sec/chef-os-hardening/pull/4) ([arlimus](https://github.com/arlimus))
- Bugfix: broken link for debian wheezy vagrant box in .kitchen.yml and also broken link for NSA RedHat security guide in README.md [\#3](https://github.com/dev-sec/chef-os-hardening/pull/3) ([atomic111](https://github.com/atomic111))
- add license and improve styling [\#2](https://github.com/dev-sec/chef-os-hardening/pull/2) ([chris-rock](https://github.com/chris-rock))
- Fix: markdown fix in TUTORIAL.md [\#1](https://github.com/dev-sec/chef-os-hardening/pull/1) ([atomic111](https://github.com/atomic111))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*