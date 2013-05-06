# Cookbook Name:: configure
# Recipe:: default
#
# Copyright 2013, Version2beta LLC

# execute 'DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade'

["/home/vagrant/project/", "/home/vagrant/bin"].each do |d|
  directory d do
    owner "vagrant"
    group "vagrant"
    mode 00755
    recursive true
  end
end

remote_file "/home/vagrant/bin/vcprompt" do
  source "https://raw.github.com/djl/vcprompt/master/bin/vcprompt"
  action :create_if_missing
  owner "vagrant"
  group "vagrant"
  mode 00755
end

cookbook_file "/home/vagrant/.profile" do
  source "bash_profile"
  owner "vagrant"
  group "vagrant"
  mode 00755
end

cookbook_file "/home/vagrant/.vimrc" do
  source "vimrc"
  owner "vagrant"
  group "vagrant"
  mode 00755
end

cookbook_file "/home/vagrant/project/composer.json" do
  source "composer.json"
  owner "vagrant"
  group "vagrant"
  mode 00644
end

include_recipe "database"
include_recipe "apache2"
include_recipe "apache2::mod_php5"

include_recipe "composer"
include_recipe "vim"

link "/etc/apache2/htdocs" do
  to "/home/vagrant/project"
end

apache_module "php5" do
  enable true
end
