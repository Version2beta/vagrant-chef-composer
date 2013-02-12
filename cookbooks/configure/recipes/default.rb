# Cookbook Name:: configure
# Recipe:: default
#
# Copyright 2013, Version2beta LLC

# execute 'DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade'

include_recipe "mysql::server"
include_recipe "database"
include_recipe "apache2"
include_recipe "php"
include_recipe "composer"
include_recipe "vim"

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

directory "/var/www" do
  owner "www-data"
  group "www-data"
end

link "/var/www/project" do
  to "/home/vagrant/project/"
end
