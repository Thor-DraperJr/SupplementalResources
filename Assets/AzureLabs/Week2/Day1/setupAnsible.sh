#!/bin/sh
apt update -y
apt upgrade -y
apt install ansible -y

## ssh-keygen
## cat /home/azureuser/.ssh/id_rsa.pub
## copy this key and then open the Azure portal. From the azure portal: navigate to the Web VM and from the menu pane select "Reset password" and add the ssh key

## edit the `/etc/ansible/hosts` file. Add the private IP addressses of the web VMs
## edit the `/etc/ansible/ansible.cfg` file. Add "remote_user = azureuser"
