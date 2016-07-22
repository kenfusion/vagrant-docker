#!/bin/bash
chmod 600 .vagrant/machines/default/virtualbox/private_key

rsync --verbose\
      -e 'ssh -p 2222 -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=true -o UserKnownHostsFile=/dev/null -i .vagrant/machines/default/virtualbox/private_key'\
      --archive\
      -z\
      --delete\
      --exclude .vagrant/\
      --exclude .git/\
      --exclude .venv/\
      develop/\
      vagrant@127.0.0.1:develop/

