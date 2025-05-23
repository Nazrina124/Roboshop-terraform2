#!/bin/bash

dnf install docker -y

growpart /dev/nvme0n1 4

lvextend -r -L +10G /dev/mapper/RootVG-varVol

pip3.11 install ansible hvac 2>&1 | tee -a /opt/userdata.log
ansible-pull -i localhost, -U https://github.com/Nazrina124/Ansible-Robo2 main.yml -e env=${env} -e role_name=docker -e app_name=${app_name} -e vault_token=${vault_token} 2>&1 | tee -a /opt/userdata.log

