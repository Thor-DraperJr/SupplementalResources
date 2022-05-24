#!/bin/bash

# Download and install Filebeat
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
sudo dpkg -i filebeat-7.6.1-amd64.deb
sudo cp /etc/filebeat/filebeat.yml .
sudo chown azureuser:azureuser filebeat.yml

# Modify /etc/filebeat/filebeat.yml to set the connection information:

#output.elasticsearch:
#  hosts: ["<ELK_Private_Ip>"]
#  username: "elastic"
#  password: "changme"
#setup.kibana:
#  host: "<kibana_url>"

# Download and install Metricbeat
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
sudo dpkg -i metricbeat-7.6.1-amd64.deb
sudo cp /etc/metricbeat/metricbeat.yml .
sudo chown azureuser:azureuser metricbeat.yml

# Modify /etc/metricbeat/metricbeat.yml to set the connection information:

# Modify /etc/metricbeat/metricbeat.yml, uncomment the following and put the private IP of the ELK instance:
#output.elasticsearch:
#  hosts: ["<ELK_Private_Ip>"]
#  username: "elastic"
#  password: "changeme"
#setup.kibana:
#  host: "<ELK_Private_Ip>"

# Check if the Downloads directory exists and then move all files with a .deb extension in to this folder 
mkdir -p Downloads
mv *.deb ./Downloads
# Check if the Downloads directory exists and then move all files with a .deb extension in to this folder 
mkdir -p BeatConfigs
mv *beat.yml ./BeatConfigs