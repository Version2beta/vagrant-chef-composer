# vagrant-chef-composer

A shortcut to a dev environment with PHP Composer on Vagrant provisioned by Chef

## Usage

1. Clone this repository.

```
git clone https://github.com/Version2beta/vagrant-chef-composer.git
```

2. Change directories into the repository.

```
cd vagrant-chef-composer
```

3. Start up the Vagrant virtual machine.

```
vagrant up
```

This step takes about 5 minutes on my laptop.

4. SSH into the Vagrant virtual machine.

```
vagrant ssh
```

5. Edit the composer.json file to include the packages you need.

```
cd project
vim composer.json
```

6. Configure your project.

```
composer install
```

7. Build epic shit.

