# Deploy Day 1

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FThor-DraperJr%2FSupplementalResources%2Fmain%2FAssets%2FAzureLabs%2FWeek2%2FDay1%2Fazuredeploy.json)

- [How to create an Azure deploy button](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-azure-button)

```text
![Deploy to Azure](https://aka.ms/deploytoazurebutton)

<img src="https://aka.ms/deploytoazurebutton"/>

$url = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json"
[uri]::EscapeDataString($url)

https://portal.azure.com/#create/Microsoft.Template/uri/
```

- https://docs.microsoft.com/en-us/azure/virtual-network/service-tags-overview

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
