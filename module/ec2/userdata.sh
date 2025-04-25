#!/bin/bash

pip3.11 install ansible hvac
ansible-pull -i localhost, -U https://github.com/Nazrina124/Ansible-Robo2 main.yml -e env=${env} -e role_name=${role_name} main.yml  -e vault_token=${VAULT_TOKEN} 2>&1 | tee -a /opt/userdata.log

