name             "os-hardening"
maintainer       "Dominik Richter"
maintainer_email "dominik.richter@googlemail.com"
license          "Apache 2.0"
description      "Installs/Configures security"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.1"

depends 'sysctl', '0.3.4'
depends 'apt'
depends 'yum'

recipe 'os-hardening::default', 'harden the operating system (all recipes)'
recipe 'os-hardening::limits', 'prevent core dumps'
recipe 'os-hardening::login_defs', 'harden /etc/login.defs'
recipe 'os-hardening::minimize_access', 'enforce minimal file permissions'
recipe 'os-hardening::pam', 'configure sane values for PAM'
recipe 'os-hardening::profile', 'harden settings in /etc/profile.d'
recipe 'os-hardening::securetty', 'limit the allowed TTYs for root login'
recipe 'os-hardening::suid_sgid', 'reduce SUID and SGID bits in the filesystem'
recipe 'os-hardening::sysctl', 'set sane sysctl values'
