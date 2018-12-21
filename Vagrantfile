# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "bento/centos-7.4"
	config.hostmanager.enabled = true
	config.hostmanager.manage_host = true
	config.hostmanager.manage_guest = true
	config.vm.provision "docker"

	config.vm.define "centos7", primary: true do |centos7|
		centos7.vm.hostname = 'centos7'
		centos7.vm.network :private_network, ip: "192.168.99.200"
		centos7.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			v.customize ["modifyvm", :id, "--memory", 3000]
			v.customize ["modifyvm", :id, "--name", "centos7"]
		end
		centos7.vm.provision :shell, inline: "yum install -y epel-release && yum install -y git jq"
	end
end
