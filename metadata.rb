name             "base-os-hardening"
maintainer       "Dominik Richter"
maintainer_email "dominik.richter@googlemail.com"
license          "Apache 2.0"
description      "Installs/Configures security"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

depends 'sysctl', '0.3.4'

recipe 'base-os-hardening::default', 'harden the operating system (all recipes)'
recipe 'base-os-hardening::limits', 'prevent core dumps'
recipe 'base-os-hardening::login_defs', 'harden /etc/login.defs'
recipe 'base-os-hardening::minimize_access', 'enforce minimal file permissions'
recipe 'base-os-hardening::pam', 'configure sane values for PAM'
recipe 'base-os-hardening::profile', 'harden settings in /etc/profile.d'
recipe 'base-os-hardening::securetty', 'limit the allowed TTYs for root login'
recipe 'base-os-hardening::suid_sgid', 'reduce SUID and SGID bits in the filesystem'
recipe 'base-os-hardening::sysctl', 'set sane sysctl values'
