# Tutorial

If you start with chef for the first time, we advise you to use a virtual machine for testing.

## Debian / Ubuntu for testing with ChefDK

1. Install [ChefDK client](https://www.chef.io/download-chef-client/)

We recommend to use Chef client in production environments instead of the ChefDK

```bash
apt-get install -y wget
wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb
dpkg -i chefdk_0.3.5-1_amd64.deb
```

3. Download the chef cookbook

```bash
apt-get install git
git clone https://github.com/TelekomLabs/chef-os-hardening.git chef-os-hardening
```

4. Download cookbook dependences with [Berkshelf](http://berkshelf.com/)

```bash
cd chef-os-hardening
berks vendor ../cookbooks
cd ..
mv chef-os-hardening/ cookbooks/os-hardening
```

5. Create `solo.rb`

    This file is used to specify the configuration details for chef-solo. So create a `solo.rb` that include the `cookbook_path`.

```bash
cat > solo.rb <<EOF
root = File.absolute_path(File.dirname(__FILE__))
node_name "localhost"
file_cache_path root
cookbook_path [ root + '/cookbooks', root + '/site-cookbooks' ]
EOF
```

6. Create `solo.json`

    Chef-solo does not interact with the Chef Server. Consequently, node-specific attributes must be located in a JSON file on the target system. Create the following `solo.json`.

```bash
cat > solo.json <<EOF
{
    "security" : {"suid_sgid": {
        "remove_from_unkown" : true,
        "system_whitelist" : []
        }
    },
    "run_list":[
        "recipe[os-hardening]"
    ]
}
EOF
```

7. Verify structure

```bash
# tree -L 2
.
|-- cookbooks
|   |-- apt
|   |-- ohai
|   |-- os-hardening
|   |-- sysctl
|   `-- yum
|-- solo.json
`-- solo.rb
```

9. Run chef-solo

```bash
chef-solo -c solo.rb -j solo.json
```
