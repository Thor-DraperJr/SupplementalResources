#!/bin/sh
echo "update/upgrade packages and install ansible"
sudo apt update -y
sudo apt upgrade -y
sudo apt install ansible -y

# Create ssh key to 
echo "create ssh key"
ssh-keygen

# Download and install Filebeat
echo "prepare filebeat"
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
sudo dpkg -i filebeat-7.6.1-amd64.deb
sudo cp /etc/filebeat/filebeat.yml .
sudo chown azureuser:azureuser filebeat.yml

# Download and install Metricbeat
echo "prepare metricbeat"
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
sudo dpkg -i metricbeat-7.6.1-amd64.deb
sudo cp /etc/metricbeat/metricbeat.yml .
sudo chown azureuser:azureuser metricbeat.yml

# Check if the Downloads directory exists and then move all files with a .deb extension in to this folder 
echo "create Downloads directory"
mkdir -p Downloads
mv *.deb ./Downloads
# Check if the Downloads directory exists and then move all files with a .deb extension in to this folder
echo "create BeatConfigs directory"
mkdir -p BeatConfigs
mv *beat.yml ./BeatConfigs

cat /home/azureuser/.ssh/id_rsa.pub