
# tp should be on every machine to ensure the time is synced
include_recipe "ntp"

case node[:platform]
  # do package config for ubuntu
  when "debian", "ubuntu"
    include_recipe "apt"

  # do package config for rhel-family
  when "redhat", "centos", "fedora", "amazon", "oracle", "scientific"
    # RedHat + CentOS
    include_recipe "base-os-hardening::yum"
end