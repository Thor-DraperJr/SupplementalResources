# Connect to Azure
Connect-AzAccount

# Get and Select Azure Subscription
$subId = (Get-AzSubscription | Out-GridView -Title "Select Subscription..." -PassThru)
Set-AzContext -Subscription $subId.name

# Define VM credentials
$cred = Get-Credential -Message 'Enter a username and password for the virtual machine. (ex. azadmin/P4ssw0rd*P4ssw0rd*)'

# Define Azure region
$location = Read-Host "Enter location (ex. EastUS)"

# Create Resource Group
$rg = Read-Host "Enter your Resource Group Name (ex. v-thordraper)"

# Define my IP
$myIP = (Invoke-RestMethod http://ipinfo.io/json) | Select-Object -exp ip 

# Define NSG name
$nsgName = Read-Host "Enter NSG Name (ex. nsg1)"

# Define NSG name
$vNetName = Read-Host "Enter vNet Name (ex. vNet1)"

# vNet Address Prefix
#$vNetAddressPrefix = Read-Host "Enter the vNet Prefix (ex. 10.0.0.0/16)"

# Subnet Address Prefixes (Frontend,Backend,Bastion)
#$frontendSubnetAddressPrefix = Read-Host "Enter the Frontend Subnet Address Prefix (ex. 10.0.0.0/24)"
#$backendSubnetAddressPrefix = Read-Host "Enter the Backend Subnet Address Prefix (ex. 10.0.1.0/24)"
#$bastionSubnetAddressPrefix = Read-Host "Enter the Bastion Subnet Address Prefix (ex. 10.0.2.0/24)"

#########End of Variables###########

#Create NSG Rule: allowMyIP
$allowMyIP = New-AzNetworkSecurityRuleConfig -Name "Allow-my-IP" -Description "Allow-from-my-IP" -Access Allow -Protocol * -Direction Inbound -Priority 100 -SourceAddressPrefix $myIP -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389,22

# Create NSG
$nsg1 = New-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rg -Location $location -SecurityRules $allowMyIP

# Create Subnets
$bastionSubnet = New-AzVirtualNetworkSubnetConfig -Name bastionSubnet -AddressPrefix "10.0.0.0/24" -NetworkSecurityGroup $nsg1
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24" -NetworkSecurityGroup $nsg1
$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix "10.0.2.0/24" -NetworkSecurityGroup $nsg1

# Create a public IP address (VM1, VM2 and VM3)
$vm1pip = New-AzPublicIpAddress -Name vm1-pip -ResourceGroupName $RG -Location $Location -AllocationMethod Dynamic

# Create vNet
New-AzVirtualNetwork -Name $vNetName -ResourceGroupName $rg -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $bastionSubnet,$frontendSubnet,$backendSubnet

$IPConfig1 = New-AzNetworkInterfaceIpConfig -Name "IPConfig-1" -Subnet $backendSubnet -PublicIpAddress $vm1pip -Primary

####### TESTLINE ###### New-AzNetworkInterfaceIpConfig -Name "ipconfig1" -PrivateIpAddress "dynamic"


# Create NIC
$vm1nic1 = New-AzNetworkInterface -Name "NetworkInterface1" -ResourceGroupName $rg -Location $location -Subnet $backendSubnet -IpConfiguration $IpConfig1 -NetworkSecurityGroup $nsg1

####### TESTLINE ###### New-AzNetworkInterface -Name "name" -Location $location -NetworkSecurityGroup $nsg1 -IpConfiguration "ipconfig1"



### Create an Ubuntu Server and Windows Server virtual machines ###

# VM1 LINUX

$vm1 = New-AzVMConfig -VMName vm1 -VMSize "Standard_B1s"
$vm1 = Set-AzVMOperatingSystem -VM $vm1 -Linux -ComputerName vm1 -Credential $cred
$vm1 = Add-AzVMNetworkInterface -VM $vm1 -Id $vm1nic1.Id -Primary
$vm1 = Set-AzVMSourceImage -VM $vm1 -PublisherName 'Canonical' -Offer "UbuntuServer" -Skus "16.04-LTS" -Version latest
$vm1 = Set-AzVMBootDiagnostic -VM $vm1 -Disable
New-AzVM -ResourceGroupName $RG -Location $Location -VM $vm1 -Verbose
