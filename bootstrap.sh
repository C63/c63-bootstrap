#!/bin/bash

CWD=$(pwd)

sudo mkdir -p /{etc,var}/salt
sudo chmod -R 777 /{etc,var}/salt

sudo mkdir -p /var/{cache,log}/salt
sudo chmod -R 777 /var/{cache,log}/salt

sudo mkdir -p /etc/salt/pki/
sudo chmod -R 777 /etc/salt/pki

sudo ln -s $CWD/minion /etc/salt 2> /dev/null
sudo ln -s $CWD/base /var/salt 2> /dev/null
sudo ln -s $CWD/pillar /var/salt 2> /dev/null

# apply salt states in standalone mode
salt-call state.apply

echo "please fix AWS credentials in /etc/salt/cloud.providers.d/ec2.provider.conf
then run this command below:
    salt-call state.sls vpc.finalize
It will boot up core instances and fix the main route table
"
