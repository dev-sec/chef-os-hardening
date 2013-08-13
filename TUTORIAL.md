# Tutorial

## Deutsche Telekom AG

# Debian / Ubuntu

1. Install ruby

apt-get install ruby1.9.1-full

2. Install chef

gem1.9.1 install chef

3. May be you have to adjust the PATH variable

export PATH=$PATH:/var/lib/gems/1.9.1/bin/

4. Download the chef cookbook

git clone ..........

5. Rename the folder

mv /vagrant/cookbooks/chef-os-hardening/ /vagrant/cookbooks/os-hardening/

6. Create solo.rb
Solo.rb file is used to specify the configuration details for chef-solo. So create a solo.rb under /vagrant/ that include the cookbook_path.

cookbook_path "/vagrant/cookbooks"

7. Create solo.json

Chef-solo does not interact with the Chef Server. Consequently, node-specific attributes must be located in a JSON file on the target system. Create the folowing solo.json.

{
        "run_list":[
                "recipe[os-hardening]"
                ]
}

9. Adjust the attributes/default.rb

Adjust the attribute default['security']['suid_sgid']['remove_from_unkown'] to true. Then it remove all suid and sgid bits. Also read the 

default['security']['suid_sgid']['remove_from_unkown'] = true

8. Run chef-solo

chef-solo -c /vagrant/solo.rb -j solo.json


