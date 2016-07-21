#!/bin/bash

# pull down repos for https://app.pluralsight.com/library/courses/docker-ansible-continuous-delivery class

for repo in docker-jenkins docker-ansible todobackend-base todobackend todobackend-specs todobackend-deploy todobackend-client ; do
  sudo -iu vagrant git clone https://github.com/jmenga/$repo.git develop/$repo
done
