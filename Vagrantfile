Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

OS="centos/7"
BOX_URL="https://atlas.hashicorp.com/centos/boxes/7/versions/1611.01/providers/virtualbox.box"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	numNodes = 4
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "sparknode#{i}" do |node|
			node.vm.box = OS
			node.vm.box_url = BOX_URL
			node.vm.provider "virtualbox" do |v|
			    v.name = "sparknode#{i}"
			    v.customize ["modifyvm", :id, "--memory", "1536"]
			    if i == 1
			        v.customize ["modifyvm", :id, "--memory", "2048"] #MASTER
			    end
			end
			node.vm.network "private_network", ip: "192.168.2.3#{i}", virtualbox__intnet: true
			node.vm.hostname = "sparknode#{i}"
			node.vm.provision "shell", path: "scripts/setup-hosts.sh"
			node.vm.provision "shell", path: "scripts/setup-jvm.sh"
			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			if i==1
				node.vm.provision "shell", path: "scripts/setup-master.sh"
			end
		end
	end
end
