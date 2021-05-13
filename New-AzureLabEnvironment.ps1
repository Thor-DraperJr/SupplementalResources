# Connect to Azure
Connect-AzAccount

# Get and Select Azure Subscription
$subId = (Get-AzSubscription | Out-GridView -Title "Select Subscription..." -PassThru)
Set-AzContext -Subscription $subId.name

# Define VM credentials
$cred = Get-Credential -Message 'Enter a username and password for the virtual machine.'

# Define Azure region
$location = Read-Host "Enter location (ex. EastUS)"

# Create Resource Group
$rg = Read-Host "Enter your Resource Group Name"

# Define my IP
$myIP = (Invoke-RestMethod http://ipinfo.io/json) | Select-Object -exp ip 

# Define NSG name
$nsgName = Read-Host "Enter NSG Name (ex. nsg1)"

# vNet Address Prefix
$vNetAddressPrefix = Read-Host "Enter the vNet Prefix (ex. 10.0.0.0/16)"

# Subnet Address Prefixes (Frontend,Backend,Bastion)
$frontendSubnetAddressPrefix = Read-Host "Enter the Frontend Subnet Address Prefix (ex. 10.0.0.0/24)"
$backendSubnetAddressPrefix = Read-Host "Enter the Backend Subnet Address Prefix (ex. 10.0.1.0/24)"
$bastionSubnetAddressPrefix = Read-Host "Enter the Bastion Subnet Address Prefix (ex. 10.0.2.0/24)"



####################
az group create --location $location --resource-group $rg

#Create NSG rule: allowMyIP
$allowMyIP = New-AzNetworkSecurityRuleConfig -Name "Allow-my-IP" -Description "Allow-from-my-IP" -Access Allow -Protocol * -Direction Inbound -Priority 100 -SourceAddressPrefix $myIP -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389,22

# Create NSG
$nsg1 = New-AzureNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rg -Location $location -SecurityRules $allowMyIP

# Create Subnets
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix $frontendSubnetAddressPrefix New-AzeNetworkSecurityGroup $nsg1
$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix $backendSubnetAddressPrefix New-AzNetworkSecurityGroup $nsg1
$bastionSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix $bastionSubnetAddressPrefix New-AzNetworkSecurityGroup $nsg1

# Create vNet
NewAzVirtualNetwork -Name -ResourceGroupName $rg -Location $location -AddressPrefix $vNetAddressPrefix -Subnet $frontendSubnet,$backendSubnet,$bastionSubnet