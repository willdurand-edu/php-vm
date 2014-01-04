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

Here is the mapping:

| Directory (host)         | Directory (VM)           | URLs                                    |
|--------------------------|--------------------------|-----------------------------------------|
| projects/                | /var/www/                | http://33.33.33.10/                     |
|                          |                          | http://localhost:8080/                  |
| projects/sf2/            | /var/www/sf2/            | **not accessible**                      |
| projects/sf2/web/        | /var/www/sf2/web/        | http://sf2.33.33.33.10.xip.io/          |
|                          |                          | http://33.33.33.10:81/                  |
|                          |                          | http://localhost:8081/                  |
| projects/uframework/     | /var/www/uframework/     | **not accessible**                      |
| projects/uframework/web/ | /var/www/uframework/web/ | http://uframework.33.33.33.10.xip.io/   |
|                          |                          | http://33.33.33.10:82/                  |
|                          |                          | http://localhost:8082/                  |
