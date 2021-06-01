# Installing the Active Directory Domain Service
Install-WindowsFeature AD-Domain-Services
# Importing the Required Modules
Import-Module ADDSDeployment
# Promote Server as Domain Controller
Install-ADDSForest
-CreateDnsDelegation:$false`
-DatabasePath “C:\Windows\NTDS”`
-DomainName “yourdomain.com”`
-DomainNetbiosName “YOURDOMAIN”`
-InstallDns:$true`
-LogPath “C:\Windows\NTDS”`
-NoRebootOnCompletion:$false`
-SysvolPath “C:\Windows\SYSVOL”`
-Force:$true
# Once you execute this, you will be asked to enter SafeModeAdministratorPassword – this is for the Directory Services Restore Mode (DSRM)

