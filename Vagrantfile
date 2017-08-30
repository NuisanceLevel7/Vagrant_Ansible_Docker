VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use the same key for each machine
  config.ssh.insert_key = true

  config.vm.define "dockerdev" do |dockerdev|
    dockerdev.vm.box = "marcv81/xenial64"
    dockerdev.vm.network "forwarded_port", guest: 8080, host: 80
    dockerdev.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "6144"]
    end
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "docker-inst.yaml"
      ansible.inventory_path = "hosts"
      ansible.limit = "all" 
    end
  end
end
