require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

homesteadYamlPath = File.expand_path("~/.homestead/Homestead.yaml")
afterScriptPath = File.expand_path("~/.homestead/after.sh")
aliasesPath = File.expand_path("~/.homestead/aliases")

require_relative 'scripts/homestead.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box_version = "0.3.3"

	if File.exists? aliasesPath then
		config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
	end

	Homestead.configure(config, YAML::load(File.read(homesteadYamlPath)))

  	# Provision MongoDB
  	config.vm.provision "shell", path: "https://raw.githubusercontent.com/fideloper/Vaprobash/master/scripts/mongodb.sh", args: "true"

    # Provision Redis (without journaling and persistence)
    config.vm.provision "shell", path: "https://raw.githubusercontent.com/fideloper/Vaprobash/master/scripts/redis.sh", args: "true" 

    # Install packages required by neteo
    config.vm.provision "shell", path: "install-neteo-packages.sh"

    # Configure neteo dependencies
    config.vm.provision "shell", path: "neteo-webapp-config.sh"    
    config.vm.provision "shell", path: "nmap-config.sh"
    config.vm.provision "shell", path: "supervisor-config.sh"
    config.vm.provision "shell", path: "websocket-server.sh"

	if File.exists? afterScriptPath then
		config.vm.provision "shell", path: afterScriptPath
	end
end
