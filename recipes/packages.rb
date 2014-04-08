
# tp should be on every machine to ensure the time is synced
include_recipe "ntp"

# do package config for ubuntu
case node[:platform_family]
when "debian"
  include_recipe("apt")
end

# do package config for rhel-family
case node[:platform_family]
when "rhel", "fedora"
  include_recipe("os-hardening::yum")
end