PHP VM
======

This project provides a [Vagrant](http://www.vagrantup.com/) configuration, and
uses [Puppet](http://puppetlabs.com/) for provisioning.

Installation
------------

#### Install Vagrant

Read the [Getting Started With
Vagrant](http://vagrantup.com/v1/docs/getting-started/index.html) page to
install Vagrant.

#### Get the code

    git clone git://github.com/licpro/php-vm.git --recursive

#### Start the VM

    vagrant up


Usage
-----

Start the VM, then enjoy:

    vagrant up

#### Filesystem Mapping

| Directory (Host)         | Directory (VM)           | URLs                                    |
|--------------------------|--------------------------|-----------------------------------------|
| projects/                | /var/www/                | http://projects.33.33.33.10.xip.io/     |
|                          |                          | http://33.33.33.10/                     |
|                          |                          | http://localhost:8080/                  |
| projects/sf2/            | /var/www/sf2/            | **not accessible**                      |
| projects/sf2/web/        | /var/www/sf2/web/        | http://sf2.33.33.33.10.xip.io/          |
|                          |                          | http://33.33.33.10:81/                  |
|                          |                          | http://localhost:8081/                  |
| projects/uframework/     | /var/www/uframework/     | **not accessible**                      |
| projects/uframework/web/ | /var/www/uframework/web/ | http://uframework.33.33.33.10.xip.io/   |
|                                                     || http://33.33.33.10:82/                 |
|                                                     || http://localhost:8082/                 |

#### Databases

MySQL is running on the default port. The `root` password is: `root`.

The following databases are configured:

* `uframework` is configured for user `uframework` (password:
`passw0rd`), with all privileges;
* `sf2` is configured for user `sf2` (password: `passw0rd`), with all
  privileges;
* `dummy` is configured for user `john` (password: `doe`), with all
  privileges.
