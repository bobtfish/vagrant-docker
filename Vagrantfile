# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = ENV['BOX_NAME'] || "ubuntu"
BOX_URI = ENV['BOX_URI'] || "http://files.vagrantup.com/precise64.box"
VF_BOX_URI = ENV['BOX_URI'] || "http://files.vagrantup.com/precise64_vmware_fusion.box"
AWS_REGION = ENV['AWS_REGION'] || "us-east-1"
AWS_AMI    = ENV['AWS_AMI']    || "ami-d0f89fb9"
FORWARD_DOCKER_PORTS = ENV['FORWARD_DOCKER_PORTS']

Vagrant::Config.run do |config|
  # Setup virtual machine box. This VM configuration code is always executed.
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.forward_port 4243, 4243

  # Provision docker and new kernel if deployment was not done
  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?
    # Add lxc-docker package
    pkg_cmd = "apt-get update -qq; apt-get install -q -y python-software-properties apt-transport-https; " \
      "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9; " \
      "sh -c 'echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list'" \
      "apt-get install -q -y lxc-docker linux-image-generic-lts-raring linux-headers-generic-lts-raring vim links;"
    pkg_cmd << "ln -s /vagrant/apps/ /home/vagrant/apps; "
    config.vm.provision :shell, :inline => pkg_cmd
  end
end


Vagrant.configure("2") do |config|
  config.vm.provision :shell,
    :inline => 'sudo -u vagrant sh -c "docker run -d --name etcd coreos/etcd"'
  config.vm.provision :shell,
    :inline => 'sudo -u vagrant sh -c "docker pull progrium/buildstep;docker pull bobtfish/synapse-etcd-amb;docker pull bobtfish/nerve-etcd"'

end

if !FORWARD_DOCKER_PORTS.nil?
    Vagrant::VERSION < "1.1.0" and Vagrant::Config.run do |config|
        (49000..49900).each do |port|
            config.vm.forward_port port, port
        end
    end

    Vagrant::VERSION >= "1.1.0" and Vagrant.configure("2") do |config|
        (49000..49900).each do |port|
            config.vm.network :forwarded_port, :host => port, :guest => port
        end
    end
end
