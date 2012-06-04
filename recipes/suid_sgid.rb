#
# Cookbook Name:: security
# Recipe:: suid_sgid
#
# Copyright 2012, Dominik Richter
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# compile conditional items of the blacklist
# their attributes start with blacklist_
# any conditional item that is not enabled, goes into the whitelist
cb,cw = [],[]
[
# list of files   --   check (true if blacklist, false if whitelist)
[ node[:security][:suid_sgid][:blacklist_ipv6],             lambda{ node[:network][:ipv6][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_nfs],              lambda{ node[:network][:nfs][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_nfs4],             lambda{ node[:network][:nfs4][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_cron],             lambda{ not node[:security][:users][:allow].include?("cron")  }],
[ node[:security][:suid_sgid][:blacklist_consolemssaging],  lambda{ not node[:security][:users][:allow].include?("consolemssaging")  }],
[ node[:security][:suid_sgid][:blacklist_usermanagement],   lambda{ not node[:security][:users][:allow].include?("self_management")  }],
[ node[:security][:suid_sgid][:blacklist_locate],           lambda{ not node[:security][:users][:allow].include?("locate")  }],
[ node[:security][:suid_sgid][:blacklist_fuse],             lambda{ not node[:security][:users][:allow].include?("fuse")  }],
[ node[:security][:suid_sgid][:blacklist_sudo],             lambda{ node[:security][:sudo][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_pkexec],           lambda{ node[:security][:pkexec][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_desktop],          lambda{ node[:desktop][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_kerberos],         lambda{ node[:auth][:kerberos][:disable]  }],
[ node[:security][:suid_sgid][:blacklist_pam_caching],      lambda{ not node[:auth][:pam][:caching]  }],
# TODO: make conditional
[ node[:security][:suid_sgid][:blacklist_apache],           lambda{ true }],
[ node[:security][:suid_sgid][:blacklist_squid],            lambda{ true }]
].each do |c| 
  (c[1].call == true) ? (cb += c[0]) : (cw += c[0])
end


# make user-defined blacklist/whitelist override our default lists
sb = node[:security][:suid_sgid][:system_blacklist] + cb
sw = node[:security][:suid_sgid][:system_whitelist] + cw
b  = node[:security][:suid_sgid][:blacklist]
w  = node[:security][:suid_sgid][:whitelist]

blacklist = (sb - w + b).uniq
whitelist = (sw - b + w).uniq

# root    = "/"
dry_run   = node[:security][:suid_sgid][:dry_run_on_unkown]
root      = node[:env][:root_path]

# walk the blacklist and remove suid and sgid bits from these items
ruby_block "remove_suid_from_blacklists" do
  block { SuidSgid::remove_suid_sgid_from_blacklist(blacklist) }
end

# remove suid bits from unkown, if desired
ruby_block "remove_suid_from_unkown" do 
  block do 
    SuidSgid::remove_suid_sgid_from_unkown( whitelist, root, dry_run )
  end
end if node[:security][:suid_sgid][:remove_from_unkown] or node[:security][:suid_sgid][:dry_run_on_unkown]
