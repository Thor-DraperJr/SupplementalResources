# AZ-500 Study Sessions
## Table of Contents
1. [Manage Azure Active Directory identities (30-35%)](\Assets\Study-Guides\Microsoft\AZ-500\1\readme.md)
    1. Manage Azure Active Directory identities
        1. configure security for service principals
        2. manage Azure AD directory groups
        3. manage Azure AD users
        4. manage administrative units
        5. configure password writeback
        6. configure authentication methods including password hash and Pass Through Authentication (PTA), OAuth, and passwordless
        7. transfer Azure subscriptions between Azure AD tenants
    2. Configure secure access by using Azure AD
        1. monitor privileged access for Azure AD Privileged Identity Management (PIM)
        2. configure Access Reviews
        3. configure PIM
        4. implement Conditional Access policies including Multi-Factor Authentication (MFA)
        5. configure Azure AD identity protection
    3. Manage application access
        1. create App Registration
        2. configure App Registration permissions scopes
        3. manage App Registration permission consent
        4. manage API access to Azure subscriptions and resources
    4. Manage access control
        1. configure subscription and resource permissions
        2. configure resource group permissions
        3. configure custom RBAC roles
        4. identify the appropriate role
            1. apply principle of least privilege
        5. interpret permissions
            1. check access
2. [Implement platform protection (15-20%)](\Assets\Study-Guides\Microsoft\AZ-500\2\readme.md)
    1. Implement advanced network security
        1. secure the connectivity of virtual networks (VPN authentication, Express Route encryption)
        2. configure Network Security Groups (NSGs) and Application Security Groups (ASGs)
        3. create and configure Azure Firewall
        4. implement Azure Firewall Manager
        5. configure Azure Front Door service as an Application Gateway
        6. configure a Web Application Firewall (WAF) on Azure Application Gateway
        7. configure Azure Bastion
        8. configure a firewall on a storage account, Azure SQL, KeyVault, or App Service
        9. implement Service Endpoints
        10. implement DDoS protection
    2. Configure advanced security for compute
        1. configure endpoint protection
        2. configure and monitor system updates for VMs
        3. configure authentication for Azure Container Registry
            1. implement vulnerability management
            2. configure isolation for AKS
            3. configure security for container registry
        4. implement Azure Disk Encryption
        5. configure authentication and security for Azure App Service
            1. configure SSL/TLS certs
            2. configure authentication for Azure Kubernetes Service
            3. configure automatic updates
3. [Manage security operations (25-30%)](\Assets\Study-Guides\Microsoft\AZ-500\3\readme.md)
    1. Monitor security by using Azure Monitor
        1. create and customize alerts
        2. monitor security logs by using Azure Monitor
        3. configure diagnostic logging and log retention
    2. Monitor security by using Azure Security Center
        1. evaluate vulnerability scans from Azure Security Center
        2. configure Just in Time VM access by using Azure Security Center
        3. configure centralized policy management by using Azure Security Center
        4. configure compliance policies and evaluate for compliance by using Azure Security Center
        5. configure workflow automation by using Azure Security Center
    3. Monitor security by using Azure Sentinel
        1. create and customize alerts
        2. configure data sources to Azure Sentinel
        3. evaluate results from Azure Sentinel
        4. configure a playbook by using Azure Sentinel
    4. Configure security policies
        1. configure security settings by using Azure Policy
        2. configure security settings by using Azure Blueprint
4. [Secure data and applications (20-25%)](\Assets\Study-Guides\Microsoft\AZ-500\4\readme.md)
    1. Configure security for storage
        1. configure access control for storage accounts
        2. configure key management for storage accounts
        3. configure Azure AD authentication for Azure Storage
        4. configure Azure AD Domain Services authentication for Azure Files
        5. create and manage Shared Access Signatures (SAS)
            1. create a shared access policy for a blob or blob container
        6. configure Storage Service Encryption
        7. configure Azure Defender for Storage
    2. Configure security for databases
        1. enable database authentication
        2. enable database auditing
        3. configure Azure Defender for SQL
            1. configure Azure SQL Database Advanced Threat Protection
        4. implement database encryption
            1. implement Azure SQL Database Always Encrypted
    3. Configure and manage Key Vault
        1. manage access to Key Vault
        2. manage permissions to secrets, certificates, and keys
            1. configure RBAC usage in Azure Key Vault
        3. manage certificates
        4. manage secrets
        5. configure key rotation
        6. backup and restore of Key Vault items
        7. configure Azure Defender for Key Vault