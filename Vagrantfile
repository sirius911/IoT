# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    # Configuration pour la première machine (Server)
    config.vm.define "clorinS" do |server|
      server.vm.box = "generic/centos8" # Utilisez la boîte de votre choix
      server.vm.network "private_network", type: "dhcp", adapter: 1
      server.vm.network "private_network", type: "static", ip: "192.168.56.110"
  
      server.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
      end
  
      server.vm.hostname = "clorinS"
    end
  
    # Configuration pour la deuxième machine (ServerWorker)
    config.vm.define "clorinSW" do |server_worker|
      server_worker.vm.box = "generic/centos8" # Utilisez la boîte de votre choix
      server_worker.vm.network "private_network", type: "dhcp", adapter: 1
      server_worker.vm.network "private_network", type: "static", ip: "192.168.56.111"
  
      server_worker.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
      end
  
      server_worker.vm.hostname = "clorinSW"
    end
  
    # Installation de K3s sur les deux machines
    config.vm.provision "shell", inline: <<-SHELL
      # Installation de K3s en mode controller (sur la première machine)
      curl -sfL https://get.k3s.io | sh -
      # Installation de kubectl
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      chmod +x kubectl
      sudo mv kubectl /usr/local/bin/
    SHELL
  
    config.vm.provision "shell", inline: <<-SHELL
      # Installation de K3s en mode agent (sur la deuxième machine)
      # curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=<YOUR_TOKEN> sh -
      # Installation de kubectl
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      chmod +x kubectl
      sudo mv kubectl /usr/local/bin/
    SHELL
  end