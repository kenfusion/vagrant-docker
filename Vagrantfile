Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.gitignore_global", destination: ".gitignore_global"
  config.vm.provision "file", source: "~/.dircolors", destination: ".dircolors"
  config.vm.provision "file", source: "~/.bash_aliases", destination: ".bash_aliases"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
end
