# Deploy Week 2 Day 3

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FThor-DraperJr%2FSupplementalResources%2Fmain%2FAssets%2FAzureLabs%2FWeek2%2FDay3%2Fazuredeploy.json)

## Steps to finish the configuration

1. ssh from your local machine to your jumbbox VM
2. Copy the setup script and all three playbooks into your home directory on your jumpbox VM (be sure to keep the same names):
   1. Assets\AzureLabs\Week2\Day3\completeSetup.sh
   2. Assets\AzureLabs\Week2\Day3\dvwa-playbook.yml
   3. Assets\AzureLabs\Week2\Day3\elk-playbook.yml
   4. Assets\AzureLabs\Week2\Day3\beats-playbook.yml
3. Run `bash completeSetup.sh` and press enter when prompted.
4. Copy the ssh from the output and navigate to your WebVms/ElkVm in your Azure portal and select 'Reset password'. Set the username to azureuser and paste the jumpbox VMs public key.
5. Modify `/etc/filebeat/filebeat.yml` to set the connection information:

  ```yml
  output.elasticsearch:
    hosts: ["<ELK_Private_Ip>"]
    username: "elastic"
    password: "changme"
  setup.kibana:
  host: "<kibana_url>"
  ```

6. Modify `/etc/metricbeat/metricbeat.yml` to set the connection information:
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
10. Run `ansible-playbook dvwa-playbook.yml`
11. Run `ansible-playbook elk-playbook.yml`
12. Run `ansible-playbook beats-playbook.yml`
13. Verify your dvwa is working by navigating to <Web_Public_IP>/setup.php in your web browser.
14. Verify your elk server is working by navigating to <ELK_Public_IP>:5601 in your web browser.
