# Change Log

## [v3.1.0](https://github.com/dev-sec/chef-os-hardening/tree/v3.1.0) (2018-05-14)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v3.0.0...v3.1.0)

**Fixed bugs:**

- fix metadata [\#204](https://github.com/dev-sec/chef-os-hardening/pull/204) ([chris-rock](https://github.com/chris-rock))

**Closed issues:**

- earlier version [\#205](https://github.com/dev-sec/chef-os-hardening/issues/205)
- Make auditd recipe optional [\#200](https://github.com/dev-sec/chef-os-hardening/issues/200)
- Dependency on pinned, old version of sysctl [\#192](https://github.com/dev-sec/chef-os-hardening/issues/192)
- compat\_resource deprecated [\#186](https://github.com/dev-sec/chef-os-hardening/issues/186)
- Usage of azure as cloud provider for CI [\#183](https://github.com/dev-sec/chef-os-hardening/issues/183)

**Merged pull requests:**

- Test with Foodcritic 13 [\#212](https://github.com/dev-sec/chef-os-hardening/pull/212) ([tas50](https://github.com/tas50))
- Test on Ruby 2.4.4 [\#211](https://github.com/dev-sec/chef-os-hardening/pull/211) ([tas50](https://github.com/tas50))
- use sysctl 1.0 [\#210](https://github.com/dev-sec/chef-os-hardening/pull/210) ([dhohengassner](https://github.com/dhohengassner))
- added mail\_dir attribute and moved component attributes to attributes… [\#209](https://github.com/dev-sec/chef-os-hardening/pull/209) ([ekelson-bcove](https://github.com/ekelson-bcove))
- improve testing around amazon linux [\#202](https://github.com/dev-sec/chef-os-hardening/pull/202) ([chris-rock](https://github.com/chris-rock))
- Container support and dokken tests in travis CI [\#199](https://github.com/dev-sec/chef-os-hardening/pull/199) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Lazy pin the sysctl major version [\#197](https://github.com/dev-sec/chef-os-hardening/pull/197) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Feature/allow setting template source [\#196](https://github.com/dev-sec/chef-os-hardening/pull/196) ([eyespies](https://github.com/eyespies))
- Unpin sysctl dependency [\#195](https://github.com/dev-sec/chef-os-hardening/pull/195) ([artem-sidorenko](https://github.com/artem-sidorenko))
- add basic support for amazon linux [\#194](https://github.com/dev-sec/chef-os-hardening/pull/194) ([chris-rock](https://github.com/chris-rock))
- Fix fedora shadow permissions [\#190](https://github.com/dev-sec/chef-os-hardening/pull/190) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Fedora 25 is EOL, replacing with 27 [\#189](https://github.com/dev-sec/chef-os-hardening/pull/189) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Remove dependency on compat\_resource [\#188](https://github.com/dev-sec/chef-os-hardening/pull/188) ([bablakely](https://github.com/bablakely))

## [v3.0.0](https://github.com/dev-sec/chef-os-hardening/tree/v3.0.0) (2017-12-21)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v2.1.1...v3.0.0)

**Closed issues:**

- os-10 from linux-baseline is missing [\#167](https://github.com/dev-sec/chef-os-hardening/issues/167)
- Removal of core dump hardening configuration if core dumps are allowed [\#165](https://github.com/dev-sec/chef-os-hardening/issues/165)
- Integration testing of this cookbook in the CI [\#142](https://github.com/dev-sec/chef-os-hardening/issues/142)
- Selinux enforcing support for RHEL/Centos? [\#106](https://github.com/dev-sec/chef-os-hardening/issues/106)
- If I "enable" core dumps with chef-os-hardening, am I really fully enabling core dumps? [\#105](https://github.com/dev-sec/chef-os-hardening/issues/105)

**Merged pull requests:**

- Skip auditd tests [\#181](https://github.com/dev-sec/chef-os-hardening/pull/181) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Make fedora tests pass [\#179](https://github.com/dev-sec/chef-os-hardening/pull/179) ([shoekstra](https://github.com/shoekstra))
- Control ownership of /var/log [\#178](https://github.com/dev-sec/chef-os-hardening/pull/178) ([shoekstra](https://github.com/shoekstra))
- RH family: adapt some settings, as RH has better defaults [\#177](https://github.com/dev-sec/chef-os-hardening/pull/177) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Fix for fedora: lets use generic package resource [\#176](https://github.com/dev-sec/chef-os-hardening/pull/176) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Kitchen: Using the same names for platforms for different drivers [\#175](https://github.com/dev-sec/chef-os-hardening/pull/175) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Enable core dumps if they are enabled via attribute [\#174](https://github.com/dev-sec/chef-os-hardening/pull/174) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Selinux enforcing support for RHEL/Centos [\#173](https://github.com/dev-sec/chef-os-hardening/pull/173) ([AnMoeller](https://github.com/AnMoeller))
- Kitchen: Update of testing boxes/images [\#172](https://github.com/dev-sec/chef-os-hardening/pull/172) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Lets disable unused filesystems per default [\#169](https://github.com/dev-sec/chef-os-hardening/pull/169) ([artem-sidorenko](https://github.com/artem-sidorenko))

## [v2.1.1](https://github.com/dev-sec/chef-os-hardening/tree/v2.1.1) (2017-08-21)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v2.1.0...v2.1.1)

**Closed issues:**

- Cookbook fails on CentOS Linux release 7.2.1511 - kernel.exec-shield [\#166](https://github.com/dev-sec/chef-os-hardening/issues/166)

**Merged pull requests:**

- Fix: do not touch exec-shield on RHEL 7 [\#168](https://github.com/dev-sec/chef-os-hardening/pull/168) ([artem-sidorenko](https://github.com/artem-sidorenko))

## [v2.1.0](https://github.com/dev-sec/chef-os-hardening/tree/v2.1.0) (2017-06-12)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v2.0.1...v2.1.0)

**Closed issues:**

- Testing of chef 13 in the CI [\#155](https://github.com/dev-sec/chef-os-hardening/issues/155)
- auditd package is not installed [\#145](https://github.com/dev-sec/chef-os-hardening/issues/145)
- Procps conditional failing [\#48](https://github.com/dev-sec/chef-os-hardening/issues/48)

**Merged pull requests:**

- CI: update to ruby 2.4.1 and gem update [\#164](https://github.com/dev-sec/chef-os-hardening/pull/164) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Proper testing if kernel modules are disabled [\#163](https://github.com/dev-sec/chef-os-hardening/pull/163) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Proper permissions for shadow on debian family [\#162](https://github.com/dev-sec/chef-os-hardening/pull/162) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Support auditd installation on different distros [\#161](https://github.com/dev-sec/chef-os-hardening/pull/161) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Docs: fix the wrong kitchen URL and add inspec [\#160](https://github.com/dev-sec/chef-os-hardening/pull/160) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Chef 13 and 12 CI testing and cleanup of EOL distros [\#159](https://github.com/dev-sec/chef-os-hardening/pull/159) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Install auditd package [\#158](https://github.com/dev-sec/chef-os-hardening/pull/158) ([artem-sidorenko](https://github.com/artem-sidorenko))

## [v2.0.1](https://github.com/dev-sec/chef-os-hardening/tree/v2.0.1) (2017-04-11)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v2.0.0...v2.0.1)

**Fixed bugs:**

- \['os-hardening'\]\['desktop'\]\['enable'\] is missing in 2.0.0 [\#153](https://github.com/dev-sec/chef-os-hardening/issues/153)

**Merged pull requests:**

- Default value for \['os-hardening'\]\['desktop'\]\['enable'\] [\#154](https://github.com/dev-sec/chef-os-hardening/pull/154) ([artem-sidorenko](https://github.com/artem-sidorenko))

## [v2.0.0](https://github.com/dev-sec/chef-os-hardening/tree/v2.0.0) (2017-04-06)
[Full Changelog](https://github.com/dev-sec/chef-os-hardening/compare/v1.4.1...v2.0.0)

**Implemented enhancements:**

- Remove dependenies to apt and yum cookbooks. [\#132](https://github.com/dev-sec/chef-os-hardening/pull/132) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Using braket syntax to resolve deprecation message [\#131](https://github.com/dev-sec/chef-os-hardening/pull/131) ([artem-sidorenko](https://github.com/artem-sidorenko))
- remove old content [\#126](https://github.com/dev-sec/chef-os-hardening/pull/126) ([chris-rock](https://github.com/chris-rock))
- Own attribute namespace for os-hardening [\#114](https://github.com/dev-sec/chef-os-hardening/pull/114) ([joshmyers](https://github.com/joshmyers))

**Closed issues:**

- pam\_passwdqc package install idempotence [\#134](https://github.com/dev-sec/chef-os-hardening/issues/134)
- Openhub is not up to date [\#129](https://github.com/dev-sec/chef-os-hardening/issues/129)
- login.defs.erb contains a non-ASCII character which causes a knife cookbook upload failure [\#122](https://github.com/dev-sec/chef-os-hardening/issues/122)
- fixing the 4 rspec failure [\#121](https://github.com/dev-sec/chef-os-hardening/issues/121)
- pam node attribute namespace error [\#118](https://github.com/dev-sec/chef-os-hardening/issues/118)
- Use travis for integration testing [\#115](https://github.com/dev-sec/chef-os-hardening/issues/115)
- attributes need to be localized to the `node\['chef-os-hardening'\]` namespace [\#113](https://github.com/dev-sec/chef-os-hardening/issues/113)

**Merged pull requests:**

- Docs: removing obsolete sysctl hint [\#151](https://github.com/dev-sec/chef-os-hardening/pull/151) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Moving the attributes with dependencies on other attributes to the recipes [\#150](https://github.com/dev-sec/chef-os-hardening/pull/150) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Cleanup of sysctl dependency [\#149](https://github.com/dev-sec/chef-os-hardening/pull/149) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Disable entropy testing [\#146](https://github.com/dev-sec/chef-os-hardening/pull/146) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Execute integration tests in DigitalOcean [\#144](https://github.com/dev-sec/chef-os-hardening/pull/144) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Update of Gemfile [\#141](https://github.com/dev-sec/chef-os-hardening/pull/141) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Remove dependenies to apt and yum cookbooks. [\#140](https://github.com/dev-sec/chef-os-hardening/pull/140) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Update of kitchen vagrant file [\#139](https://github.com/dev-sec/chef-os-hardening/pull/139) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Fix the version in metadata.rb [\#138](https://github.com/dev-sec/chef-os-hardening/pull/138) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Cleanup, update of links in readme [\#137](https://github.com/dev-sec/chef-os-hardening/pull/137) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Use caching to improve spec performance [\#136](https://github.com/dev-sec/chef-os-hardening/pull/136) ([ncs-alane](https://github.com/ncs-alane))
- Add attribute to control login.defs PASS\_WARN\_AGE [\#135](https://github.com/dev-sec/chef-os-hardening/pull/135) ([ncs-alane](https://github.com/ncs-alane))
- Revert "Remove dependenies to apt and yum cookbooks." [\#133](https://github.com/dev-sec/chef-os-hardening/pull/133) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Update test-kitchen settings [\#130](https://github.com/dev-sec/chef-os-hardening/pull/130) ([shortdudey123](https://github.com/shortdudey123))
- Opscode =\> Chef [\#128](https://github.com/dev-sec/chef-os-hardening/pull/128) ([shortdudey123](https://github.com/shortdudey123))
- Update Rubocop, Foodcritic, and Chefspec coverage [\#127](https://github.com/dev-sec/chef-os-hardening/pull/127) ([shortdudey123](https://github.com/shortdudey123))
- Fix links to opensource tools in README [\#125](https://github.com/dev-sec/chef-os-hardening/pull/125) ([netflash](https://github.com/netflash))
- FIX for issue \#122 non-ASCII character [\#124](https://github.com/dev-sec/chef-os-hardening/pull/124) ([atomic111](https://github.com/atomic111))
- Update rhel\_system\_auth.erb [\#120](https://github.com/dev-sec/chef-os-hardening/pull/120) ([phillym](https://github.com/phillym))
- \[pam-attr-namespace-fix\] [\#119](https://github.com/dev-sec/chef-os-hardening/pull/119) ([rljohnsn](https://github.com/rljohnsn))
- Use new InSpec integration tests [\#117](https://github.com/dev-sec/chef-os-hardening/pull/117) ([chris-rock](https://github.com/chris-rock))
- Fix issues highlighted in \#114 [\#116](https://github.com/dev-sec/chef-os-hardening/pull/116) ([chris-rock](https://github.com/chris-rock))

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