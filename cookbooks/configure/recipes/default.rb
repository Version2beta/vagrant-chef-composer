# Cookbook Name:: configure
# Recipe:: default
#
# Copyright 2013, Example Com
#
#

# execute 'DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade'

include_recipe "database"

directory "/home/vagrant/project/" do
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/project/composer.json" do
  source "composer.json"
  owner "vagrant"
  group "vagrant"
  mode 00644
end

directory "/home/vagrant/bin" do
  owner "vagrant"
  group "vagrant"
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

gitbag = data_bag_item("git", "ssh_keys")
ssh_public = gitbag["_default"]["public_key"]
ssh_private = gitbag["_default"]["private_key"]
known_hosts = gitbag["_default"]["known_hosts"]

file "/home/vagrant/.ssh/id_rsa.pub" do
  content ssh_public
  owner "vagrant"
  group "vagrant"
  mode 00600
end

file "/home/vagrant/.ssh/id_rsa" do
  content ssh_private
  owner "vagrant"
  group "vagrant"
  mode 00600
end

file "/home/vagrant/.ssh/known_hosts" do
  content known_hosts
  owner "vagrant"
  group "vagrant"
  mode 00600
end

cookbook_file "/home/vagrant/.gitconfig" do
  source "gitconfig"
  owner "vagrant"
  group "vagrant"
  mode 00755
end

directory "/var/www" do
  owner "www-data"
  group "www-data"
end

link "/var/www/project" do
  to "/home/vagrant/project/"
end

