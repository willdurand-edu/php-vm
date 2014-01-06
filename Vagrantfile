Vagrant.configure("2") do |config|
  config.vm.box = "debian-wheezy72-x64-vbox43"
  config.vm.box_url = "http://box.puphpet.com/debian-wheezy72-x64-vbox43.box"

  config.vm.network "private_network", ip: "33.33.33.10"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 81, host: 8081
  config.vm.network :forwarded_port, guest: 82, host: 8082

  config.vm.synced_folder "./projects", "/var/www", id: "vagrant-root", :nfs => false, :group => 'www-data', :mount_options => [ "dmode=775", "fmode=664" ]

  config.vm.usable_port_range = (2200..2250)
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "student-vm"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :shell, :path => "shell/initial-setup.sh"
  config.vm.provision :shell, :path => "shell/update-puppet.sh"
  config.vm.provision :shell, :path => "shell/librarian-puppet-vagrant.sh"
  config.vm.provision :puppet do |puppet|
    puppet.facter = {
      "ssh_username" => "vagrant"
    }

    puppet.manifests_path = "puppet/manifests"
    puppet.options = ["--verbose", "--hiera_config /vagrant/hiera.yaml", "--parser future"]
  end

  config.ssh.username = "vagrant"

  config.ssh.shell = "bash -l"

  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.vagrant.host = :detect
end

