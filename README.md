LicPro
======

This project provides a [Vagrant](http://vagrantup.com/) configuration, and uses
[Puppet](http://puppetlabs.com/) for provisioning.


## Installation

#### Install Vagrant

Read the [Getting Started With
Vagrant](http://vagrantup.com/v1/docs/getting-started/index.html) page to
install Vagrant.

**Note:** an Internet access is mandatory, as well as [administrator privileges
in order to configure NFS](http://vagrantup.com/v1/docs/nfs.html).


#### Get the code

    git clone https://github.com/willdurand/licpro.git
    git submodule update --init


#### Start the VM

    vagrant up


## Usage

The project's root directory is mounted under `/vagrant` into the VM, so that
you can work on your project locally with your favorite IDE or whatever you
want. You will find the Puppet configuration in `puppet/manifests/site.pp`.

Also, you can access the VM by using SSH:

    vagrant ssh

