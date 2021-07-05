## 4 Secure data and applications (20-25%)

### 4.1 Configure security for storage

#### 4.1.1 configure access control for storage accounts
By default, all resources in Azure Storage are secured, and are available only to the account owner. Although you can use any of the authorization strategies outlined below to grant clients access to resources in your storage account, Microsoft recommends using Azure AD when possible for maximum security and ease of use.

* **Azure Active Directory (Azure AD)** integration for blobs, and queues. Azure provides Azure role-based access control (Azure RBAC) for control over a client's access to resources in a storage account.
* **Azure Active Directory Domain Services (Azure AD DS)** authentication for Azure Files. Azure Files supports identity-based authorization over Server Message Block (SMB) through Azure AD DS. You can use Azure RBAC for fine-grained control over a client's access to Azure Files resources in a storage account.
* **On-premises Active Directory Domain Services (AD DS, or on-premises AD DS) authentication** for Azure Files. Azure Files supports identity-based authorization over SMB through AD DS. Your AD DS environment can be hosted in on-premises machines or in Azure VMs. SMB access to Files is supported using AD DS credentials from domain joined machines, either on-premises or in Azure. You can use a combination of Azure RBAC for share level access control and NTFS DACLs for directory/file level permission enforcement.
* **Shared Key authorization** for blobs, files, queues, and tables. A client using Shared Key passes a header with every request that is signed using the storage account access key.
* **Shared access signatures** for blobs, files, queues, and tables. Shared access signatures (SAS) provide limited delegated access to resources in a storage account. Adding constraints on the time interval for which the signature is valid or on permissions it grants provides flexibility in managing access.

[Authorizing data operations](https://docs.microsoft.com/en-us/azure/storage/common/storage-auth?toc=/azure/storage/blobs/toc.json)
---
Azure Storage supports using Azure Active Directory (Azure AD) to authorize requests to Blob and Queue storage. With Azure AD, you can use role-based access control (RBAC) to grant permissions to a security principal, which may be a user, group, or application service principal.

The security principal is authenticated by Azure AD to return an OAuth 2.0 token. The token can then be used to authorize a request against Blob or Queue storage.

NOTE: Microsoft recommends using Azure AD authorization with your blob and queue applications when possible to minimize potential security vulnerabilities inherent in Shared Key.

Authorization with Azure AD is available for all general-purpose and Blob storage accounts in all public regions and national clouds. Only storage accounts created with the Azure Resource Manager deployment model support Azure AD authorization.

NOTE: Authorization with Azure AD is not supported for Azure Table storage. Use Shared Key to authorize requests to Table storage.

When a security principal (a user, group, or application) attempts to access a blob or queue resource, the request must be authorized, unless it is a blob available for anonymous access.

With Azure AD, access to a resource is a two-step process:

First, the security principal's identity is authenticated and an OAuth 2.0
token is returned.

Second, the token is passed as part of a request to the Blob or Queue service
and used by the service to authorize access to the specified resource.

The authentication step requires that an application request an OAuth 2.0 access token at runtime. If an application is running from within an Azure entity such as an Azure VM, a virtual machine scale set, or an Azure Functions app, it can use a managed identity to access blobs or queues.

The authorization step requires that one or more RBAC roles be assigned to the security principal. Azure Storage provides RBAC roles that encompass common sets of permissions for blob and queue data. The roles that are assigned to a security principal determine the permissions that the principal will have.

NOTE: Native applications and web applications that make requests to the Azure Blob or Queue service can also authorize access with Azure AD.

How do I assign RBAC roles for access rights? -

Azure Active Directory (Azure AD) authorizes access rights to secured resources through role-based access control (RBAC). Azure Storage defines a set of built-in RBAC roles that encompass common sets of permissions used to access blob and queue data. You can also define custom roles for access to blob and queue data.

When an RBAC role is assigned to an Azure AD security principal, Azure grants access to those resources for that security principal. Access can be scoped to the level of the subscription, the resource group, the storage account, or an individual container or queue. An Azure AD security principal may be a user, a group, an application service principal, or a managed identity for Azure resources.

What are the Built-in RBAC roles for blobs and queues? -

Azure provides the following built-in RBAC roles for authorizing access to blob and queue data using Azure AD and OAuth:

* Storage Blob Data Owner: Use to set ownership and manage POSIX access
control for Azure Data Lake Storage Gen2.

* Storage Blob Data Contributor: Use to grant read/write/delete permissions to
Blob storage resources.

* Storage Blob Data Reader: Use to grant read-only permissions to Blob storage
resources.

* Storage Queue Data Contributor: Use to grant read/write/delete permissions
to Azure queues.

* Storage Queue Data Reader: Use to grant read-only permissions to Azure queues.

* Storage Queue Data Message Processor: Use to grant peek, retrieve, and
delete permissions to messages in Azure Storage queues.

* Storage Queue Data Message Sender: Use to grant add permissions to messages
in Azure Storage queues.

NOTE: RBAC role assignments may take up to five minutes to propagate.

Only roles explicitly defined for data access permit a security principal to access blob or queue data. Roles such as Owner, Contributor, and Storage Account Contributor permit a security principal to manage a storage account, but do not provide access to the blob or queue data within that account.

What is the concept of "Resource scope"? -

Before you assign an RBAC role to a security principal, determine the scope of access that the security principal should have. Best practices dictate that it's always best to grant only the narrowest possible scope.

The following list describes the levels at which you can scope access to Azure blob and queue resources, starting with the narrowest scope:

* An individual container - At this scope, a role assignment applies to all of
the blobs in the container, as well as container properties and metadata.

* An individual queue - At this scope, a role assignment applies to messages
in the queue, as well as queue properties and metadata.

* The storage account - At this scope, a role assignment applies to all
containers and their blobs, or to all queues and their messages.

* The resource group - At this scope, a role assignment applies to all of the
containers or queues in all of the storage accounts in the resource group.

* The subscription - At this scope, a role assignment applies to all of the
containers or queues in all of the storage accounts in all of the resource groups in the subscription.

NOTE: If your subscription includes an Azure DataBricks namespace, roles that are scoped to the subscription will not grant access to blob and queue data. Scope roles to the resource group, storage account, or container or queue instead.
#### 4.1.2 configure key management for storage accounts
When you create a storage account, Azure generates two 512-bit storage account access keys. These keys can be used to authorize access to data in your storage account via Shared Key authorization.

Microsoft recommends that you use Azure Key Vault to manage your access keys, and that you regularly rotate and regenerate your keys. Using Azure Key Vault makes it easy to rotate your keys without interruption to your applications. You can also manually rotate your keys.

Protect your access keys
Your storage account access keys are similar to a root password for your storage account. Always be careful to protect your access keys. Use Azure Key Vault to manage and rotate your keys securely. Avoid distributing access keys to other users, hard-coding them, or saving them anywhere in plain text that is accessible to others. Rotate your keys if you believe they may have been compromised.

> Note
> Microsoft recommends using Azure Active Directory (Azure AD) to authorize requests against blob and queue data if possible, instead of Shared Key. Azure AD provides superior security and ease of use over Shared Key.

[Manage storage account access keys](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal)
---
When you create a storage account, Azure generates two 512-bit storage account access keys. These keys can be used to authorize access to data in your storage account via Shared Key authorization.

Microsoft recommends that you use Azure Key Vault to manage your access keys, and that you regularly rotate and regenerate your keys. (You can also manually rotate your keys)

NOTE: Avoid distributing access keys to other users, hard-coding them, or saving them anywhere in plain text that is accessible to others. Rotate your keys if you believe they may have been compromised.

How do I use Azure Key Vault to manage access keys? -

An Azure storage account uses credentials comprising an account name and a key. The key is autogenerated and serves as a password, rather than an as a cryptographic key.

Key Vault manages storage account keys by periodically regenerating them in storage account and provides shared access signature tokens for delegated access to resources in your storage account.

You can use the Key Vault managed storage account key feature to list (sync) keys with an Azure storage account, and regenerate (rotate) the keys periodically.

NOTE: You can manage keys for both storage accounts and Classic storage accounts.

When you use the managed storage account key feature, consider the following points:

* Key values are never returned in response to a caller.

* Only Key Vault should manage your storage account keys. (Do not manage the
keys yourself and avoid interfering with Key Vault processes.)

* Only a single Key Vault object should manage storage account keys.
* Do not allow key management from multiple objects.

* You can request Key Vault to manage your storage account with a user
principal, but not with a service principal.

Microsoft recommends using Azure Storage integration with Azure Active Directory (Azure AD), Microsoft's cloud-based identity and access management service.

Azure AD integration is available for Azure blobs and queues, and provides OAuth2 token-based access to Azure Storage (just like Azure Key Vault).

Azure AD allows you to authenticate your client application by using an application or user identity, instead of storage account credentials.

You can use an Azure AD managed identity when you run on Azure. Managed identities remove the need for client authentication and storing credentials in or with your application.

Azure AD uses role-based access control (RBAC) to manage authorization, which is also supported by Key Vault.

How do I manually rotate access keys? -
Two access keys are assigned so that you can rotate your keys. Having two keys ensures that your application maintains access to Azure Storage throughout the process.
__**NOTE: Regenerating your access keys can affect any applications or Azure services that are dependent on the storage account key. Any clients that use the account key to access the storage account must be updated to use the new key, including media services, cloud, desktop and mobile applications, and graphical user interface applications for Azure Storage, such as Azure Storage Explorer.
**To rotate your storage account access keys in the Azure portal:**
1. Update the connection strings in your application code to reference the secondary access key for the storage account.
2. Navigate to your storage account in the Azure portal.
3. Under Settings, select Access keys.
4. To regenerate the primary access key for your storage account, select the Regenerate button next to the primary access key.
5. Update the connection strings in your code to reference the new primary access key.
6. Regenerate the secondary access key in the same manner.
__***NOTE:* Microsoft recommends using only one of the keys in all of your applications at the same time. If you use Key 1 in some places and Key 2 in others, you will not be able to rotate your keys without some application losing access.
To rotate an account's access keys, the user must either be a Service Administrator, or must be assigned an RBAC role that includes the Microsoft.Storage/storageAccounts/regeneratekey/action.
Some built-in RBAC roles that include this action are the Owner, Contributor, and Storage Account Key Operator Service Role roles.
**To rotate your storage account access keys with PowerShell -**
1. Update the connection strings in your application code to reference the secondary access key for the storage account.
2. Call the New-AzStorageAccountKey command to regenerate the primary access key, as shown in the following example:
New-AzStorageAccountKey -ResourceGroupName <resource-group> -Name <storage-account> -KeyName key1
3. Update the connection strings in your code to reference the new primary access key.
4. Regenerate the secondary access key in the same manner. To regenerate the secondary key, use key2 as the key name instead of key1.
#### 4.1.3 configure Azure AD authentication for Azure Storage
#### 4.1.4 configure Azure AD Domain Services authentication for Azure Files
Azure Files supports identity-based authentication over Server Message Block (SMB) through on-premises Active Directory Domain Services (AD DS) and Azure Active Directory Domain Services (Azure AD DS).

Enabling identity-based access for your Azure file shares allows you to replace existing file servers with Azure file shares without replacing your existing directory service, maintaining seamless user access to shares.

Azure Files enforces authorization on user access to both the share and the directory/file levels. Share-level permission assignment can be performed on Azure Active Directory (Azure AD) users or groups managed through the role-based access control (RBAC) model.

With RBAC, the credentials you use for file access should be available or synced to Azure AD. You can assign built-in RBAC roles like Storage File Data SMB Share Reader to users or groups in Azure AD to grant read access to an Azure file share.

At the directory/file level, Azure Files supports preserving, inheriting, and enforcing Windows DACLs just like any Windows file servers.

You can choose to keep Windows DACLs when copying data over SMB between your existing file share and your Azure file shares. Whether you plan to enforce authorization or not, you can use Azure file shares to back up ACLs along with your data.

Vocabulary you should know for the exam -

* Kerberos authentication - used to verify the identity of a user or host.

* Server Message Block (SMB) protocol - industry-standard network
file-sharing protocol; also known as Common Internet File System or CIFS.

* Azure Active Directory (Azure AD) - Microsoft's multi-tenant cloud-based
directory and identity management service. Azure AD combines core directory services, application access management, and identity protection into a single solution. Azure AD-joined Windows virtual machines (VMs) can access Azure file shares with your Azure AD credentials.

* Azure Active Directory Domain Services (Azure AD DS) - provides managed
domain services such as domain join, group policies, LDAP, and Kerberos/NTLM authentication. These services are fully compatible with Active Directory Domain Services.

* On-premises Active Directory Domain Services (AD DS) - integration with
Azure Files provides the methods for storing directory data while making it available to network users and administrators. Security is integrated with AD DS through logon authentication and access control to objects in the directory.

* Azure Role Based Access Control (RBAC) - enables fine-grained access
management for Azure. Using RBAC, you can manage access to resources by granting users the fewest permissions needed to perform their jobs.

What are the common use cases for doing this? -

Identity-based authentication and support for Windows ACLs on Azure Files is best leveraged for the following use cases:

Replace on-premises file servers -

Azure file shares with on-premises AD DS authentication is the best fit here, when you can migrate the data to Azure Files. A complete migration will allow you to take advantage of the high availability and scalability benefits while also minimizing the client-side changes.

Lift and shift applications to Azure -

Azure file shares provide the option to integrate with either Azure AD DS or on-premises AD DS for authentication.

Backup and disaster recovery (DR) -

If you are keeping your primary file storage on-premises, Azure file shares can serve as an ideal storage for backup or DR, to improve business continuity. You can use Azure file shares to back up your data from existing file servers, while preserving Windows DACLs. For DR scenarios, you can configure an authentication option to support proper access control enforcement at failover.

What do I need to know before doing this? -

Azure AD DS authentication - Azure AD DS-joined Windows machines can access Azure file shares with Azure AD credentials over SMB.

On-premises AD DS authentication - On-premises AD DS-joined or Azure AD DS-joined Windows machines can access Azure file shares with on-premises Active Directory credentials that are synched to Azure AD over SMB.

Restrictions -

* Azure AD DS and on-premises AD DS authentication do not support
authentication against computer accounts. You can consider using a service logon account instead.

* Neither Azure AD DS authentication nor on-premises AD DS authentication is
supported against Azure AD-joined devices or Azure AD-registered devices.

* Azure file shares only support identity-based authentication against one of
the following domain services, either Azure Active Directory Domain Services (Azure AD DS) or on-premises Active Directory Domain Services (AD DS).

How does it actually work? -

Azure file shares leverages the Kerberos protocol for authenticating with either on-premises AD DS or Azure AD DS.

When an identity associated with a user or application running on a client attempts to access data in Azure file shares, the request is sent to the domain service, either AD DS or Azure AD DS, to authenticate the identity.

If authentication is successful, it returns a Kerberos token. The client sends a request that includes the Kerberos token and Azure file shares use that token to authorize the request.

Azure file shares only receive the Kerberos token, not access credentials.

What do I have to do to setup and use AD DS? -

For on-premises AD DS authentication, you must set up your AD domain controllers and domain join your machines or VMs. You can host your domain controllers on Azure VMs or on-premises.

Either way, your domain joined clients must have line of sight to the domain service, so they must be within the corporate network or virtual network (VNET) of your domain service.

The on-prem AD DS must be synced to Azure AD using Azure AD Connect sync.

NOTE: Only hybrid users that exist in both on-premises AD DS and Azure AD can be authenticated and authorized for Azure file share access. This is because the share level permission is configured against the identity represented in Azure AD where the directory/file level permission is enforced with that in AD DS.

Make sure that you configure the permissions correctly against the same hybrid user.

What do I have to do to setup and use Azure AD DS? -

For Azure AD DS authentication, you should enable Azure AD Domain Services and domain join the VMs you plan to access file data from. Your domain-joined VM must reside in the same virtual network (VNET) as your Azure AD DS.

There are two major differences:

First, you do not need to create the identity in Azure AD DS to represent the storage account. This is performed by the enablement process in the background.

Second, all users exist in Azure AD can be authenticated and authorized. The user can be cloud only or hybrid. The sync from Azure AD to Azure AD DS is managed by the platform without requiring any user configuration.

However, the client must be domain joined to Azure AD DS, it cannot be Azure AD joined or registered.

How do I enable Azure AD DS authentication for a storage account? -

To enable Azure AD DS authentication over SMB for Azure Files, you can set a property on storage accounts by using the Azure portal, Azure PowerShell, or Azure CLI.

Setting this property implicitly "domain joins" the storage account with the associated Azure AD DS deployment. Azure AD DS authentication over SMB is then enabled for all new and existing file shares in the storage account.

NOTE: You can enable Azure AD DS authentication over SMB only after you have successfully deployed Azure AD DS to your Azure AD tenant.

__**Azure portal:

1. In the Azure portal, go to your existing storage account, or create a storage account.

2. In the Settings section, select Configuration.

3. Under Identity-based access for file shares switch the toggle for Azure Active Directory Domain Service (AAD DS) to Enabled.

4. Select Save.

PowerShell:

To enable Azure AD DS authentication over SMB with Azure PowerShell, install the latest Az module (2.4 or newer) or the Az.Storage module (1.5 or newer).

To create a new storage account, call New-AzStorageAccount, and then set the EnableAzureActiveDirectoryDomainServicesForFile parameter to true.

In the following example, remember to replace the placeholder values with your own values. (If you were using the previous preview module, the parameter for feature enablement is EnableAzureFilesAadIntegrationForSMB.)

Create a new storage account
New-AzStorageAccount -ResourceGroupName "<resource-group-name>" -Name "<storage-account-name>" -Location "<azure-region>" -SkuName Standard_LRS -Kind StorageV2 ` -EnableAzureActiveDirectoryDomainServicesForFile $true

Update a storage account
Set-AzStorageAccount -ResourceGroupName "<resource-group-name>" -Name "<storage-account-name>" -EnableAzureActiveDirectoryDomainServicesForFile $true

Azure CLI:

To enable Azure AD authentication over SMB with Azure CLI, install the latest CLI version (Version 2.0.70 or newer).

To create a new storage account, call az storage account create, and set the --enable-files-aadds property to true. In the following example, remember to replace the placeholder values with your own values. (If you were using the previous preview module, the parameter for feature enablement is file-aad.)

Create a new storage account
az storage account create -n <storage-account-name> -g <resource-group-name> --enable-files-aadds $true

Update a new storage account
az storage account update -n <storage-account-name> -g <resource-group-name> --enable-files-aadds $true

How do I assign access permissions to an identity? -

To access Azure Files resources with identity based authentication, an identity (a user, group, or service principal) must have the necessary permissions at the share level.

This process is similar to specifying Windows share permissions, where you specify the type of access that a particular user has to a file share.

Microsoft has introduced three Azure built-in roles for granting share-level permissions to users:

* Storage File Data SMB Share Reader - allows read access in Azure Storage
file shares over SMB.

* Storage File Data SMB Share Contributor - allows read, write, and delete
access in Azure Storage file shares over SMB.

* Storage File Data SMB Share Elevated Contributor - allows read, write,
delete and modify NTFS permissions in Azure Storage file shares over SMB.

NOTE: Full administrative control of a file share, including the ability to take ownership of a file, requires using the storage account key. Administrative control is not supported with Azure AD credentials.

You can use the Azure portal, PowerShell, or Azure CLI to assign the built-in roles to the Azure AD identity of a user for granting share-level permissions. Be aware that the share level RBAC role assignment can take some time to be in effect.

NOTE: Remember to sync your AD DS credentials to Azure AD if you plan to use your on-premises AD DS for authentication. Password hash sync from AD DS to Azure AD is optional. Share level permission will be granted to the Azure AD identity that is synced from your on-premises AD DS.

The general recommendation is to use share level permission for high level access management to an AD group representing a group of users and identities, then leverage NTFS permissions for granular access control on directory/file level.

__**Azure portal:

1. In the Azure portal, go to your file share, or Create a file share.

2. Select Access Control (IAM).

3. Select Add a role assignment

4. In the Add role assignment blade, select the appropriate built-in role (Storage File Data SMB Share Reader, Storage File Data SMB Share Contributor) from the Role list. Leave Assign access to at the default setting: Azure AD user, group, or service principal. Select the target Azure AD identity by name or email address.

5. Select Save to complete the role assignment operation.

How do I configure NTFS permissions over SMB? -

After you assign share-level permissions with RBAC, you must assign proper NTFS permissions at the root, directory, or file level. Think of share-level permissions as the high-level gatekeeper that determines whether a user can access the share. Whereas NTFS permissions act at a more granular level to determine what operations the user can do at the directory or file level.

Azure Files supports the full set of NTFS basic and advanced permissions. You can view and configure NTFS permissions on directories and files in an Azure file share by mounting the share and then using Windows File Explorer or running the Windows icacls or Set-ACL command.

To configure NTFS with superuser permissions, you must mount the share by using your storage account key from your domain-joined VM.

The following sets of permissions are supported on the root directory of a file share:

BUILTIN\Administrators:(OI)(CI)(F) NT AUTHORITY\SYSTEM:(OI)(CI)(F) BUILTIN\Users:(RX) BUILTIN\Users:(OI)(CI)(IO)(GR,GE) NT AUTHORITY\Authenticated Users:(OI)(CI)(M) NT AUTHORITY\SYSTEM:(F) CREATOR OWNER:(OI)(CI)(IO)(F)
#### 4.1.5 create and manage Shared Access Signatures (SAS)
Create and manage Shared Access Signatures (SAS)

A shared access signature (SAS) provides secure delegated access to resources in your storage account without compromising the security of your data. With a SAS, you have granular control over how a client can access your data. You can control what resources the client may access, what permissions they have on those resources, and how long the SAS is valid, among other parameters.

What are the types of shared access signatures? -

Azure Storage supports three types of shared access signatures:

* User delegation SAS - A user delegation SAS is secured with Azure Active
Directory (Azure AD) credentials and also by the permissions specified for the SAS. A user delegation SAS applies to Blob storage only.

* Service SAS - A service SAS is secured with the storage account key. A
service SAS delegates access to a resource in only one of the Azure Storage services: Blob storage, Queue storage, Table storage, or Azure Files.

* Account SAS - An account SAS is secured with the storage account key. An
account SAS delegates access to resources in one or more of the storage services.

All of the operations available via a service or user delegation SAS are also available via an account SAS.

Additionally, with the account SAS, you can delegate access to operations that apply at the level of the service, such as Get/Set Service Properties and Get Service Stats operations.

You can also delegate access to read, write, and delete operations on blob containers, tables, queues, and file shares that are not permitted with a service SAS.

A shared access signature can take one of two forms:

* Ad hoc SAS - When you create an ad hoc SAS, the start time, expiry time, and
permissions for the SAS are all specified in the SAS URI (or implied, if start time is omitted). Any type of SAS can be an ad hoc SAS.

> NOTE: A user delegation SAS or an account SAS must be an ad hoc SAS. Stored access policies are not supported for the user delegation SAS or the account SAS.

* Service SAS with stored access policy - A stored access policy is defined
on a resource container, which can be a blob container, table, queue, or file share. The stored access policy can be used to manage constraints for one or more service shared access signatures. When you associate a service SAS with a stored access policy, the SAS inherits the constraints — the start time, expiry time, and permissions defined for the stored access policy.

How does a shared access signature work? -

A shared access signature is a signed URI that points to one or more storage resources and includes a token that contains a special set of query parameters.

The token indicates how the resources may be accessed by the client. One of the query parameters, the signature, is constructed from the SAS parameters and signed with the key that was used to create the SAS.

This signature is used by Azure Storage to authorize access to the storage resource.

You can sign a SAS in one of two ways:

* With a user delegation key that was created using Azure Active Directory
(Azure AD) credentials - A user delegation SAS is signed with the user delegation key.

To get the user delegation key and create the SAS, an Azure AD security principal must be assigned a role-based access control (RBAC) role that includes the Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey action.

* With the storage account key - Both a service SAS and an account SAS are
signed with the storage account key. To create a SAS that is signed with the account key, an application must have access to the account key.

What about the SAS token? -

The SAS token is a string that you generate on the client side, for example by using one of the Azure Storage client libraries.

The SAS token is not tracked by Azure Storage in any way. You can create an unlimited number of SAS tokens on the client side.

After you create a SAS, you can distribute it to client applications that require access to resources in your storage account.

When a client application provides a SAS URI to Azure Storage as part of a request, the service checks the SAS parameters and signature to verify that it is valid for authorizing the request.

If the service verifies that the signature is valid, then the request is authorized.

Otherwise, the request is declined with error code 403 (Forbidden).

When would I have to use a shared access signature? -

Use a SAS when you want to provide secure access to resources in your storage account to any client who does not otherwise have permissions to those resources.

Additionally, a SAS is required to authorize access to the source object in a copy operation in certain scenarios:

* When you copy a blob to another blob that resides in a different storage
account, you must use a SAS to authorize access to the source blob. You can optionally use a SAS to authorize access to the destination blob as well.

* When you copy a file to another file that resides in a different storage
account, you must use a SAS to authorize access to the source file. You can optionally use a SAS to authorize access to the destination file as well.

* When you copy a blob to a file, or a file to a blob, you must use a SAS to
authorize access to the source object, even if the source and destination objects reside within the same storage account.

What are the best practices that I should deploy when using SAS? -

When you use shared access signatures in your applications, you need to be aware of two potential risks:

* If a SAS is leaked, it can be used by anyone who obtains it, which can
potentially compromise your storage account.

* If a SAS provided to a client application expires and the application is
unable to retrieve a new SAS from your service, then the application's functionality may be hindered.

The following recommendations for using shared access signatures can help mitigate these risks:

* Always use HTTPS to create or distribute a SAS - If a SAS is passed over
HTTP and intercepted, an attacker performing a man-in-the-middle attack is able to read the SAS and then use it just as the intended user could have.

* Use a user delegation SAS when possible - A user delegation SAS provides
superior security to a service SAS or an account SAS. A user delegation SAS is secured with Azure AD credentials, so that you do not need to store your account key with your code.

* Have a revocation plan in place for a SAS - Make sure you are prepared to
respond if a SAS is compromised.

* Define a stored access policy for a service SAS - Stored access policies give
you the option to revoke permissions for a service SAS without having to regenerate the storage account keys. Set the expiration on these very far in the future (or infinite) and make sure it is regularly updated to move it farther into the future.

* Use near-term expiration times on an ad hoc SAS service SAS or account SAS -
In this way, even if a SAS is compromised, it is valid only for a short time. This practice is especially important if you cannot reference a stored access policy.

* Be careful with SAS start time - If you set the start time for a SAS to now,
then due to clock skew (differences in current time according to different machines), failures may be observed intermittently for the first few minutes.

In general, set the start time to be at least 15 minutes in the past. Or, do not set it at all, which will make it valid immediately in all cases. The same generally applies to expiry time as well--remember that you may observe up to 15 minutes of clock skew in either direction on any request.

* Be careful with SAS datetime format - If you set the start time and/or
expiry for a SAS, for some utilities (for example for the command-line utility AzCopy) you need the datetime format to be '+%Y-%m-%dT%H:%M:%SZ', specifically including the seconds in order for it to work using the SAS token.

* Be specific with the resource to be accessed - A security best practice is
to provide a user with the minimum required privileges.

* Validate data written using a SAS - If your application requires that data
be validated or authorized before it is ready to use, you should perform this validation after the data is written and before it is used by your application. This practice also protects against corrupt or malicious data being written to your account, either by a user who properly acquired the SAS, or by a user exploiting a leaked SAS.

* Know when not to use a SAS - For example, if you want to make all blobs in
a container publicly readable, you can make the container Public, rather than providing a SAS to every client for access.

* Use Azure Monitor and Azure Storage logs to monitor your application - You
can use Azure Monitor and storage analytics logging to observe any spike in authorization failures due to an outage in your SAS provider service or to the inadvertent removal of a stored access policy.

- Create a stored access policy
- Modify a stored access policy
    - To modify the parameters of the stored access policy, you can call the access control list operation for the resource type to replace the existing policy, specifying a new start time, expiry time, or set of permissions. For example, if your existing policy grants read and write permissions to a resource, you can modify it to grant only read permissions for all future requests. In this case, the signed identifier of the new policy, as specified by the `ID` field, would be identical to the signed identifier of the policy you are replacing.
- Revoke a stored access policy
    - To revoke a stored access policy, you can delete it, rename it by changing the signed identifier, or change the expiry time to a value in the past. Changing the signed identifier breaks the associations between any existing signatures and the stored access policy. Changing the expiry time to a value in the past causes any associated signatures to expire. Deleting or modifying the stored access policy immediately affects all of the shared access signatures associated with it. To remove a single access policy, call the resource's `Set ACL` operation, passing in the set of signed identifiers that you wish to maintain on the container. To remove all access policies from the resource, call the Set ACL operation with an empty request body.
__**Helpful Links:
- https://docs.microsoft.com/en-us/rest/api/storageservices/define-stored-access-policy
##### 4.1.5.1 create a shared access policy for a blob or blob container
Create a shared access policy for a blob or blob container

A Shared Access Signature (SAS) is a URI that enables restricted access to entities within a storage account. This URI can then be passed to a client that requires access to a container or a single blob etc. within a storage account without having to give them a storage account key.

A stored access policy provides an additional level of control over service-level shared access signatures (SAS) on the server side. Establishing a stored access policy serves to group shared access signatures and to provide additional restrictions for signatures that are bound by the policy. You can use a stored access policy to change the start time, expiry time, or permissions for a signature, or to revoke it after it has been issued.

The following storage resources support stored access policies:

* Blob containers
* File shares
* Queues
* Tables
NOTE: A maximum of five access policies may be set on a container, table, queue, or share at any given time. Each SignedIdentifier field, with its unique Id field, corresponds to one access policy. Attempting to set more than five access policies at one time results in the service returning status code 400 (Bad Request).

NOTE: When you establish a stored access policy on a container, table, queue, or share, it may take up to 30 seconds to take effect. During this interval, requests against a shared access signature that is associated with the stored access policy may fail with status code 403 (Forbidden), until the access policy becomes active.

Table entity range restrictions (startpk, startrk, endpk, and endrk) cannot be specified in a stored access policy.

Create a shared access policy for a blob or blob container
Log into Azure Account
Connect-AzAccount

Create a resource group
$ResourceGroup = New-AzResourceGroup -Name "SAPolicy" -Location "East US"

Create a storage account
$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroup.ResourceGroupName -Name "sapolstore" -SkuName Standard_LRS -Location $ResourceGroup.location

Get the access keys of the Storage Account you just created
$AccountKeys = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroup.ResourceGroupName -Name $StorageAccount.StorageAccountName

Create a storage context to work with the storage account you just created
(It will use the first access key on the account)
$StorageContext = New-AzStorageContext -StorageAccountName $StorageAccount.StorageAccountName -StorageAccountKey $AccountKeys[0].Value

Create a container in the Storage Account we created earlier
$StorageContainer = New-AzStorageContainer -Name "sapolcontainer" -Context $StorageContext

Download a sample mp4 video file and upload it to the Storage Account
container you created earlier
Invoke-WebRequest -Uri "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4" -OutFile C:\Video\big_buck_bunny_720p_1mb.mp4

Set-AzStorageBlobContent -File C:\Video\big_buck_bunny_720p_1mb.mp4 -Container $StorageContainer.Name -Blob "Bunny720p.mp4" -Context $StorageContext -Properties @{"ContentType" = "video/mp4"}

Create a Stored Access Policy for the container you created earlier with
read access to its blobs and an exiry time of 5 hours from the point of
creation
$SASPolicy = New-AzStorageContainerStoredAccessPolicy -Container $StorageContainer.Name -Policy "ITPTVSASPolicy" -Context $StorageContext -Permission "r" -StartTime (Get-Date).DateTime -ExpiryTime (Get-Date).AddHours(5).DateTime

Get-AzStorageContainerStoredAccessPolicy -Container $StorageContainer.Name -Policy $SASPolicy -Context $StorageContext | FL

Create a SAS token using the policy you created earlier
$SASToken = New-AzStorageContainerSASToken -Name $StorageContainer.Name -Policy $SASPolicy -Context $StorageContext

Get the full URL including SAS token to access the video file you uploaded
to the storage account earlier
(Get-AzStorageBlob -Blob "Bunny720p.mp4" -Container $StorageContainer.Name -Context $StorageContext).ICloudBlob.Uri.AbsoluteUri + $SASToken | Clip

Set the Stored Access Policy Expiry time to 30 minutes in the past
Set-AzStorageContainerStoredAccessPolicy -Container $StorageContainer.Name -Policy $SASPolicy -Context $storageContext -ExpiryTime ((Get-Date).AddMinutes(-30))
#### 4.1.6 configure Storage Service Encryption
Data in Azure Storage is encrypted and decrypted transparently using 256-bit AES encryption, one of the strongest block ciphers available, and is FIPS 140-2 compliant. Azure Storage encryption is similar to BitLocker encryption on Windows.

Azure Storage encryption is enabled for all storage accounts, including both Resource Manager and classic storage accounts. Azure Storage encryption cannot be disabled. Because your data is secured by default, you do not need to modify your code or applications to take advantage of Azure Storage encryption.

Data in a storage account is encrypted regardless of performance tier (standard or premium), access tier (hot or cool), or deployment model (Azure Resource Manager or classic).

All blobs in the archive tier are also encrypted. All Azure Storage redundancy options support encryption, and all data in both the primary and secondary regions is encrypted when geo-replication is enabled.

All Azure Storage resources are encrypted, including blobs, disks, files, queues, and tables. All object metadata is also encrypted. There is no additional cost for Azure Storage encryption.

NOTE: Every block blob, append blob, or page blob that was written to Azure Storage after October 20, 2017 is encrypted. Blobs created prior to this date continue to be encrypted by a background process. To force the encryption of a blob that was created before October 20, 2017, you can rewrite the blob.

KEK-Key encrypting key BYOK-Bring Your Own Key
#### 4.1.7 configure Azure Defender for Storage

### 4.2 Configure security for databases

#### 4.2.1 enable database authentication
Azure Active Directory authentication is a mechanism of connecting to Azure SQL Database, Managed Instance, and Azure Synapse Analytics by using identities in Azure Active Directory (Azure AD).

Connection strings - 

Managed instanced need at least read permission before for the role before it's created
#### 4.2.2 enable database auditing
Auditing for Azure SQL Database and Azure Synapse Analytics tracks database events and writes them to an audit log in your Azure storage account, Log Analytics workspace, or Event Hubs.

How do I define server-level vs. database-level auditing policy? -

An auditing policy can be defined for a specific database or as a default server policy in Azure (which hosts SQL Database or Azure Synapse):

* A server policy applies to all existing and newly created databases on the
server.

* If server auditing is enabled, it always applies to the database. The
database will be audited, regardless of the database auditing settings.

* Enabling auditing on the database, in addition to enabling it on the server,
does not override or change any of the settings of the server auditing. Both audits will exist side by side. In other words, the database is audited twice in parallel; once by the server policy and once by the database policy.

The default auditing policy includes all actions and the following set of action groups, which will audit all the queries and stored procedures executed against the database, as well as successful and failed logins:

* BATCH_COMPLETED_GROUP
* SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP
* FAILED_DATABASE_AUTHENTICATION_GROUP
NOTE: Azure SQL Database and Azure Synapse Audit stores 4000 characters of data for character fields in an audit record. When the statement or the data_sensitivity_information values returned from an auditable action contain more than 4000 characters, any data beyond the first 4000 characters will be truncated and not audited.
#### 4.2.3 configure Azure Defender for SQL
##### 4.2.3.1 configure Azure SQL Database Advanced Threat Protection
Configure Azure SQL Database Advanced Threat Protection

Advanced Threat Protection for Azure SQL Database, Azure SQL Managed Instance and Azure Synapse detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases.

Advanced Threat Protection is part of the Advanced data security offering, which is a unified package for advanced SQL security capabilities. Advanced Threat Protection can be accessed and managed via the central SQL ADS portal.

Advanced Threat Protection can identify Potential SQL injection, Access from unusual location or data center, Access from unfamiliar principal or potentially harmful application, and Brute force SQL credentials.
#### 4.2.4 implement database encryption

##### 4.2.4.1 implement Azure SQL Database Always Encrypted
NOTE: By default, TDE is enabled for all newly deployed databases and must be manually enabled for older databases of Azure SQL Database, Azure SQL Managed Instance, or Azure Synapse.

TDE performs real-time I/O encryption and decryption of the data at the page level. Each page is decrypted when it is read into memory and then encrypted before being written to disk.

TDE encrypts the storage of an entire database by using a symmetric key called the Database Encryption Key (DEK). On database startup, the encrypted DEK is decrypted and then used for decryption and re-encryption of the database files in the SQL Server database engine process.

DEK is protected by the TDE protector. TDE protector is either a service-managed certificate (service-managed transparent data encryption) or an asymmetric key stored in Azure Key Vault (customer-managed transparent data encryption).

For Azure SQL Database and Azure Synapse, the TDE protector is set at the server level and is inherited by all databases associated with that server.

For Azure SQL Managed Instance (BYOK feature in preview), the TDE protector is set at the instance level and it is inherited by all encrypted databases on that instance.

NOTE: TDE cannot be used to encrypt the master database in SQL Database. The master database contains objects that are needed to perform the TDE operations on the user databases.

What is Service-managed transparent data encryption? -

In Azure, the default setting for TDE is that the DEK is protected by a built-in server certificate. The built-in server certificate is unique for each server and the encryption algorithm used is AES 256.

If a database is in a geo-replication relationship, both the primary and geo-secondary databases are protected by the primary database's parent server key.

If two databases are connected to the same server, they also share the same built-in certificate. Microsoft automatically rotates these certificates in compliance with the internal security policy and the root key is protected by a Microsoft internal secret store.

Customers can verify SQL Database and SQL Managed Instance compliance with internal security policies in independent third-party audit reports available on the Microsoft Trust Center.

Microsoft also seamlessly moves and manages the keys as needed for geo-replication and restores.

### 4.4.3 Configure and manage Key Vault

#### 4.4.3.1 manage access to Key Vault
#### 4.4.3.2 manage permissions to secrets, certificates, and keys
##### 4.4.3.2.1 configure RBAC usage in Azure Key Vault
Azure Key Vault helps solve the following problems:

* Secrets Management - can be used to Securely store and tightly control
access to tokens, passwords, certificates, API keys, and other secrets

* Key Management - makes it easy to create and control the encryption keys
used to encrypt your data.

* Certificate Management - lets you easily provision, manage, and deploy
public and private Transport Layer Security/Secure Sockets Layer (TLS/SSL) certificates for use with Azure and your internal connected resources.

* Store secrets backed by Hardware Security Modules - The secrets and keys
can be protected either by software or FIPS 140-2 Level 2 validated HSMs.

Azure Key Vault basic concepts:

Azure Key Vault is a tool for securely storing and accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, or certificates. A vault is a logical group of secrets.

* Tenant: the organization that owns and manages a specific instance of
Microsoft cloud services. It’s most often used to refer to the set of Azure and Office 365 services for an organization.

* Vault owner: can create a key vault and gain full access and control over it.
The vault owner can also set up auditing to log who accesses secrets and keys. Administrators can control the key lifecycle. They can roll to a new version of the key, back it up, and do related tasks.

* Vault consumer: can perform actions on the assets inside the key vault when
the vault owner grants the consumer access. The available actions depend on the permissions granted.

* Resource: a manageable item that's available through Azure. Common examples
are virtual machine, storage account, web app, database, and virtual network.

* Resource group: a container that holds related resources for an Azure
solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group.

* Service principal: a security identity that user-created apps, services, and
automation tools use to access specific Azure resources. Think of it as a "user identity" (username and password or certificate) with a specific role, and tightly controlled permissions. A service principal should only need to do specific things, unlike a general user identity. It improves security if you grant it only the minimum permission level that it needs to perform its management tasks.

* Azure Active Directory (Azure AD): the Active Directory service for a tenant.
Each directory has one or more domains. A directory can have many subscriptions associated with it, but only one tenant.

* Azure tenant ID: a unique way to identify an Azure AD instance within an
Azure subscription.

* Managed identities: use this identity to authenticate to Key Vault or any
service that supports Azure AD authentication, without having any credentials in your code.

Access model overview:

Access to a key vault is controlled through two interfaces: the management plane and the data plane.

The management plane is where you manage Key Vault itself. Operations in this plane include creating and deleting key vaults, retrieving Key Vault properties, and updating access policies.

The data plane is where you work with the data stored in a key vault. You can add, delete, and modify keys, secrets, and certificates.

To access a key vault in either plane, all callers (users or applications) must have proper authentication and authorization.

Authentication establishes the identity of the caller.

Authorization determines which operations the caller can execute.

Both planes use Azure Active Directory (Azure AD) for authentication.

For authorization, the management plane uses role-based access control (RBAC) and the data plane uses a Key Vault access policy.

To do any operations with Key Vault, you first need to authenticate to it.

There are three ways to authenticate to Key Vault:

* Managed identities for Azure resources: When you deploy an app on a virtual
machine in Azure, you can assign an identity to your virtual machine that has access to Key Vault. You can also assign identities to other Azure resources. The benefit of this approach is that the app or service is not managing the rotation of the first secret. Azure automatically rotates the identity.

(NOTE: recommended as a best practice)

* Service principal and certificate: You can use a service principal and an
associated certificate that has access to Key Vault.

(NOTE: not recommended because the application owner or developer must rotate the certificate)

* Service principal and secret: Not recommended as it is hard to automatically
rotate the bootstrap secret that's used to authenticate to Key Vault.

Active Directory authentication -

When you create a key vault in an Azure subscription, it's automatically associated with the Azure AD tenant of the subscription. All callers in both planes must register in this tenant and authenticate to access the key vault.

In both cases, applications can access Key Vault in two ways:

User plus application access: The application accesses Key Vault on behalf of a signed-in user. Examples of this type of access include Azure PowerShell and the Azure portal. User access is granted in two ways. Users can access Key Vault from any application, or they must use a specific application (referred to as compound identity).

Application-only access: The application runs as a daemon service or background job. The application identity is granted access to the key vault.

For both types of access, the application authenticates with Azure AD.

The application uses any supported authentication method based on the application type. The application acquires a token for a resource in the plane to grant access. The resource is an endpoint in the management or data plane, based on the Azure environment. The application uses the token and sends a REST API request to Key Vault.

Resource endpoints -

Applications access the planes through endpoints. The access controls for the two planes work independently.

To grant an application access to use keys in a key vault, you grant data plane access by using a Key Vault access policy.

To grant a user read access to Key Vault properties and tags, but not access to data (keys, secrets, or certificates), you grant management plane access with RBAC.

Access plane: Management Plane

Access endpoints: Global: management.azure.com:443

Operations: Create, read, update, and delete key vaults

		Set Key Vault access policies

		Set Key Vault tags
Access control mechanism:

		Azure Resource Manager RBAC
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Access plane: Data Plane

Access endpoints: Global: <vault-name>.vault.azure.net:443

Operations: Keys: decrypt, encrypt, unwrap, wrap, verify, sign, get, list, update, create, import, delete, backup, restore

		Secrets: get, list, set, delete
Access control mechanism:

		Key Vault access policy
Management plane and RBAC -

In the management plane, you use RBAC (Role Based Access Control) to authorize the operations a caller can execute. In the RBAC model, each Azure subscription has an instance of Azure AD.

You grant access to users, groups, and applications from this directory. Access is granted to manage resources in the Azure subscription that use the Azure Resource Manager deployment model. To grant access, use the Azure portal, the Azure CLI, Azure PowerShell, or the Azure Resource Manager REST APIs.

You create a key vault in a resource group and manage access by using Azure AD. You grant users or groups the ability to manage the key vaults in a resource group. You grant the access at a specific scope level by assigning appropriate RBAC roles.

To grant access to a user to manage key vaults, you assign a predefined key vault Contributor role to the user at a specific scope. The following scopes levels can be assigned to an RBAC role:

* Subscription: An RBAC role assigned at the subscription level applies to all
resource groups and resources within that subscription.

* Resource group: An RBAC role assigned at the resource group level applies to
all resources in that resource group.

* Specific resource: An RBAC role assigned for a specific resource applies to
that resource. In this case, the resource is a specific key vault.

There are several predefined roles. If a predefined role does not fit your needs, you can define your own role.

NOTE: If a user has Contributor permissions to a key vault management plane, the user can grant themselves access to the data plane by setting a Key Vault access policy.

Data plane and access policies -

You grant data plane access by setting Key Vault access policies for a key vault. To set these access policies, a user, group, or application must have Contributor permissions for the management plane for that key vault.

You grant a user, group, or application access to execute specific operations for keys or secrets in a key vault. Key Vault supports up to 1,024 access policy entries for a key vault. To grant data plane access to several users, create an Azure AD security group and add users to that group.

Key Vault access policies grant permissions separately to keys, secrets, and certificate. You can grant a user access only to keys and not to secrets. Access permissions for keys, secrets, and certificates are at the vault level.

Key Vault access policies do not support granular, object-level permissions like a specific key, secret, or certificate. To set access policies for a key vault, use the Azure portal, the Azure CLI, Azure PowerShell, or the Key Vault Management REST APIs.

NOTE: Key Vault access policies apply at the vault level. When a user is granted permission to create and delete keys, they can perform those operations on all keys in that key vault.

NOTE: You can restrict data plane access by using virtual network service endpoints for Azure Key Vault. You can configure firewalls and virtual network rules for an additional layer of security.

Virtual network service endpoints for Azure Key Vault:

The virtual network service endpoints for Azure Key Vault allow you to restrict access to a specified virtual network. The endpoints also allow you to restrict access to a list of IPv4 (internet protocol version 4) address ranges. Any user connecting to your key vault from outside those sources is denied access.

There is one important exception to this restriction. If a user has opted-in to allow trusted Microsoft services, connections from those services are let through the firewall. For example, these services include Office 365 Exchange Online, Office 365 SharePoint Online, Azure compute, Azure Resource Manager, and Azure Backup. Such users still need to present a valid Azure Active Directory token, and must have permissions (configured as access policies) to perform the requested operation.

Usage scenarios -

You can configure Key Vault firewalls and virtual networks to deny access to traffic from all networks (including internet traffic) by default. You can grant access to traffic from specific Azure virtual networks and public internet IP address ranges, allowing you to build a secure network boundary for your applications.

NOTE: Key Vault firewalls and virtual network rules only apply to the data plane of Key Vault. Key Vault control plane operations (such as create, delete, and modify operations, setting access policies, setting firewalls, and virtual network rules) are not affected by firewalls and virtual network rules.

Here are some examples of how you might use service endpoints:

* You are using Key Vault to store encryption keys, application secrets, and
certificates, and you want to block access to your key vault from the public internet.

* You want to lock down access to your key vault so that only your application,
or a short list of designated hosts, can connect to your key vault.

* You have an application running in your Azure virtual network, and this
virtual network is locked down for all inbound and outbound traffic. Your application still needs to connect to Key Vault to fetch secrets or certificates, or use cryptographic keys.

How to configure Key Vault firewalls and virtual networks -

Enable Key Vault logging to see detailed access logs. This helps in diagnostics, when firewalls and virtual network rules prevent access to a key vault. (This step is optional, but highly recommended.)

Enable service endpoints for key vault for target virtual networks and subnets.

Set firewalls and virtual network rules for a key vault to restrict access to that key vault from specific virtual networks, subnets, and IPv4 address ranges.

If this key vault needs to be accessible by any trusted Microsoft services, enable the option to allow Trusted Azure Services to connect to Key Vault.

NOTE: After firewall rules are in effect, users can only perform Key Vault data plane operations when their requests originate from allowed virtual networks or IPv4 address ranges. This also applies to accessing Key Vault from the Azure portal. Although users can browse to a key vault from the Azure portal, they might not be able to list keys, secrets, or certificates if their client machine is not in the allowed list. This also affects the Key Vault Picker by other Azure services. Users might be able to see list of key vaults, but not list keys, if firewall rules prevent their client machine.

NOTE: Be aware of the following configuration limitations:

A maximum of 127 virtual network rules and 127 IPv4 rules are allowed.

Small address ranges that use the "/31" or "/32" prefix sizes are not supported. Instead, configure these ranges by using individual IP address rules.

IP network rules are only allowed for public IP addresses. IP address ranges reserved for private networks (as defined in RFC 1918) are not allowed in IP rules. Private networks include addresses that start with 10., 172.16-31, and 192.168.

NOTE: Only IPv4 addresses are supported at this time.
#### 4.4.3.3 manage certificates
Key Vault Certificates - Key Vault certificates support provides for management of your x509 certificates and the following behaviors:

* Allows a certificate owner to create a certificate through a Key Vault
creation process or through the import of an existing certificate.

* Includes both self-signed and Certificate Authority generated certificates.

* Allows a Key Vault certificate owner to implement secure storage and
management of X509 certificates without interaction with private key material.

* Allows a certificate owner to create a policy that directs Key Vault to
manage the life-cycle of a certificate.

* Allows certificate owners to provide contact information for notification
about life-cycle events of expiration and renewal of certificate.

* Supports automatic renewal with selected issuers - Key Vault partner X509
certificate providers / certificate authorities.

Composition of a Certificate - When a Key Vault certificate is created, an addressable key and secret are also created with the same name. The Key Vault key allows key operations and the Key Vault secret allows retrieval of the certificate value as a secret. A Key Vault certificate also contains public x509 certificate metadata.

The identifier and version of certificates is similar to that of keys and secrets. A specific version of an addressable key and secret created with the Key Vault certificate version is available in the Key Vault certificate response.

Exportable or Non-exportable key - When a Key Vault certificate is created, it can be retrieved from the addressable secret with the private key in either PFX or PEM format. The policy used to create the certificate must indicate that the key is exportable. If the policy indicates non-exportable, then the private key is not a part of the value when retrieved as a secret.

The addressable key becomes more relevant with non-exportable KV certificates. The addressable KV key’s operations are mapped from keyusage field of the KV certificate policy used to create the KV Certificate.

Two types of key are supported – RSA or RSA HSM with certificates. Exportable is only allowed with RSA, not supported by RSA HSM.

Certificate policy - A certificate policy contains information on how to create and manage lifecycle of a Key Vault certificate. When a certificate with private key is imported into the key vault, a default policy is created by reading the x509 certificate.

When a Key Vault certificate is created from scratch, a policy needs to be supplied. The policy specifies how to create this Key Vault certificate version, or the next Key Vault certificate version. Once a policy has been established, it is not required with successive create operations for future versions. There's only one instance of a policy for all the versions of a Key Vault certificate.

At a high level, a certificate policy contains the following information:

* X509 certificate properties: Contains subject name, subject alternate names,
and other properties used to create an x509 certificate request.

* Key Properties: contains key type, key length, exportable, and reuse key
fields. These fields instruct key vault on how to generate a key.

* Secret properties: contains secret properties such as content type of
addressable secret to generate the secret value, for retrieving certificate as a secret.

* Lifetime Actions: contains lifetime actions for the KV Certificate. Each
lifetime action contains:

* Trigger: specified via days before expiry or lifetime span percentage

* Action: specifying action type – emailContacts or autoRenew

* Issuer: Parameters about the certificate issuer to use to issue x509
certificates.

* Policy Attributes: contains attributes associated with the policy
Certificate Access Control - Access control for certificates is managed by Key Vault, and is provided by the Key Vault that contains those certificates. The access control policy for certificates is distinct from the access control policies for keys and secrets in the same Key Vault. Users may create one or more vaults to hold certificates, to maintain scenario appropriate segmentation and management of certificates.

The following permissions can be used, on a per-principal basis, in the secrets access control entry on a key vault, and closely mirrors the operations allowed on a secret object:

Permissions for certificate management operations

* get: Get the current certificate version, or any version of a certificate
* list: List the current certificates, or versions of a certificate
* update: Update a certificate
* create: Create a Key Vault certificate
* import: Import certificate material into a Key Vault certificate
* delete: Delete a certificate, its policy, and all of its versions
* recover: Recover a deleted certificate
* backup: Back up a certificate in a key vault
* restore: Restore a backed-up certificate to a key vault
* managecontacts: Manage Key Vault certificate contacts
* manageissuers: Manage Key Vault certificate authorities/issuers
* getissuers: Get a certificate's authorities/issuers
* listissuers: List a certificate's authorities/issuers
* setissuers: Create or update a Key Vault certificate's authorities/issuers
* deleteissuers: Delete a Key Vault certificate's authorities/issuers
Permissions for privileged operations

* purge: Purge (permanently delete) a deleted certificate
#### 4.4.3.4 manage secrets
Azure Key Vault's soft delete feature allows recovery of deleted vaults and vault objects. Specifically, soft-delete addresses the following scenarios:

* Support for recoverable deletion of a key vault

* Support for recoverable deletion of key vault objects; keys, secrets, and,
certificates

How soft-delete protects your key vaults - A deleted key vault is removed from its resource group and placed in a reserved namespace, associated with the location where it was created.

Deleted objects such as keys, secrets, and certificates, are inaccessible as long as their containing key vault is in the deleted state.

The DNS name for a deleted key vault is reserved, preventing a new key vault with same name from being created.

What are the prerequisites ? -

* Azure PowerShell 1.0.0 or later
NOTE: There is an outdated version of the Key Vault PowerShell output formatting file that may be loaded into your environment instead of the correct version.

The current workaround, should you encounter this formatting problem, is:

Use the following query if you notice you are not seeing the soft-delete enabled property:

$vault = Get-AzKeyVault -VaultName myvault; $vault.EnableSoftDelete
What are the required permissions ? - Key Vault operations are separately managed via role-based access control (RBAC) permissions as follows:

List - Lists deleted key vaults

User Permission: Microsoft.KeyVault/deletedVaults/read


Recover	- Restores a deleted key vault

User Permission: Microsoft.KeyVault/vaults/write


Purge - Permanently removes a deleted key vault and all its contents

User Permissions: 		Microsoft.KeyVault/locations/deletedVaults/purge/action
How do I enable soft-delete ? - You enable "soft-delete" to allow recovery of a deleted key vault, or objects stored in a key vault.

NOTE: Enabling 'soft delete' on a key vault is an irreversible action. Once the soft-delete property has been set to "true", it cannot be changed or removed.

For an existing key vault named ITPTV-Vault, enable soft-delete as follows:

($resource = Get-AzResource -ResourceId (Get-AzKeyVault -VaultName "ITPTV-Vault").ResourceId).Properties | Add-Member -MemberType "NoteProperty" -Name "enableSoftDelete" -Value "true"

Set-AzResource -resourceid $resource.ResourceId -Properties $resource.Properties

Enabling soft-delete for a new key vault is done at creation time by adding the soft-delete enable flag to your create command:

New-AzKeyVault -Name "ITPTV-Vault" -ResourceGroupName "ITPTVRG" -Location "westus" -EnableSoftDelete

To verify that a key vault has soft-delete enabled, run the show command and look for the 'Soft Delete Enabled?' attribute:

Get-AzKeyVault -VaultName "ITPTV-Vault"

You may view deleted state key vaults, associated with your subscription, using the following command:

Get-AzKeyVault -InRemovedState


* ID can be used to identify the resource when recovering or purging.

* Resource ID is the original resource ID of this vault. Since this key vault
is now in a deleted state, no resource exists with that resource ID.

* Scheduled Purge Date is when the vault will be permanently deleted, if no
action is taken. The default retention period, used to calculate the Scheduled Purge Date, is 90 days.

How do I recover a key vault ? - To recover a key vault, you specify the key vault name, resource group, and location. Note the location and the resource group of the deleted key vault, as you need them for the recovery process.

Undo-AzKeyVaultRemoval -VaultName ITPTV-Vault -ResourceGroupName ITPTVRG -Location westus
NOTE: When a key vault is recovered, a new resource is created with the key vault's original resource ID. If the original resource group is removed, one must be created with same name before attempting recovery.

Deleting and purging key vault objects - The following command will delete the 'ITPTVFirstKey' key, in a key vault named 'ITPTV-Vault', which has soft-delete enabled:

Remove-AzKeyVaultKey -VaultName ITPTV-Vault -Name ITPTVFirstKey
With your key vault enabled for soft-delete, a deleted key still appears to be deleted, unless you explicitly list deleted keys. Most operations on a key in the deleted state will fail, except for listing, recovering, purging a deleted key.

For example, the following command lists deleted keys in the 'ITPTV-Vault' key vault:

Get-AzKeyVaultKey -VaultName ITPTV-Vault -InRemovedState
NOTE: Transition state - When you delete a key in a key vault with soft-delete enabled, it may take a few seconds for the transition to complete. During this transition, it may appear that the key is not in the active state or the deleted state.

Using soft-delete with key vault objects - Just like key vaults, a deleted key, secret, or certificate, remains in deleted state for up to 90 days, unless you recover it or purge it.

Keys - To recover a soft-deleted key:

Undo-AzKeyVaultKeyRemoval -VaultName ITPTV-Vault -Name ITPTVFirstKey
To permanently delete (also known as purging) a soft-deleted key:

Remove-AzKeyVaultKey -VaultName ITPTV-Vault -Name ITPTVFirstKey -InRemovedState
The recover and purge actions have their own permissions associated in a key vault access policy. For a user or service principal to be able to execute a recover or purge action, they must have the respective permission for that key or secret.

By default, purge is not added to a key vault's access policy, when the 'all' shortcut is used to grant all permissions. You must specifically grant purge permission.

Set a key vault access policy - The following command grants user@itpro.tv permission to use several operations on keys in ITPTV-Vault including purge:

Set-AzKeyVaultAccessPolicy -VaultName ITPTV-Vault -UserPrincipalName user@itpro.tv -PermissionsToKeys get,create,delete,list,update,import,backup,restore,recover,purge
Secrets - Like keys, secrets are managed with their own commands:

Delete a secret named ITPSQLPassword:

Remove-AzKeyVaultSecret -VaultName ITPTV-Vault -name ITPSQLPassword
List all deleted secrets in a key vault:

Get-AzKeyVaultSecret -VaultName ITPTV-Vault -InRemovedState
Recover a secret in the deleted state:

Undo-AzKeyVaultSecretRemoval -VaultName ITPTV-Vault -Name ITPSQLPassword
Purge a secret in deleted state:

Remove-AzKeyVaultSecret -VaultName ITPTV-Vault -InRemovedState -name ITPSQLPassword
Purging a soft-delete protected key vault:

The purge function is used to permanently delete a key vault object or an entire key vault, that was previously soft-deleted. As demonstrated in the previous section, objects stored in a key vault with the soft-delete feature enabled, can go through multiple states:

* Active: before deletion.

* Soft-Deleted: after deletion, able to be listed and recovered back to active
state.

* Permanently-Deleted: after purge, not able to be recovered.
The same is true for the key vault. In order to permanently delete a soft-deleted key vault and its contents, you must purge the key vault itself.

When a key vault is purged, its entire contents are permanently deleted, including keys, secrets, and certificates.

To purge a soft-deleted key vault, use the Remove-AzKeyVault command with the option -InRemovedState and by specifying the location of the deleted key vault with the -Location location argument. You can find the location of a deleted vault using the command Get-AzKeyVault -InRemovedState.

Remove-AzKeyVault -VaultName ITPTV-Vault -InRemovedState -Location westus
Purge permissions required:

To purge a deleted key vault, the user needs RBAC permission to the Microsoft.KeyVault/locations/deletedVaults/purge/action operation.

To list a deleted key vault, the user needs RBAC permission to the Microsoft.KeyVault/deletedVaults/read operation.

NOTE: By default only a subscription administrator has these permissions.

Scheduled purge:

Listing deleted key vault objects also shows when they are scheduled to be purged by Key Vault. Scheduled Purge Date indicates when a key vault object will be permanently deleted, if no action is taken. By default, the retention period for a deleted key vault object is 90 days.

Enabling Purge Protection - When purge protection is turned on, a vault or an object in deleted state cannot be purged until the retention period of 90 days has passed.

Such a vault or object can still be recovered. This feature gives added assurance that a vault or an object can never be permanently deleted until the retention period has passed.

NOTE: You can enable purge protection only if soft-delete is also enabled.

New-AzKeyVault -Name ITPTV-Vault -ResourceGroupName ITPTVRG -Loca
#### 4.4.3.5 configure key rotation
About keys, secrets, and certificates - Key Vault supports RSA and Elliptic Curve keys only.

* EC: "Soft" Elliptic Curve key
* EC-HSM: "Hard" Elliptic Curve key
* RSA: "Soft" RSA key
* RSA-HSM: "Hard" RSA key
Key Vault supports RSA keys of sizes 2048, 3072 and 4096. Key Vault supports Elliptic Curve key types P-256, P-384, P-521, and P-256K (SECP256K1).

Cryptographic protection - The cryptographic modules that Key Vault uses, whether HSM or software, are FIPS (Federal Information Processing Standards) validated. You don’t need to do anything special to run in FIPS mode. Keys created or imported as HSM-protected are processed inside an HSM, validated to FIPS 140-2 Level 2. Keys created or imported as software-protected, are processed inside cryptographic modules validated to FIPS 140-2 Level 1.

Key operations - Key Vault supports the following operations on key objects:

* Create: Allows a client to create a key in Key Vault. The value of the key
is generated by Key Vault and stored, and is not released to the client. Asymmetric keys may be created in Key Vault.

* Import: Allows a client to import an existing key to Key Vault. Asymmetric
keys may be imported to Key Vault using a number of different packaging methods within a JWK construct.

* Update: Allows a client with sufficient permissions to modify the metadata
(key attributes) associated with a key previously stored within Key Vault.

* Delete: Allows a client with sufficient permissions to delete a key from
Key Vault.

* List: Allows a client to list all keys in a given Key Vault.

* List versions: Allows a client to list all versions of a given key in a
given Key Vault.

* Get: Allows a client to retrieve the public parts of a given key in a Key
Vault.

* Backup: Exports a key in a protected form.

* Restore: Imports a previously backed up key.
Once a key has been created in Key Vault, the following cryptographic operations may be performed using the key:

* Sign and Verify: Strictly, this operation is "sign hash" or "verify hash", as
Key Vault does not support hashing of content as part of signature creation. Applications should hash the data to be signed locally, then request that Key Vault sign the hash.

* Key Encryption / Wrapping: A key stored in Key Vault may be used to protect
another key, typically a symmetric content encryption key (CEK). When the key in Key Vault is asymmetric, key encryption is used. When the key in Key Vault is symmetric, key wrapping is used. For best application performance, WRAPKEY operations should be performed locally.

* Encrypt and Decrypt: A key stored in Key Vault may be used to encrypt or
decrypt a single block of data. The size of the block is determined by the key type and selected encryption algorithm. For best application performance, encrypt operations should be performed locally.

> NOTE: Key Vault does not support EXPORT operations. Once a key is provisioned in the system, it cannot be extracted or its key material modified. However, users of Key Vault may require their key for other use cases, such as after it has been deleted. In this case, they may use the BACKUP and RESTORE operations to export/import the key in a protected form. Keys created by the BACKUP operation are not usable outside Key Vault. Alternatively, the IMPORT operation may be used against multiple Key Vault instances.
#### 4.4.3.6 backup and restore of Key Vault items
#### 4.4.3.7 configure Azure Defender for Key Vault