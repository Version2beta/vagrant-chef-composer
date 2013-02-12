# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Forward port 8000 on the host to port 80 on the client
  config.vm.forward_port 80, 8000, { :auto => true }

  # Share a folder all friendly like
  config.vm.share_folder "v-data", "/home/vagrant/host_shared", "./shared"
  
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password   => "open sesame ha ha ha",
        :server_repl_password   => "open sesame ha ha ha",
        :server_debian_password => "open sesame ha ha ha"
      }
    }
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "ohai"
    chef.add_recipe "configure"
  end
end
