# vagrant-chef-composer

A shortcut to a dev environment with PHP Composer on Vagrant provisioned by Chef

## Usage

One. Clone this repository.

```
git clone https://github.com/Version2beta/vagrant-chef-composer.git
```

Two. Change directories into the repository.

```
cd vagrant-chef-composer
```

Three. Start up the Vagrant virtual machine.

```
vagrant up
```

This step takes about 5 minutes on my laptop.

Four. SSH into the Vagrant virtual machine.

```
vagrant ssh
```

Five. Edit the composer.json file to include the packages you need.

```
cd project
vim composer.json
```

Six. Configure your project.

```
composer install
```

Seven. Build epic shit.

