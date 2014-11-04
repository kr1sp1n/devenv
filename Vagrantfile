# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 8080, host: 8080 # SNS
  config.vm.network :forwarded_port, guest: 8081, host: 8081 # Catalog Search API
  config.vm.network :forwarded_port, guest: 4000, host: 4000 # Public API
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # Eyefind

  # used for eyefind live-reload 
  config.vm.network :forwarded_port, guest: 35729, host: 35729
   

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10" # use for browser-sync

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "./chef/cookbooks"
    chef.roles_path = "./chef/roles"
    chef.data_bags_path = "./chef/data_bags"

    chef.add_role("devenv")
    
    chef.node_name = "foo"

    chef.log_level = "info"

    chef.json = {
      "hostname" => "vagrant.local",
      "timezone" => "Europe/Berlin",
      "devenv" => {
        "user" => "vagrant"
      }
    }

  end

end
