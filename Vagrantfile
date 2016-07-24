Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.gitignore_global", destination: ".gitignore_global"
  config.vm.provision "file", source: "~/.dircolors", destination: ".dircolors"
  config.vm.provision "file", source: "~/.bash_aliases", destination: ".bash_aliases"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "db.yml"
  end
end
