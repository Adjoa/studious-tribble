# -*- mode: ruby -*-
# vi: set ft=ruby :
DOMAIN="example.com"
SUBNET="10.90.15"
MEMORY=1028

Vagrant.configure(2) do |config|
  config.vm.define :puppetserver do |vmconfig|
    vmconfig.vm.box = "ubuntu/trusty64"
    vmconfig.vm.hostname = "puppet.#{DOMAIN}"
    vmconfig.vm.network "private_network", ip: "#{SUBNET}.101"
    vmconfig.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", MEMORY]
    end
    vmconfig.vm.provision :puppet, 
      :options     => ["--pluginsync 
                        --hiera_config /vagrant/deploy/hiera.yaml"], 
      :module_path => "deploy/modules", 
      :facter      => {"middleware_ip" => "#{SUBNET}.10"} do |puppet|
          puppet.manifests_path = "deploy"
          puppet.manifest_file = "site.pp"
    end
  end
end
