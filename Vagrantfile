Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
  
    config.vm.define "ceph_client" do |ceph_client|
    config.vm.provider "virtualbox" do |v|
         v.customize ["modifyvm", :id, "--memory", "1024"]
    end
      ceph_client.vm.network :private_network, ip: "192.168.56.11"
      ceph_client.vm.hostname = "client.otus.local"
      ceph_client.vm.provision "shell", privileged: false, path: "./scripts/add-ssh-cert.sh"
      ceph_client.vm.provision "shell", privileged: false, path: "./scripts/install-chrony.sh"
    end

    (1..3).each do |i|
        config.vm.define "ceph_server_#{i}" do |ceph_server|
        config.vm.provider "virtualbox" do |v|
            v.customize ["modifyvm", :id, "--memory", "1024"]
        end
          ceph_server.vm.hostname = "server#{i}.otus.local"
          ceph_server.vm.network :private_network, ip: "192.168.56.#{i+11}"
          ceph_server.vm.provision "shell", privileged: false, path: "./scripts/add-ssh-cert.sh"
          ceph_server.vm.provision "shell", privileged: false, path: "./scripts/install-chrony.sh"
        end
    end
  
    config.vm.define "ceph_admin" do |ceph_admin|
      ceph_admin.vm.network :private_network, ip: "192.168.56.10"
      ceph_admin.vm.hostname = "admin.otus.local"
      ceph_admin.vm.provision "shell", privileged: false, path: "./scripts/controller-add-ssh-cert.sh"
      ceph_admin.vm.provision "shell", privileged: false, path: "./scripts/install-ansible.sh"
    end
end