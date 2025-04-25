pip3.11 install ansible
ansible-pull -i localhost, -U https://github.com/Nazrina124/Ansible-Robo2 main.yml -e role_name=role_name main.yml -e vault_token=Vault_token | 2>&1 /opt/userdata.log

