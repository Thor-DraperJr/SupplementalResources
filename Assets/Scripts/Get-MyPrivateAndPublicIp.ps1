$myPrivateIp=Get-NetIPConfiguration -InterfaceAlias "Ethernet 2"
$myPublicIp=Invoke-RestMethod http://ipinfo.io/json

Write-Output "My private IP is:" $myPrivateIp.IPv4Address.IPAddress

Write-Output "My public IP is:"$myPublicIp.ip