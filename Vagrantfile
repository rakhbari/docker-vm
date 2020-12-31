# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
proj_name = File.basename(Dir.pwd)
ENV["LC_ALL"] = "en_US.UTF-8"
vm_ip = "192.168.100.40"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ## Choose your base box
  #config.vm.box = "debian/stretch64"
  config.vm.box = "bento/ubuntu-18.04"
  
  ## Customize memory & CPUs
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
  end
  
  ## Configure some networking stuff on the guest VM
  config.vm.host_name = 'docker-vm'
  config.vm.network "private_network", ip: "#{vm_ip}"
    
  ## Don't create a brand new SSH key pair. Use the default insecure_private_key
  config.ssh.insert_key = false
  
  ## For masterless, mount your salt file root
  config.vm.synced_folder "./", "/home/vagrant/#{proj_name}"
  
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end
  
  config.vm.provision "bootstrap", type: "shell" do |s|
    s.keep_color = true
    s.inline = "sudo -u vagrant -H sh -c 'cd #{proj_name};./bootstrap.sh'"
  end

end
