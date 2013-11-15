name             "os-hardening"
maintainer       "Dominik Richter"
maintainer_email "dominik.richter@googlemail.com"
license          "Apache 2.0"
description      "Installs/Configures security"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

depends 'sysctl', '0.3.4'

recipe 'os-hardening::default', 'harden the operating system (all recipes)'
recipe 'os-hardening::minimize_access', 'enforce minimal file permissions'
recipe 'os-hardening::pam'
recipe 'os-hardening::securetty'
recipe 'os-hardening::suid_sgid'
recipe 'os-hardening::sysctl', 'set sane sysctl values'
