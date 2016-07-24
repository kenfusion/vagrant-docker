#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

#Install docker: https://docs.docker.com/v1.11/engine/installation/linux/ubuntulinux/

# ensure that APT works with the https method, and that CA certificates are installed.
apt-get update
apt-get install -y apt-transport-https ca-certificates

# Add docker GPG key.
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add docker repo
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-cache policy docker-engine | grep docker-engine

# purge old repo if it exists
apt-get purge -y lxc-docker


# install packages
apt-get upgrade -y
apt-get install -y python-pip python-dev libmysqlclient-dev nodejs npm docker.io tree
pip install --upgrade boto boto3 awscli docker-compose virtualenvwrapper


# install ansible
# http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-ubuntu
apt-get install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible


# add vagrant user to docker group
usermod -aG docker vagrant

#show tool versions
ansible --version
docker --version
docker-compose --version

# setup virtualenvwrapper
sudo -u vagrant mkdir /home/vagrant/{develop,.virtualenvs}
cat << EOF >> /home/vagrant/.profile
export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/develop
source /usr/local/bin/virtualenvwrapper.sh
EOF
