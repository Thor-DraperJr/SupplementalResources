# Azure Labs

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FThor-DraperJr%2FSupplementalResources%2Fmain%2FAssets%2FAzureLabs%2FWeek2%2FDay3%2Fazuredeploy.json)

## Objective

Create an Azure environment with a management VM, two web servers, and an ELK server to collect and monitor logs from the web servers. The management VM is doubling as a jumpbox and only has a trust relationship with your local machine. The management VM is going to install Ansible and configure the web VMs and the ELK server from Ansible playbooks. The essense of each playbook is to install docker and configure containers hosting the dvwa and ELK.

## Filling out the ARM template

| Parameter | Description |
| :------ |  -----: |
| Region | List of regions (This should also be the value in Location) |
| Project Name | Whatever you want to name your project |
| Location | Where you are deploying your jumpbox/web servers |
| Location2 | Where you are deploying your ELK server |
| Admin Username | Default username on your servers |
| SSH public key source | Click this drop down and select `Use existing public key` |
| Admin Public Key | Paste the ssh public key from your local machine |
| Ip Address | Allowed Ip address to connect to your resources |
| Vnet Address Prefix | Must be unique to avoid overlap |
| Vnet Address Prefix2 | Must be unique to avoid overlap |

## Resources Created

- 2 Virtual Networks
- 4 Virtual Machines
  - 1 Jumpbox (This is where you'll install Ansible and will be the management container for the other resources)
  - 2 WebVMs hosting the DVWA container
  - Elk Server
  - *All VMs are deployed with a vNic and OsDisk's*
- 3 Public IPs
  - Jumpbox IP: To ssh from your on-prem device to the management/ansible VM
  - LB IP: To connect to the external facing LB and connect to the Web VMs in the availability sets
  - ELK IP: To connect to the ELK server over the internet
- 2 Network Security Groups
  - Nsg1: Allows ssh, http, and ALB health probes
  - Nsg2: Allows 5601 traffic in
- External Load Balancer
- Availability Set
  - For the Web VMs so they can be added to the LB backend pool and create HA (high availability)

## Steps to finish the configuration

1. ssh from your local machine to your jumbbox VM
2. Copy the setup script and all three playbooks into your home directory on your jumpbox VM (be sure to keep the same names):
   1. [Complete Setup Bash Script](Week2/Day3/completeSetup.sh)
   2. [DVWA Playbook](Week2/Day3/dvwa-playbook.yml)
   3. [ELK Playbook](Week2/Day3/elk-playbook.yml)
   4. [Beats Playbook](Week2/Day3/beats-playbook.yml)
3. Run `bash completeSetup.sh` and press enter when prompted.
4. Copy the ssh from the output and navigate to your WebVms/ElkVm in your Azure portal and select 'Reset password'. Set the username to azureuser and paste the jumpbox VMs public key.
5. Run `vim BeatConfigs/filebeat.yml` to modify and set the connection information for filebeat:

  ```yml
  setup.kibana:
  host: "<kibana_url>"

  output.elasticsearch:
    hosts: ["<ELK_Private_Ip>"]
    username: "elastic"
    password: "changme"
  ```

6. Run `vim BeatConfigs/metricbeat.yml` to modify and set the connection information to set the connection information for metricbeat:

  ```yml
  setup.kibana:
  host: "<kibana_url>"

  output.elasticsearch:
    hosts: ["<ELK_Private_Ip>"]
    username: "elastic"
    password: "changme"
  ```

7. Modify `/etc/ansible/hosts` add the private IP address of your web server and your ELK server.

  ```text
  [webservers]
  <Private_Ip_Web1>
  <Private_Ip_Web2>

  [elk]
  <Private_Ip_Elk>
  ```

8. Modify `/etc/ansible/ansible.cfg` add remote_user under the defaults section.
9. Run `ansible all -m ping` type yes to make sure the ssh keys are added to your host.
   1.  If you see any errors you need to copy your jumpbox public ssh key to the VMs through the portal (step 4).
10. Run `ansible-playbook dvwa-playbook.yml elk-playbook.yml`
11. Verify your elk server is working by navigating to <ELK_Public_IP>:5601 in your web browser.
12. Run `ansible-playbook dvwa.yml beats-playbook.yml`

## Terminology

- Jumpbox: A secure VM that is used to manage your cloud resources. This only has a trust relationship with your on-prem device.
