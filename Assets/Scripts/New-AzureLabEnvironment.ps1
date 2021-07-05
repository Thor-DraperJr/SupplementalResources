# Connect to Azure
Connect-AzAccount

# Create a Resource Group
# New-AzResourceGroup -Name "myResourceGroup" -Location "EastUS"

# Get and Select Azure Subscription
$subscriptionId = (Get-AzSubscription | Out-GridView -Title "Select Subscription..." -PassThru)
Set-AzContext -Subscription $subscriptionId.name

# Define VM credentials
$credential = Get-Credential -Message 'Enter a username and password for the virtual machine. (ex. azadmin/P4ssw0rd*P4ssw0rd*)'

# Define Azure region
$location = Read-Host "Enter location (ex. EastUS)"

# Create Resource Group
$resourcegroup = Read-Host "Enter your Resource Group Name (ex. v-thordraper)"

# Define my IP
$myIP = (Invoke-RestMethod http://ipinfo.io/json) | Select-Object -exp ip 

# Define NSG name
$nsgName = Read-Host "Enter NSG Name (ex. nsg1)"

# Define vNet name
$vNetName = Read-Host "Enter vNet Name (ex. vNet1)"

###################################################
# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourcegroup -Location $location -Name $vNetName -AddressPrefix 10.0.0.0/16 -Subnet $subnetConfig1,$subnetConfig2,$subnetConfig3

# Create a public IP address and specify a DNS name
$pip = New-AzPublicIpAddress -ResourceGroupName $rg -Location $location -AllocationMethod Static -IdleTimeoutInMinutes 4 -Name "mypublicdns$(Get-Random)"

#Create NSG Rule: allowMyIP
$allowMyIP = New-AzNetworkSecurityRuleConfig -Name "Allow-my-IP" -Description "Allow-from-my-IP" -Access Allow -Protocol * -Direction Inbound -Priority 100 -SourceAddressPrefix $myIP -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389,22

# Create NSG
$nsg1 = New-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rg -Location $location -SecurityRules $allowMyIP

# Create a subnet configuration
$subnetConfig1 = New-AzVirtualNetworkSubnetConfig -Name "bastionSubnet" -AddressPrefix 10.0.0.0/24 -NetworkSecurityGroup $nsg1
$subnetConfig2 = New-AzVirtualNetworkSubnetConfig -Name "frontendSubnet" -AddressPrefix 10.0.1.0/24 -NetworkSecurityGroup $nsg1
$subnetConfig3 = New-AzVirtualNetworkSubnetConfig -Name "backendSubnet" -AddressPrefix 10.0.2.0/24 -NetworkSecurityGroup $nsg1

# Bastion IP
$bastionpip = New-AzPublicIpAddress -name "PIP-BASTION" -ResourceGroupName $rg -location $location -AllocationMethod "Static" -Sku "Standard"

# Create a virtual network card and associate with public IP address and NSG
New-AzNetworkInterface -Name "myNic" -ResourceGroupName "myResourceGroup" -Location "EastUS" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

# Create Bastion
New-AzBastion  -Name 'BASTION' -ResourceGroupName $rg -PublicIpAddress $bastionpip -VirtualNetworkId $vnet.Id

###################################################


# Create vNet
# New-AzVirtualNetwork -Name $vNetName -ResourceGroupName $rg -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $bastionSubnet,$frontendSubnet,$backendSubnet

# Create IP Config
# $IPConfig1 = New-AzNetworkInterfaceIpConfig -Name "IPConfig-1" -Subnet $backendSubnet -PublicIpAddress $vm1pip -Primary

# $IPconfig = New-AzNetworkInterfaceIpConfig -Name "IPConfig1" -Subnet $backendSubnet -PublicIpAddress $vm1pip -Primary -SubnetId $Subnet.Subnets[0].Id

####### TESTLINE ###### New-AzNetworkInterfaceIpConfig -Name "ipconfig1" -PrivateIpAddress "dynamic"

# Create NIC

# $vm1nic1 = New-AzNetworkInterface -Name "NetworkInterface1" -ResourceGroupName $rg -Location $location -Subnet $backendSubnet.subnets[0].Id -IpConfiguration $IpConfig1 -NetworkSecurityGroup $nsg1 -errorAction SilentlyContinue
# $NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $Vnet.Subnets[0].Id -PublicIpAddressId $PIP.Id
# $nic = New-AzNetworkInterface -Name "myNic" -ResourceGroupName $rg -Location $location -SubnetId $vnet.Subnets[0].Id -NetworkSecurityGroupId $nsg.Id
####### TESTLINE ###### New-AzNetworkInterface -Name "name" -Location $location -NetworkSecurityGroup $nsg1 -IpConfiguration "ipconfig1"
### Create an Ubuntu Server and Windows Server virtual machines ###

# VM1 LINUX
# $vm1 = New-AzVMConfig -VMName vm1 -VMSize "Standard_B1s"
# $vm1 = Set-AzVMOperatingSystem -VM $vm1 -Linux -ComputerName vm1 -Credential $credential
# $vm1 = Add-AzVMNetworkInterface -VM $vm1 -Id $vm1nic1.Id -Primary
# $vm1 = Set-AzVMSourceImage -VM $vm1 -PublisherName 'Canonical' -Offer "UbuntuServer" -Skus "16.04-LTS" -Version latest
# $vm1 = Set-AzVMBootDiagnostic -VM $vm1 -Disable
# New-AzVM -ResourceGroupName $RG -Location $Location -VM $vm1 -Verbose