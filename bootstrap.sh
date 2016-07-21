#!/bin/bash
set -e


apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get upgrade -y
apt-get install -y apt-transport-https ca-certificates
apt-get purge -y lxc-docker
apt-cache policy docker-engine

apt-get install -y build-essential libssl-dev libyaml-dev libffi-dev python-dev python-pip docker.io tree unzip
pip install --upgrade ansible boto boto3 awscli docker-compose virtualenvwrapper
usermod -aG docker vagrant
ansible --version
docker --version
docker-compose --version

sudo -u vagrant mkdir /home/vagrant/{develop,.virtualenvs}
cat << EOF >> /home/vagrant/.profile
export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/develop
source /usr/local/bin/virtualenvwrapper.sh
EOF
