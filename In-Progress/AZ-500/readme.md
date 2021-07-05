# AZ-500 Study Sessions
## Table of Contents
1. Manage Azure Active Directory identities (30-35%)
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
2. Implement platform protection (15-20%)
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
3. Manage security operations (25-30%)
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
4. Secure data and applications (20-25%)
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

## 1. Manage identity and access (30-35%)

### 1.1 Manage Azure Active Directory identities

#### 1.1.1 configure security for service principles
An Azure Active Directory (Azure AD) service principal is the local representation of an application object in a single tenant or directory.‎It functions as the identity of the application instance. Service principals define who can access the application, and what resources the application can access. A service principal is created in each tenant where the application is used and references the globally unique application object. The tenant secures the service principal’s sign in and access to resources.

[Securing service principals](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/service-accounts-principal)

---

__**Definition List**__

[Application Object](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals#application-object)
: An Azure AD application is defined by its one and only application object, which resides in the Azure AD tenant where the application was registered (known as the application's "home" tenant). An application object is used as a template or blueprint to create one or more service principal objects. A service principal is created in every tenant where the application is used. Similar to a class in object-oriented programming, the application object has some static properties that are applied to all the created service principals (or application instances).

[Service principal object](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object)
: To access resources that are secured by an Azure AD tenant, the entity that requires access must be represented by a security principal. This requirement is true for both users (user principal) and applications (service principal). The security principal defines the access policy and permissions for the user/application in the Azure AD tenant. This enables core features such as authentication of the user/application during sign-in, and authorization during resource access. There are three types of service principal: Application, Managed identity, Legacy 

#### 1.1.2 manage Azure AD directory groups
Azure Active Directory (Azure AD) lets you use groups to manage access to your cloud-based apps, on-premises apps, and your resources. Your resources can be part of the Azure AD organization, such as permissions to manage objects through roles in Azure AD, or external to the organization, such as for Software as a Service (SaaS) apps, Azure services, SharePoint sites, and on-premises resources.

> Note: In the Azure portal, you can see some groups whose membership and group details you can't manage in the portal: Groups synced from on-premises Active Directory can be managed only in on-premises Active Directory. Other group types such as distribution lists and mail-enabled security groups are managed only in Exchange admin center or Microsoft 365 admin center. You must sign in to Exchange admin center or Microsoft 365 admin center to manage these groups.

[Manage app and resource access using Azure Active Directory groups](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups)

---
* two-stage deletion process
* export capability
* naming convention controls

* types of groups: security, distribution, Office365, on-prem

**can only manage on-prem ON-PREM**

Navigate to AAD > Manage > Groups
* In groups
    * Settings
        * General
            * Self Service Group Management - owners can manage membership request in the access panel
            * Security Groups
            * Office 365 Groups
            * Directory-wide Groups
        * Expiration
            * useful for business cycles or project driven needs to timebound a group
            * Group lifetime (in days)
            * Notification for expiration reminders hapen 30, 15, 1 day (email only)
            * if not renewed the group is deleted
        * Naming policy
            * Blocked words - .csv of banned words (profanity, internal anames) and upload the csv
            * Group naming policy - unique only to Office 365 groups
                * add prefix / add suffix
    * Bulk operation results
        * you can export all groups from the main group page
        * hosts the results where you can download in a csv
        * does not contain memberships
        * useful for auditing what groups exists / automation

#### 1.1.3 manage Azure AD users
Add new users or delete existing users from your Azure Active Directory (Azure AD) organization. To add or delete users you must be a User administrator or Global administrator.

[Add or delete users using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory)

---
- Roles and administrators
    - how you give and assign users roles and delegated rights

__**User v Guest User**__
- User = Known as members [Internal accounts]
    - Either AAD or Windows Server AD
- Guest Users = outside of the organization (contractors, end-users)
    - Invited User
    - Can be created or invited
        - creating a new user in the org will allow you to create and apply a domain (say you need it for multiple business units to give access to named directories). you can reset passwords
        - inviting a user creates the account as the invite is sent

#### 1.1.4 manage administrative units
It can be useful to restrict administrative scope by using administrative units in organizations that are made up of independent divisions of any kind. Consider the example of a large university that's made up of many autonomous schools (School of Business, School of Engineering, and so on). Each school has a team of IT admins who control access, manage users, and set policies for their school.

__**A central administrator could:**__
* Create a role with administrative permissions over only Azure AD users in the business school administrative unit.
* Create an administrative unit for the School of Business.
* Populate the administrative unit with only the business school students and staff.
* Add the business school IT team to the role, along with its scope.

[Administrative units in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/roles/administrative-units)

#### 1.1.5 configure password writeback
Password writeback can be used to synchronize password changes in Azure AD back to your on-premises AD DS environment. Azure AD Connect provides a secure mechanism to send these password changes back to an existing on-premises directory from Azure AD.

[Tutorial: Enable Azure Active Directory self-service password reset writeback to an on-premises environment](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr-writeback)

Azure Active Directory (Azure AD) self-service password reset (SSPR) lets users reset their passwords in the cloud, but most companies also have an on-premises Active Directory Domain Services (AD DS) environment where their users exist. Password writeback is a feature enabled with Azure AD Connect that allows password changes in the cloud to be written back to an existing on-premises directory in real time. In this configuration, as users change or reset their passwords using SSPR in the cloud, the updated passwords also written back to the on-premises AD DS environment

[How does self-service password reset writeback work in Azure Active Directory?](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-writeback)

#### 1.1.6 configure authentication methods including password hash and Pass Through Authentication(PTA), OAuth, and passwordless
Azure Active Directory (Azure AD) Pass-through Authentication allows your users to sign in to both on-premises and cloud-based applications using the same passwords. This feature provides your users a better experience - one less password to remember, and reduces IT helpdesk costs because your users are less likely to forget how to sign in. When users sign in using Azure AD, this feature validates users' passwords directly against your on-premises Active Directory.

[User sign-in with Azure Active Directory Pass-through Authentication](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta)

[Choose the right authentication method for your Azure Active Directory hybrid identity solution](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/choose-ad-authn)

---
__**Password hash synchronization**__ 
Requires the least effort regarding deployment, maintenance, and infrastructure. This level of effort typically applies to organizations that only need their users to sign in to Office 365, SaaS apps, and other Azure AD-based resources. When turned on, password hash synchronization is part of the Azure AD Connect sync process and runs every two minutes.
__**Federated authentication**__ 
Relies on an external trusted system to authenticate users. Some companies want to reuse their existing federated system investment with their Azure AD hybrid identity solution. The maintenance and management of the federated system falls outside the control of Azure AD. It's up to the organization by using the federated system to make sure it's deployed securely and can handle the authentication load.
__**Pass-through authentication**__
You need one or more (we recommend three) lightweight agents installed on existing servers. These agents must have access to your on-premises Active Directory Domain Services, including your on-premises AD domain controllers. They need outbound access to the Internet and access to your domain controllers. For this reason, it's not supported to deploy the agents in a perimeter network.
Pass-through Authentication requires unconstrained network access to domain controllers. All network traffic is encrypted and limited to authentication requests.

---

* Do you want Azure AD to handle Sign-in COMPLETELY in the cloud?

* Hash sychronize is a big factor in between on-prem / cloud envirnements because both environments need to sychronize for changes

* You can add multiple authentication methods

* Seamless SSO = allows users to us the same credentials to access other Azure resources

* Pass-through = No integrated federation, no 

#### 1.1.7 transfer Azure subscriptions between Azure AD tenants
When you transfer a subscription to a different Azure AD directory, some resources are not transferred to the target directory. For example, all role assignments and custom roles in Azure role-based access control (Azure RBAC) are permanently deleted from the source directory and are not be transferred to the target directory.

[Transfer an Azure subscription to a different Azure AD directory](https://docs.microsoft.com/en-us/azure/role-based-access-control/transfer-subscription#:~:text=To%20transfer%20the%20subscription%20to%20a%20different%20directory%2C,as%20the%20user%20that%20accepted%20the%20transfer%20request.)

### 1.2 Configure secure access by using Azure AD

#### 1.2.1 monitor privileged access for Azure AD Privleged Identity Management (PIM)
In Privileged Identity Management (PIM), you can now assign eligibility for membership or ownership of privileged access groups. Starting with this preview, you can assign Azure Active Directory (Azure AD) built-in roles to cloud groups and use PIM to manage group member and owner eligibility and activation.

> Important: To assign a privileged access group to a role for administrative access to Exchange, Security and Compliance center, or SharePoint, use the Azure AD portal Roles and Administrators experience and not in the Privileged Access Groups experience to make the user or group eligible for activation into the group.

[What is Azure AD Privileged Identity Management?](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure)

---
Search Azure AD Priveleged Identity Managment (launches the blade)

PIM allos JIT (just in time) management. To give a fixed amount of time (ex. a business day) Time bounding use of time

RBAC

security admin
priveleged administrator role

****
* Tasks
    * My roles
    * My requests
    * Approve Requests
    * Review access
* Manage 
    * Azure AD roles
        * *Sign up = create/assins necessary roles and signs them up to the user initializing*
        *
    * Azure resources
        * where you can manage resouces outside of AD
* Activity
    * My audit history-

- Licensing
    - Premium P2, E5 (ERM brings P2)
    - roles every administrator other than global admins needs a license for PIM
    - users managed by PIM need it, approvers need it, and reviewers need it
    - Users assigned as eligible to Azure AD roles managed using PIM
    - Users able to approve or reject activation requests in PIM
    - Users assigned to an Azure resource role with just-in-time or direct

The top 10 Azure AD roles managed by Privileged Identity Management are:

1. Global administrator
2. Security administrator
3. User administrator
4. Exchange administrator
5. SharePoint administrator
6. Intune administrator
7. Security reader
8. Service administrator
9. Billing administrator
10. Skype for Business administrator


PIM emails for Azure resource roles - Privileged Identity Management sends emails to Owners and User Access Administrators when the following events occur for Azure resource roles:

* When a role assignment is pending approval
* When a role is assigned
* When a role is soon to expire
* When a role is eligible to extend
* When a role is being renewed by an end user
* When a role activation request is completed

Privileged Identity Management sends emails to end users when the following events occur for Azure resource roles:

* When a role is assigned to the user
* When a user's role is expired
* When a user's role is extended
* When a user's role activation request is completed

#### 1.2.2 configure Access Reviews
To reduce the risk associated with stale role assignments, you should regularly review access. You can use Azure AD Privileged Identity Management (PIM) to create access reviews for privileged Azure AD roles. You can also configure recurring access reviews that occur automatically.

[Create an access review of Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-start-security-review)

The need for access to privileged Azure resource roles by employees changes over time. To reduce the risk associated with stale role assignments, you should regularly review access. You can use Azure Active Directory (Azure AD) Privileged Identity Management (PIM) to create access reviews for privileged access to Azure resource roles. You can also configure recurring access reviews that occur automatically.

> Note: Currently, you can scope an access review to service principals with access to Azure AD and Azure resource roles (Preview) with an Azure Active Directory Premium P2 edition active in your tenant. The licensing model for service principals will be finalized for general availability of this feature and additional licenses may be required.

[Create an access review of Azure resource roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-start-access-review)

---
__**Sychronization Rules Editor**__
Use the Synchronization Rules Editor and write attribute-based filtering rule. Minimum administrative effort.
__**Helpful Links**__
* https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-change-the-configuration

***
* Prerequistes
    * Azure AD Premium P2
    * Global admin or User admin

Navigate to Azure AD > Identity Governance
* Access reviews
    * Access reviews
        * Create an access review
            * Review name*
            * Description
            * Start date*
            * Frequency
            * End [Never, End by, Occurances]
            * Users
            * Scope - *You would need to create two if you wanted to audit both groups*
                * Guests
                * Everyone (does not include Guests)

Reviews are hosted at myaccess.microsoft.com

#### 1.2.3 configure PIM
To use Privileged Identity Management, your directory must have one of the following paid or trial licenses. 
* Azure AD Premium P2
* Enterprise Mobility + Security (EMS) E5
* Microsoft 365 Education A5
* Microsoft 365 Enterprise E5

__**How PIM works**__
1. Start using Privileged Identity Management so that users are eligible for privileged roles.
2. When an eligible user needs to use their privileged role, they activate the role using Privileged Identity Management.
3. The user can be required in settings to:
* Use multi-factor authentication
* Request approval for activation
* Provide a business reason for activation
4. After the user successfully activates their role, they'll have the role permissions for a set duration.
5. Administrators can view a history of all Privileged Identity Management activities in the audit log. They can also further secure their Azure AD organizations and meet compliance using Privileged Identity Management features such as access reviews and alerts.

[Deploy Azure AD Privileged Identity Management (PIM)](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-deployment-plan)

#### 1.2.4 implement Conditional Access policies including Multi-Factor Authentication (MFA)

__**Create a Conditional Access policy**__
The following steps will help create a Conditional Access policy to require All users to perform multi-factor authentication.
1. Sign in to the Azure portal as a global administrator, security administrator, or Conditional Access administrator.
2. Browse to Azure Active Directory > Security > Conditional Access.
3. Select New policy.
4. Give your policy a name. We recommend that organizations create a meaningful standard for the names of their policies.
5. Under Assignments, select Users and groups
    * Under Include, select All users
    * Under Exclude, select Users and groups and choose your organization's emergency access or break-glass accounts.
    * Select Done.
6. Under Cloud apps or actions > Include, select All cloud apps.
    * Under Exclude, select any applications that do not require multi-factor authentication.
7. Under Conditions > Client apps (Preview), under Select the client apps this policy will apply to leave all defaults selected and select Done.
8. Under Access controls > Grant, select Grant access, Require multi-factor authentication, and select Select.
9. Confirm your settings and set Enable policy to On.
10. Select Create to create to enable your policy.

[Conditional Access: Require MFA for all users](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/howto-conditional-access-policy-all-users-mfa)

---
* Conditional access
    * signals - users, endpoint type OS 
    * decisions - what you grant to the user

* AAD
    * Security > Conditional Access | Policies
        * Policy types: 
            * Baseline - msft defaults
            * Standard - admin created and modified
            * Classic - legacy policies

While creating policies the default is to Report-only to see how policies would be applied.

__**Event Risk Levels**__
|Sing-in Activity | Risk Level|
|:--- | ---:|
|Users with leaked credentials|High|
|Sign-ins from anonymous IP addresses|Medium|
|Impossible travel to atypical locations|Medium|
|Sign-ins from infected devices|Medium|
|Sign-ins from unfamiliar locations|Medium|
|Sign-ins from IP addresses with suspicious activity|Low|

__**Include users**__
This list of users typically includes all of the users an organization is targeting in a Conditional Access policy.
__**Exclude users**__
When organizations both include and exclude a user or group the user or group is excluded from the policy, as an exclude action overrides an include in policy.
__**Helpful Links**__
* https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-users-groups#exclude-users

#### 1.2.5 configure Azure AD identity protection
Azure Active Directory Identity Protection includes three default policies that administrators can choose to enable. These policies include limited customization but are applicable to most organizations. All of the policies allow for excluding users such as your emergency access or break-glass administrator accounts.
* Azure AD MFA registration policy
    * Identity Protection can help organizations roll out Azure AD Multi-Factor Authentication (MFA) using a Conditional Access policy requiring registration at sign-in.
* Sign-in risk policy
    * Identity Protection analyzes signals from each sign-in, both real-time and offline, and calculates a risk score based on the probability that the sign-in wasn't performed by the user. Administrators can make a decision based on this risk score signal to enforce organizational requirements
* Custom Conditional Access policy
    * Administrators can also choose to create a custom Conditional Access policy including sign-in risk as an assignment condition. 

[Identity Protection policies](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-policies)

---
In Azure AD - Premium P2 > Security > Identity Protection

* Overview
    * Scorecard data
        * Contains 90 days of historical data
    * New Risky sign-ins
        * Relation to baseline/standard policies

* Protect | Sign-in risk policy
    * Assign Users
    * Conditions
        * risk level
    * Controls
        * Block, allow
        * Require MFA
    * Enforce the Policy or not for users

* Leaked credentials - if your credentials show up on an online db [dark web id?]

* Notify | 
    * add additional users

*Global Admin isn't the only account that has access to this tab. Global reader, security reader and others are able to view Identity Protection(good fit for cso)*

### 1.3 Manage application access

#### 1.3.1 create App Registration
Registering your application establishes a trust relationship between your app and the Microsoft identity platform. The trust is unidirectional: your app trusts the Microsoft identity platform, and not the other way around.

[Quickstart: Register an application with the Microsoft identity platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#:~:text=Create%20App%20Registration%20Azure%201%20Sign%20in%20to,Users%20of%20your%20app%20might%20see...%20See%20More.)
---
App registration (AAD Premium P2, Global Admin):
- this application can bu authorized an used by users
- any user who is a member of the AD can register an app(not a guest user)
 - an equivalent of adding a workstation to a domain

* AAD - contains a unique tenant ID
1. Navigate the left pane to App registration
2. New Registration
    * Name
    * Single tenant = default [Any Azure AD - Multitenant/ + personal Microsoft]
    * Redirect URI (optional)
        * Web = default (used for most authentication scenarios. mandates https)
3. Register

* ISV: independent software vendor

#### 1.3.2 configure App Registration permission scopes
By specifying a web API's scopes in your client app's registration, the client app can obtain an access token containing those scopes from the Microsoft identity platform. Within its code, the web API can then provide permission-based access to its resources based on the scopes found in the access token.

[Quickstart: Configure a client application to access a web API](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-configure-app-access-web-apis)
---
__**Terms**__
* scoping
* delegated permisstions = app interacts with a signed in user and binds proper constraints
* OAuth 2.0 = permissions are called scope

- In the left pane for Authentication it allows you to manage URI's for redirects

API permissions = Configured permissions

Microsoft Graph is the default microsoft provided permission to 'Sign in and read user profile', can be removed but shouldn't.

Adding an API permission
Options: Microsoft APIs, 
Supported legacy apps are on the bottom

Types of permissions: Delegated permissions (The application assumes the persona of the user to behave on behalf of the user) / Application permissions (no signed in users needed)

#### 1.3.3 manage App Registration permission consent
Applications that integrate with the Microsoft identity platform follow an authorization model that gives users and administrators control over how data can be accessed. The implementation of the authorization model has been updated on the Microsoft identity platform. It changes how an app must interact with the Microsoft identity platform.

[Permissions and consent in the Microsoft identity platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent)
---
proves right person to right level of access. 

Grants consent on behalf of the users in the AADD

**Tip:** https://myapps.microsoft.com

#### 1.3.4 manage API access to Azure subscriptions and resources
When you publish APIs through API Management, it's easy and common to secure access to those APIs by using subscription keys. Developers who need to consume the published APIs must include a valid subscription key in HTTP requests when they make calls to those APIs. Otherwise, the calls are rejected immediately by the API Management gateway. They aren't forwarded to the back-end services.

To get a subscription key for accessing APIs, a subscription is required. A subscription is essentially a named container for a pair of subscription keys. Developers who need to consume the published APIs can get subscriptions. And they don't need approval from API publishers. API publishers can also create subscriptions directly for API consumers.

> Tip: API Management also supports other mechanisms for securing access to APIs, including the following examples:
> * OAuth2.0
> * Client certificates
> * Restrict caller IPs

__**Scope of subscriptions**__
Subscriptions can be associated with various scopes: product, all APIs, or an individual API.

[Subscriptions in Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-subscriptions)

### 1.4 Manage access control

#### 1.4.1 configure subscription and resource permissions
To manage access to Azure resources, you must have the appropriate administrator role. Azure has an authorization system called Azure role-based access control (Azure RBAC) with several built-in roles you can choose from. You can assign these roles at different scopes, such as management group, subscription, or resource group. By default, the person who creates a new Azure subscription can assign other users administrative access to a subscription.

This article describes how add or change the administrator role for a user using Azure RBAC at the subscription scope.

Microsoft recommends that you manage access to resources using Azure RBAC. However, if you are still using the classic deployment model and managing the classic resources by using Azure Service Management PowerShell Module, you'll need to use a classic administrator.

[Add or change Azure subscription administrators](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/add-change-subscription-administrator)

*unsure*

#### 1.4.2 configure resource group permissions
A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

The resource group stores metadata about the resources. Therefore, when you specify a location for the resource group, you are specifying where that metadata is stored. For compliance reasons, you may need to ensure that your data is stored in a particular region.

[Manage Azure Resource Manager resource groups by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

#### 1.4.3 configure custom RBAC roles
If the Azure built-in roles don't meet the specific needs of your organization, you can create your own custom roles. Just like built-in roles, you can assign custom roles to users, groups, and service principals at management group (in preview only), subscription, and resource group scopes.

Custom roles can be shared between subscriptions that trust the same Azure AD directory. There is a limit of 5,000 custom roles per directory. (For Azure Germany and Azure China 21Vianet, the limit is 2,000 custom roles.) Custom roles can be created using the Azure portal, Azure PowerShell, Azure CLI, or the REST API.

[Azure custom roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles)

#### 1.4.4 identify the appropriate role
Azure role-based access control (Azure RBAC) is the authorization system you use to manage access to Azure resources. To grant access, you assign roles to users, groups, service principals, or managed identities at a particular scope.

__**1. Determine who needs access**__
You first need to determine who needs access. You can assign a role to a user, group, service principal, or managed identity. This is also called a security principal.
* **User** - An individual who has a profile in Azure Active Directory. You can also assign roles to users in other tenants. For information about users in other organizations, see Azure Active Directory B2B.
* **Group** - A set of users created in Azure Active Directory. When you assign a role to a group, all users within that group have that role.
* **Service principal** - A security identity used by applications or services to access specific Azure resources. You can think of it as a user identity (username and password or certificate) for an application.
* **Managed identity** - An identity in Azure Active Directory that is automatically managed by Azure. You typically use managed identities when developing cloud applications to manage the credentials for authenticating to Azure services.
__**2. Select the appropriate role**__
Permissions are grouped together into a role definition. It's typically just called a role. You can select from a list of several built-in roles. If the built-in roles don't meet the specific needs of your organization, you can create your own custom roles.

The following lists four fundamental built-in roles. The first three apply to all resource types.
* Owner - Has full access to all resources including the right to delegate access to others.
* Contributor - Can create and manage all types of Azure resources but can't grant access to others.
* Reader - Can view existing Azure resources.
* User Access Administrator - Lets you manage user access to Azure resources.
__**3. Identify the needed scope**__
Scope is the set of resources that the access applies to. In Azure, you can specify a scope at four levels: management group, subscription, resource group, and resource. Scopes are structured in a parent-child relationship. Each level of hierarchy makes the scope more specific. You can assign roles at any of these levels of scope. The level you select determines how widely the role is applied. Lower levels inherit role permissions from higher levels.

When you assign a role at a parent scope, those permissions are inherited to the child scopes. For example:

* If you assign the **Reader role** to a user at the management group scope, that user can read everything in all subscriptions in the management group.
* If you assign the **Billing Reader role** to a group at the subscription scope, the members of that group can read billing data for every resource group and resource in the subscription.
* If you assign the **Contributor role** to an application at the resource group scope, it can manage resources of all types in that resource group, but not other resource groups in the subscription.
__**4. Check your prerequisites
To assign roles, you must be signed in with a user that is assigned a role that has role assignments write permission, such as Owner or User Access Administrator at the scope you are trying to assign the role. Similarly, to remove a role assignment, you must have the role assignments delete permission.

Microsoft.Authorization/roleAssignments/write
Microsoft.Authorization/roleAssignments/delete
If your user account doesn't have permission to assign a role within your subscription, you see an error message that your account "does not have authorization to perform action

[Steps to assign an Azure role](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-steps)

##### 1.4.4.1 apply principle of least privilege
Only grant the access users need
Using Azure RBAC, you can segregate duties within your team and grant only the amount of access to users that they need to perform their jobs. Instead of giving everybody unrestricted permissions in your Azure subscription or resources, you can allow only certain actions at a particular scope.

When planning your access control strategy, it's a best practice to grant users the least privilege to get their work done. Avoid assigning broader roles at broader scopes even if it initially seems more convenient to do so. When creating custom roles, only include the permissions users need. By limiting roles and scopes, you limit what resources are at risk if the security principal is ever compromised.

[Best practices for Azure RBAC](https://docs.microsoft.com/en-us/azure/role-based-access-control/best-practices)

#### 1.4.5 interpret permissions

[Azure Policy Regulatory Compliance controls for Azure RBAC](https://docs.microsoft.com/en-us/azure/role-based-access-control/security-controls-policy)

##### 1.4.5.1 check access
Sometimes you need to check what access a user has to a set of Azure resources. You check their access by listing their assignments. A quick way to check the access for a single user is to use the Check access feature on the Access control (IAM) page.

__**Step 1: Open the Azure resources**__

To check the access for a user, you first need to open the Azure resources you want to check access for. Azure resources are organized into levels that are typically called the scope. In Azure, you can specify a scope at four levels from broad to narrow: management group, subscription, resource group, and resource.

__**Step 2: Check access for user**__

You can see the access for the selected security principal at this scope and inherited to this scope. Assignments at child scopes are not listed. You see the following assignments:
* Role assignments added with Azure RBAC.
* Deny assignments added using Azure Blueprints or Azure managed apps.
* Classic Service Administrator or Co-Administrator assignments for classic deployments.

__**Step 3: Check your access**__

An assignments pane appears that lists your access at this scope and inherited to this scope. Assignments at child scopes are not listed.

[Quickstart: Check access for a user to Azure resources](https://docs.microsoft.com/en-us/azure/role-based-access-control/check-access)

## 2 Implement platform protection (15-20%)

### 2.1 Implement advanced network security

#### 2.1.1 secure the connectivity of virtual networks (VPN authentication, Express Route encryption)
**NOTE:** connect HDInsight to your on-premises network by using Azure Virtual Networks and a VPN gateway.
- To allow HDInsight and resources in the joined network to communicate by name, you must perform the following actions:
    - Create Azure Virtual Network.
    - Create a custom DNS server in the Azure Virtual Network.
    - Configure the virtual network to use the custom DNS server instead of the default Azure Recursive Resolver.
    - Configure forwarding between the custom DNS server and your on-premises DNS server.

Secure the connectivity of virtual networks connectivity

VPN Gateway design: https://docs.microsoft.com/en-us/azure/vpn-gateway/design

About cryptographic requirements and Azure VPN gateways: https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-compliance-crypto

About Point-to-Site VPN: https://docs.microsoft.com/en-us/azure/vpn-gateway/point-to-site-about

__**Helpful Links**__
https://docs.microsoft.com/en-us/azure/hdinsight/connect-on-premises-network

#### 2.1.2 configure Network Security Groups (NSGs) and Application Security Groups (ASGs)
* Network Security Groups (NSG) - uses security rules [similar to access control lists], manages stateful traffic/stateful filtering
    * managed rules for connections to the vnet
    * NSGs manage:
        * protocol - tcp, udp, icmp or any
        * direction - inbound or outbound
        * port range
        * action - allow or deny

* 5-tuple information (source, source port, destination, destination port, and protocol) to allow or deny the traffic.

1. create a vnet
2. create ASG
3. create NSG
4. associate network sec group to subnet
5. create sec rule
6. create vms
7. associate network interfaces to asg

* Defualts
    * AllowVnetInBound
    * AllowAllowLoadBalancer
    * DenyAllInBound

#### 2.1.3 create and configure Azure Firewall
* Firewall solution (Firewall as a Service)
* Scalable solution

* tied into log analytics, has it's own public IP, integrate with SEIM (sec incident and management)

Azure Firewall is a managed, cloud-based network security service that protects your Azure Virtual Network resources. It is a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability.

You can centrally create, enforce, and log application and network connectivity policies across subscriptions and virtual networks. Azure Firewall uses a static public IP address for your virtual network resources allowing outside firewalls to identify traffic originating from your virtual network. The service is fully integrated with Azure Monitor for logging and analytics.

* Stadard SKU Public IP and Static only

* Forced Tunneling : 

* Threat intelligence - off, alert only, alert and deny

* Rules - NAT Rule collection | Network rule collection | Application rule collection
#### 2.1.4 implement Azure Firewall Manager
The *resource firewall* allows us to restrict access to an Azure service that supports the resource firewall feature. Azure storage accounts are one area where that is supported, as are Azure SQL Server and databases as well as Azure SQL Data Warehouse. In fact for Azure SQL, you can actually configure firewall rules at both the server level and the database level. You can use PowerShell, Azure CLI and the Azure Portal.

The *Azure storage firewall* provides access control for the public endpoint of your storage account. You can also use the firewall to block all access through the public endpoint when using private endpoints. Your storage firewall configuration also enables select trusted Azure platform services to access the storage account securely.

An application that accesses a storage account when network rules are in effect still requires proper authorization for the request. Authorization is supported with Azure Active Directory (Azure AD) credentials for blobs and queues, with a valid account access key, or with a SAS token.

* Object bound instances - specify vnet, subnet, address range, endpoint status, rg. You specify stateful connections in and out.

#### 2.1.5 configure Azure Front Door service as an Application Gateway
Azure Front Door Service enables you to define, manage, and monitor the global routing for your web traffic by optimizing for best performance and instant global failover for high availability.

Front Door works at **Layer 7** or HTTP/HTTPS layer and uses anycast protocol with split TCP and Microsoft's global network for improving global connectivity. So, per your routing method selection in the configuration, you can ensure that Front Door is routing your client requests to the fastest and most available application backend.

An application backend is any Internet-facing service hosted inside or outside of Azure.

* HA for web apps

__**Features of Front Door**__

* accelerate application performance
* increase application availibility with smart health probes
* url-based routing
* multi-site hosting
* session affinity
* ssl termination
* custom domains and cert management
* application layer security
* url redirection
* url rewrite
* protocol support

__**Setting up front door**__

* <hostname>.azurefd.net

* Setting up a frontend
    * Session Affinity, Web Application Firewall - disabled by default
* Setting up the backend pools
    * backed unique web app names **azurewebsites.net**
* A routing rule maps your frontend host to the backend pool. The rule forwards a request for contoso-frontend.azurefd.net to myBackendPool.

#### 2.1.6 configure a Web Application Firewall (WAF) on Azure Application Gateway
Web Application Firewall (WAF) provides centralized protection of your web applications from common exploits and vulnerabilities.

A WAF solution can react to a security threat faster by centrally patching a known vulnerability, instead of securing each individual web application.

WAF can be deployed with Azure Application Gateway, Azure Front Door, and Azure Content Delivery Network (CDN) service from Microsoft.

WAF on Application Gateway is based on Core Rule Set (CRS) 3.1, 3.0, or 2.2.9 from the Open Web Application Security Project (OWASP). The WAF automatically updates to include protection against new vulnerabilities, with no additional configuration needed.

All of the WAF features exist inside of a WAF Policy. You can create multiple policies, and they can be associated with an Application Gateway, to individual listeners, or to path-based routing rules on an Application Gateway.

Application Gateway operates as an application delivery controller (ADC). It offers Transport Layer Security (TLS), previously known as Secure Sockets Layer (SSL), termination, cookie-based session affinity, round-robin load distribution, content-based routing, ability to host multiple websites, and security enhancements.

Associating a WAF policy with listeners allows for multiple sites behind a single WAF to be protected by different policies. For example, if there are five sites behind your WAF, you can have five separate WAF policies (one for each listener) to customize the exclusions, custom rules, and managed rulesets for one site without effecting the other four.

If you want a single policy to apply to all sites, you can just associate the policy with the Application Gateway, rather than the individual listeners, to make it apply globally. Policies can also be applied to a path-based routing rule.

You can make as many policies as you want. Once you create a policy, it must be associated to an Application Gateway to go into effect, but it can be associated with any combination of Application Gateways and listeners.

If your Application Gateway has a policy applied, and then you apply a different policy to a listener on that Application Gateway, the listener's policy will take effect, but just for the listener(s) that they are assigned to. The Application Gateway policy still applies to all other listeners that do not have a specific policy assigned to them.

#### 2.1.7 configure Azure Bastion
The Azure Bastion service is a new fully platform-managed PaaS service that you provision inside your virtual network. It provides secure and seamless RDP/SSH connectivity to your virtual machines directly in the Azure portal over TLS. When you connect via Azure Bastion, your virtual machines do not need a public IP address.

Bastion provides secure RDP and SSH connectivity to all of the VMs in the virtual network in which it is provisioned. Using Azure Bastion protects your virtual machines from exposing RDP/SSH ports to the outside world, while still providing secure access using RDP/SSH. With Azure Bastion, you connect to the virtual machine directly from the Azure portal. You do not need an additional client, agent, or piece of software.

What is the architecture of Azure Bastion? -

Azure Bastion deployment is per virtual network, not per subscription/account or virtual machine. Once you provision an Azure Bastion service in your virtual network, the RDP/SSH experience is available to all your VMs in the same virtual network.

How do I create a bastion host? -

On the Azure portal menu or from the Home page, select Create a resource.

On the New page, in the Search the Marketplace field, type Bastion, then click Enter to get to the search results.

From the results, click Bastion. Make sure the publisher is Microsoft and the category is Networking.

On the Bastion page, click Create to open the Create a bastion page.

On the Create a bastion page, configure a new Bastion resource. Specify the configuration settings for your Bastion resource as indicated below:

* Subscription: The Azure subscription you want to use to create a new Bastion resource.

* Resource Group: The Azure resource group in which the new Bastion resource will be created in. If you do not have an existing resource group, you can create a new one.

* Name: The name of the new Bastion resource.

* Region: The Azure public region that the resource will be created in.

* Virtual network: The virtual network in which the Bastion resource will be created in. You can create a new virtual network in the portal during this process, or use an existing virtual network. If you are using an existing virtual network, make sure the existing virtual network has enough free address space to accommodate the Bastion subnet requirements.

* Subnet: The subnet in your virtual network where the new Bastion host will be deployed. The subnet will be dedicated to the Bastion host and must be named as AzureBastionSubnet. This subnet must be at least /27 or larger.

NOTE: AzureBastionSubnet does not support User Defined Routes, but does support Network Security Groups.

* Public IP address: The public IP of the Bastion resource on which RDP/SSH
will be accessed (over port 443). Create a new public IP, or use an existing one. The public IP address must be in the same region as the Bastion resource you are creating.

* Public IP address name: The name of the public IP address resource.

* Public IP address SKU: This setting is prepopulated by default to Standard.
Azure Bastion uses/supports only the Standard Public IP SKU.

* Assignment: This setting is prepopulated by default to Static.
When you have finished specifying the settings, click Review + Create. This validates the values. Once validation passes, you can begin the creation process.

On the Create a bastion page, click Create.

You will see a message letting you know that your deployment is underway. Status will display on this page as the resources are created. It takes about 5 minutes for the Bastion resource to be created and deployed.

#### 2.1.8 configure a firewall on a storage account, Azure SQL, KeyVault, or App Service
Azure App Service is a platform-as-a-service (PaaS) offering that lets you create web and mobile apps for any platform or device and connect to data anywhere, in the cloud or on-premises.

App Service includes the web and mobile capabilities that were previously delivered separately as Azure Websites and Azure Mobile Services.

It also includes new capabilities for automating business processes and hosting cloud APIs. As a single integrated service, App Service brings a rich set of capabilities to web, mobile, and integration scenarios.

What are the best practices that I should use to configure Azure services to protect web apps? -

Authenticate through Azure Active Directory (AD) -

App Service provides an OAuth 2.0 service for your identity provider. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, and mobile phones. Azure AD uses OAuth 2.0 to enable you to authorize access to mobile and web applications.

Restrict access based on role -

Restricting access is imperative for organizations that want to enforce security policies for data access. You can use role-based access control (RBAC) to assign permissions to users, groups, and applications at a certain scope, such as the need to know and least privilege security principles.

Protect your keys -

With Key Vault, you can encrypt keys and secrets (such as authentication keys, storage account keys, data encryption keys, .PFX files, and passwords) by using keys that are protected by hardware security modules (HSMs). For added assurance, you can import or generate keys in HSMs. You can also use Key Vault to manage your TLS certificates with auto-renewal.

Restrict incoming source IP addresses -

App Service Environments has a virtual network integration feature that helps you restrict incoming source IP addresses through network security groups (NSGs).

If you are unfamiliar with Azure Virtual Networks (VNETs), this is a capability that allows you to place many of your Azure resources in a non-internet, routable network that you control access to.

For App Service on Windows, you can also restrict IP addresses dynamically by configuring the web.config.

#### 2.1.9 implement Service Endpoints
Virtual Network (VNet) service endpoint provides secure and direct connectivity to Azure services over an optimized route over the Azure backbone network.

Endpoints allow you to secure your critical Azure service resources to only your virtual networks. Service Endpoints enables private IP addresses in the VNet to reach the endpoint of an Azure service without needing a public IP address on the VNet.

By default, Azure service resources secured to virtual networks are not reachable from on-premises networks. If you want to allow traffic from on-premises, you must also allow public (typically, NAT) IP addresses from your on-premises or ExpressRoute. You can add these IP addresses through the IP firewall configuration for Azure service resources.

If you are using ExpressRoute for public peering or Microsoft peering from your premises, you will need to identify the NAT IP addresses that you are using.

For public peering, each ExpressRoute circuit uses two NAT IP addresses, by default, applied to Azure service traffic when the traffic enters the Microsoft Azure network backbone.

For Microsoft peering, the NAT IP addresses are either customer provided or provided by the service provider.

To allow access to your service resources, you must allow these public IP addresses in the resource IP firewall setting.

NOTE: To find your public peering ExpressRoute circuit IP addresses, open a support ticket with ExpressRoute via the Azure portal.

What are the configuration issues I should be aware of? -

* Configure service endpoints on a subnet in a virtual network.
* Endpoints work with any type of compute instances running within that subnet.

* You can configure multiple service endpoints for all supported Azure
services (Azure Storage or Azure SQL Database, for example) on a subnet.

* For Azure SQL Database, virtual networks must be in the same region as the
Azure service resource. If using GRS and RA-GRS Azure Storage accounts, the primary account must be in the same region as the virtual network. For all other services, you can secure Azure service resources to virtual networks in any region.

* The virtual network where the endpoint is configured can be in the same or
different subscription than the Azure service resource.

* For supported services, you can secure new or existing resources to virtual
networks using service endpoints.

* After enabling a service endpoint, the source IP addresses of virtual
machines in the subnet switch. The source IP addresses switch from using public IPv4 addresses to using their private IPv4 address when communicating with the service from that subnet. Any existing open TCP connections to the service are closed during this switch. Ensure that no critical tasks are running when enabling or disabling a service endpoint to a service for a subnet.

* Network security groups (NSGs) with service endpoints:
If you want to deny all outbound internet traffic and allow only traffic to specific Azure services, you can do so using service tags in your NSGs; You can specify supported Azure services as destination in your NSG rules.

What are some scenarios that would require the deployment of Azure Service Endpoints? -

* Peered, connected, or multiple virtual networks: To secure Azure services to
multiple subnets within a virtual network or across multiple virtual networks, you can enable service endpoints on each of the subnets independently, and secure Azure service resources to all of the subnets.

* Filtering outbound traffic from a virtual network to Azure services: If you
want to inspect or filter the traffic sent to an Azure service from a virtual network, you can deploy a network virtual appliance within the virtual network. You can then apply service endpoints to the subnet where the network virtual appliance is deployed, and secure Azure service resources only to this subnet. This scenario might be helpful if you want use network virtual appliance filtering to restrict Azure service access from your virtual network only to specific Azure resources.

* Securing Azure resources to services deployed directly into virtual
networks: You can directly deploy various Azure services into specific subnets in a virtual network. You can secure Azure service resources to managed service subnets by setting up a service endpoint on the managed service subnet.

* Disk traffic from an Azure virtual machine: Virtual Machine Disk traffic for
managed and unmanaged disks is not affected by service endpoints routing changes for Azure Storage. This traffic includes diskIO as well as mount and unmount. You can limit REST access to page blobs to select networks through service endpoints and Azure Storage network rules.

Service endpoints can be configured on virtual networks independently by a user with write access to a virtual network. To secure Azure service resources to a VNet, the user must have permission to Microsoft.Network/virtualNetworks/subnets/joinViaServiceEndpoint/action for the added subnets.

The built-in service administrator roles include this permission by default. You can modify the permission by creating custom roles.

Virtual networks and Azure service resources can be in the same or different subscriptions. If the virtual network and Azure service resources are in different subscriptions, the resources must be under the same Active Directory (AD) tenant.

What are Service Endpoint Policies? -

Virtual Network (VNet) service endpoint policies allow you to filter egress virtual network traffic to Azure Storage accounts over a service endpoint, and allow data exfiltration to only specific Azure Storage accounts. Endpoint policies provide granular access control for virtual network traffic to Azure Storage when connecting over a service endpoint.

How do I create, change, or delete service endpoint policy using the Azure portal? -

Sign in to the Azure portal at https://portal.azure.com

Select + Create a resource on the upper, left corner of the Azure portal.

In search pane, type "service endpoint policy" and select Service endpoint policy and then select Create.

Enter, or select, the following information in Basics:

* Subscription : Select your subscription for policy * Resource group : Select Create new and enter ITPResourceGroup * Name : ITPEndpointPolicy * Location : East US

Select + Add under Resources and enter or select the following information in Add a resource pane:

* Service : Only Microsoft.Storage is available with Service Endpoint Policies

* Scope : Select one out of Single Account, All accounts in subscription and All accounts in resource group

* Subscription : Select your subscription for storage account. Policy and storage accounts can be in different subscriptions.

* Resource group : Select your resource group. Required, if scope is set as, "All accounts in resource group" or "Single account".

* Resource : Select your Azure Storage resource under the selected Subscription or Resource Group

Click on Add button at bottom to finish adding the resource

Select Review + Create. Validate the information and Click Create.

#### 2.1.10 implement DDoS protection
Azure DDoS protection, combined with application design best practices, provide defense against DDoS attacks. Azure DDoS protection provides the following service tiers:

* Basic: Automatically enabled as part of the Azure platform. Always-on
traffic monitoring, and real-time mitigation of common network-level attacks, provide the same defenses utilized by Microsoft's online services.

The entire scale of Azure's global network can be used to distribute and mitigate attack traffic across regions. Protection is provided for IPv4 and IPv6 Azure public IP addresses.

* Standard: Provides additional mitigation capabilities over the Basic
service tier that are tuned specifically to Azure Virtual Network resources.

Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. Real-time telemetry is available through Azure Monitor views during an attack, and for history. Rich attack mitigation analytics are available via diagnostic settings. Application layer protection can be added through the Azure Application Gateway Web Application Firewall or by installing a 3rd party firewall from Azure Marketplace. Protection is provided for IPv4 and IPv6 Azure public IP addresses.

What are the types of DDoS attacks that DDoS Protection Standard mitigates? -

* Volumetric attacks: The attack's goal is to flood the network layer with a
substantial amount of seemingly legitimate traffic. It includes UDP floods, amplification floods, and other spoofed-packet floods.

* Protocol attacks: These attacks render a target inaccessible, by exploiting
a weakness in the layer 3 and layer 4 protocol stack. It includes, SYN flood attacks, reflection attacks, and other protocol attacks.

* Resource (application) layer attacks: These attacks target web application
packets, to disrupt the transmission of data between hosts. The attacks include HTTP protocol violations, SQL injection, cross-site scripting, and other layer 7 attacks.

NOTE: DDoS Protection Standard protects resources in a virtual network including public IP addresses associated with virtual machines, load balancers, and application gateways. When coupled with the Application Gateway web application firewall, or a third-party web application firewall deployed in a virtual network with a public IP, DDoS Protection Standard can provide full layer 3 to layer 7 mitigation capability.

### 2.2 Configure advanced Security for compute

#### 2.2.1 configure endpoint protection
* Protect VMs by using authentication and access control
* use multiple vms for better availability
* protect agains malware
* manage your vm updates
* manage your vm security posture
* monitor vm performance
* encrypt your virtual hard disk files
* restrict direct internet connectivty

- Share responsibility to ASC

- Detail: Use a least privilege approach and built-in Azure roles to enable users to access and set up VMs:
    - Virtual Machine Contributor: Can manage VMs, but not the virtual network or storage account to which they are connected.
#### 2.2.2 configure and monitor system updates for VMs
#### 2.2.3 configure authentication for Azure Container Registry
Security best practices for AKS authentication
* use azure active directory
    * roles or clusterroles bound to users
* use role-based access controls (RBAC)
    * Permissions can be defined at the lcuster level, or to specific namespaces
* Use Pod Identities
    * the node magement identity (NMI) server : listens for pod requrest to Azure services
    * the managed identity controller (MIC) : checks for an azure identity mapping that corresponds to a pod

__**Configure container registry
Where you put your images
- reproducing the docker-style registry

images are registered in a secure docker registry to manage the images/workloads

- url for azure container registry must be globally unizque in azure "azurecr.io"

- sku types
    - basic
    - standard
    - premium : AzFw and other security options, Private endpoint connections, Customer-Managed Key-ing

- in order to upload a image to the directory you need to use powershell (not cloud cli)
    - azure cli allows you to log in and authenticate, docker installed on your local machine allows you to use the docker commands
__**configure security for different types of containers
As you manage clusters in Azure Kubernetes Service (AKS), you often need to isolate teams and workloads. The Kubernetes scheduler provides features that let you control the distribution of compute resources, or limit the impact of maintenance events.

Resource requests and limits are placed in the pod specification. These limits are used by the Kubernetes scheduler at deployment time to find an available node in the cluster. These limits and requests work at the individual pod level.

Best practice guidance - Plan and apply resource quotas at the namespace level. If pods do not define resource requests and limits, reject the deployment. Monitor resource usage and adjust quotas as needed.

Best practice guidance - To maintain the availability of applications, define Pod Disruption Budgets (PDBs) to make sure that a minimum number of pods are available in the cluster.
* Involuntary disruptions are events beyond the typical control of the cluster
* Voluntary disruptions are events requested by the cluster operator

Cluster networking
* public: URI = ".westus2.azurecontiner.io"
* private:
* none
##### 2.2.3.1 implement vulnerability management
CI/CD - DevOps lifecycle

- approved venders
    - aqua/twistlock - container security companies; they check the registry changes and the production cluster
##### 2.2.3.2 configure isolation for AKS
Major areas to focus on for AKS security
- master components
- node security
    - node (doing the work for the payload in the backgroud)
    - keeping nodes up to date can be a challenge
- cluster upgrades
- network security
- kubernetes secrets
    - Azure Key Vault
    - Never hard code API Access Keys (the common mistake for companies)


Master security -

In AKS, the Kubernetes master components are part of the managed service provided by Microsoft. Each AKS cluster has its own single-tenanted, dedicated Kubernetes master to provide the API Server, Scheduler, etc. This master is managed and maintained by Microsoft.

By default, the Kubernetes API server uses a public IP address and a fully qualified domain name (FQDN). You can limit access to the API server endpoint using authorized IP ranges. You can also create a fully private cluster to limit API server access to your virtual network.

You can control access to the API server using Kubernetes role-based access controls and Azure Active Directory.

Node security -

AKS nodes are Azure virtual machines that you manage and maintain. Linux nodes run an optimized Ubuntu distribution using the Moby container runtime. Windows Server nodes run an optimized Windows Server 2019 release and also use the Moby container runtime.

When an AKS cluster is created or scaled up, the nodes are automatically deployed with the latest OS security updates and configurations.

The Azure platform automatically applies OS security patches to Linux nodes on a nightly basis. If a Linux OS security update requires a host reboot, that reboot is not automatically performed. You can manually reboot the Linux nodes, or a common approach is to use Kured, an open-source reboot daemon for Kubernetes.

Kured runs as a DaemonSet and monitors each node for the presence of a file indicating that a reboot is required. Reboots are managed across the cluster using the same cordon and drain process as a cluster upgrade.

For Windows Server nodes, Windows Update does not automatically run and apply the latest updates. On a regular schedule around the Windows Update release cycle and your own validation process, you should perform an upgrade on the Windows Server node pool(s) in your AKS cluster.

This upgrade process creates nodes that run the latest Windows Server image and patches, then removes the older nodes.

NOTE: Nodes are deployed into a private virtual network subnet, with no public IP addresses assigned. For troubleshooting and management purposes, SSH is enabled by default. This SSH access is only available using the internal IP address.

To provide storage, the nodes use Azure Managed Disks. For most VM node sizes, these are Premium disks backed by high-performance SSDs. The data stored on managed disks is automatically encrypted at rest within the Azure platform. To improve redundancy, these disks are also securely replicated within the Azure datacenter.

Kubernetes environments, in AKS or elsewhere, currently are not completely safe for hostile multi-tenant usage.

Additional security features such as Pod Security Policies or more fine-grained role-based access controls (RBAC) for nodes make exploits more difficult.

However, for true security when running hostile multi-tenant workloads, a hypervisor is the only level of security that you should trust. The security domain for Kubernetes becomes the entire cluster, not an individual node.

For these types of hostile multi-tenant workloads, you should use physically isolated clusters.

Cluster upgrades -

For security and compliance, or to use the latest features, Azure provides tools to orchestrate the upgrade of an AKS cluster and components. This upgrade orchestration includes both the Kubernetes master and agent components.

You can view a list of available Kubernetes versions for your AKS cluster. To start the upgrade process, you specify one of these available versions. Azure then safely cordons and drains each AKS node and performs the upgrade.

Cordon and drain -

During the upgrade process, AKS nodes are individually cordoned from the cluster so new pods are not scheduled on them. The nodes are then drained and upgraded as follows:

* A new node is deployed into the node pool. This node runs the latest OS image and patches.

* One of the existing nodes is identified for upgrade. Pods on this node are gracefully terminated and scheduled on the other nodes in the node pool.

* This existing node is deleted from the AKS cluster. 
* The next node in the cluster is cordoned and drained using the same process until all nodes are successfully replaced as part of the upgrade process.

Network security -

For connectivity and security with on-premises networks, you can deploy your AKS cluster into existing Azure virtual network subnets.

These virtual networks may have an Azure Site-to-Site VPN or Express Route connection back to your on-premises network.

Kubernetes ingress controllers can be defined with private, internal IP addresses so services are only accessible over this internal network connection.

Azure network security groups -

To filter the flow of traffic in virtual networks, Azure uses network security group rules. These rules define the source and destination IP ranges, ports, and protocols that are allowed or denied access to resources.

Default rules are created to allow TLS traffic to the Kubernetes API server. As you create services with load balancers, port mappings, or ingress routes, AKS automatically modifies the network security group for traffic to flow appropriately.

Kubernetes network policy -

To limit network traffic between pods in your cluster, AKS offers support for Kubernetes network policies. With network policies, you can choose to allow or deny specific network paths within the cluster based on namespaces and label selectors.

Kubernetes Secrets -

A Kubernetes Secret is used to inject sensitive data into pods, such as access credentials or keys. You first create a Secret using the Kubernetes API.

When you define your pod or deployment, a specific Secret can be requested. Secrets are only provided to nodes that have a scheduled pod that requires it, and the Secret is stored in tmpfs, not written to disk.

When the last pod on a node that requires a Secret is deleted, the Secret is deleted from the node's tmpfs. Secrets are stored within a given namespace and can only be accessed by pods within the same namespace.

The use of Secrets reduces the sensitive information that is defined in the pod or service YAML manifest. Instead, you request the Secret stored in Kubernetes API Server as part of your YAML manifest.

This approach only provides the specific pod access to the Secret.

NOTE: The raw secret manifest files contains the secret data in base64 format (see the official documentation for more details). Therefore, this file should be treated as sensitive information, and never committed to source control.
##### 2.2.3.3 configure security for container registry
#### 2.2.4 implement Azure Disk Encryption
Azure Disk Encryption helps protect and safeguard your data to meet your organizational security and compliance commitments. It uses the Bitlocker feature of Windows to provide volume encryption for the OS and data disks of Azure virtual machines (VMs), and is integrated with Azure Key Vault to help you control and manage the disk encryption keys and secrets.

If you use Azure Security Center, you are alerted if you have VMs that are not encrypted. The alerts show as High Severity and the recommendation is to encrypt these VMs.

__**What VMs are supported? -

Windows VMs are available in a range of sizes. Azure Disk Encryption is not available on Basic, A-series VMs, or on virtual machines with a less than 2 GB of memory.

Azure Disk Encryption is also available for VMs with premium storage.

Azure Disk Encryption is not available on Generation 2 VMs and Lsv2-series VMs.

__**What Operating Systems are supported? -

* Windows client: Windows 8 and later
* Windows Server: Windows Server 2008 R2 and later
NOTE: Windows Server 2008 R2 requires the .NET Framework 4.5 to be installed for encryption; install it from Windows Update with the optional update Microsoft .NET Framework 4.5.2 for Windows Server 2008 R2 x64-based systems (KB2901983).

Windows Server 2012 R2 Core and Windows Server 2016 Core requires the bdehdcfg component to be installed on the VM for encryption.

__**What are the networking requirements? -

* To get a token to connect to your key vault, the Windows VM must be able to
connect to an Azure Active Directory endpoint, [login.microsoftonline.com]

* To write the encryption keys to your key vault, the Windows VM must be able
to connect to the key vault endpoint.

* The Windows VM must be able to connect to an Azure storage endpoint that
hosts the Azure extension repository and an Azure storage account that hosts the VHD files.

* If your security policy limits access from Azure VMs to the Internet, you
can resolve the preceding URI and configure a specific rule to allow outbound connectivity to the IPs.

What are the Group Policy requirements? -

Azure Disk Encryption uses the BitLocker external key protector for Windows VMs. For domain joined VMs, do not push any group policies that enforce TPM protectors.

BitLocker policy on domain joined virtual machines with custom group policy must include the following setting:

Configure user storage of BitLocker recovery information -> Allow 256-bit recovery key

Azure Disk Encryption will fail when custom group policy settings for BitLocker are incompatible. On machines that did not have the correct policy setting, apply the new policy, force the new policy to update (gpupdate.exe /force), and then restarting may be required.

Azure Disk Encryption will fail if domain level group policy blocks the AES-CBC algorithm, which is used by BitLocker.

What are the encryption storage key requirements? -

Azure Disk Encryption requires an Azure Key Vault to control and manage disk encryption keys and secrets. Your key vault and VMs must reside in the same Azure region and subscription.

* **SSE with PMK - by default**
* Azure disk encryption needs KEK
#### 2.2.5 configure authentication and security for Azure App Service
##### 2.2.5.1 configure SSL/TLS certs
You can restrict access to your Azure App Service app by enabling different types of authentication for it. One way to do it is to request a client certificate when the client request is over TLS/SSL and validate the certificate. This mechanism is called TLS mutual authentication or client certificate authentication.

NOTE: If you access your site over HTTP and not HTTPS, you will not receive any client certificate. So if your application requires client certificates, you should not allow requests to your application over HTTP.

To create custom security bindings or enable client certificates for your App Service app, your App Service plan must be in the Basic, Standard, Premium, or Isolated tier. In this step, you make sure that your web app is in the supported pricing tier.

To set up your app to require client certificates, you can switch On the Require incoming certificate by selecting Configuration > General Settings from the Azure Portal or you need to set the clientCertEnabled setting for your app to true.

To set the setting, run the following command in the Cloud Shell:

az webapp update --set clientCertEnabled=true --name <app_name> --resource-group <group_name>

Can I exclude paths from requiring authentication? -

When you enable mutual auth for your application, all paths under the root of your app will require a client certificate for access. To allow certain paths to remain open for anonymous access, you can define exclusion paths as part of your application configuration.

Exclusion paths can be configured by selecting Configuration > General Settings and defining an exclusion path.

How does the application access and use the client certificate? -

In App Service, TLS termination of the request happens at the frontend load balancer. When forwarding the request to your app code with client certificates enabled, App Service injects an X-ARR-ClientCert request header with the client certificate. App Service does not do anything with this client certificate other than forwarding it to your app. Your app code is responsible for validating the client certificate.

For ASP.NET, the client certificate is available through the HttpRequest.ClientCertificate property.

For other application stacks (Node.js, PHP, etc.), the client cert is available in your app through a base64 encoded value in the X-ARR-ClientCert request header.

What are my options to add a TLS/SSL certificate in Azure App Service? -

* Create a free App Service Managed Certificate (Preview) - A private
certificate that is easy to use if you just need to secure your www custom domain or any non-naked domain in App Service.

* Purchase an App Service certificate - A private certificate that is managed
by Azure. It combines the simplicity of automated certificate management and the flexibility of renewal and export options.

* Import a certificate from Key Vault - Useful if you use Azure Key Vault to
manage your PKCS12 certificates.

* Upload a private certificate - If you already have a private certificate
from a third-party provider, you can upload it.

* Upload a public certificate - Public certificates are not used to secure
custom domains, but you can load them into your code if you need them to access remote resources.

Are there any special Private certificate requirements? -

NOTE: Azure Web Apps does not support AES256 and all pfx files should be encrypted with TripleDES.

The free App Service Managed Certificate or the App Service certificate already satisfy the requirements of App Service. If you choose to upload or import a private certificate to App Service, your certificate must meet the following requirements:

* Exported as a password-protected PFX file
* Contains private key at least 2048 bits long
* Contains all intermediate certificates in the certificate chain
To secure a custom domain in a TLS binding, the certificate has additional requirements:

* Contains an Extended Key Usage for server authentication (OID = 1.3.6.1.5.5.7.3.1)

* Signed by a trusted certificate authority
What about the Create a free certificate (Preview) option? -

The free App Service Managed Certificate is a turn-key solution for securing your custom DNS name in App Service. It is a fully functional TLS/SSL certificate that's managed by App Service and renewed automatically. The free certificate comes with the following limitations:

* Does not support wildcard certificates
* Does not support naked domains
* Is not exportable
* Does not support DNS A-records
NOTE: The free certificate is issued by DigiCert. For some top-level domains, you must explicitly allow DigiCert as a certificate issuer by creating a CAA domain record with the value: 0 issue digicert.com
##### 2.2.5.2 configure authentication for Azure Kubernetes Service
##### 2.2.5.3 configure automatic updates
The Security Baseline discipline is one of the Five Disciplines of Cloud Governance.

This discipline focuses on ways of establishing policies that protect the network, assets, and most importantly the data that will reside on a cloud provider's solution.

Within the Five Disciplines of Cloud Governance, the Security Baseline discipline involves classification of the digital estate and data. It also involves documentation of risks, business tolerance, and mitigation strategies associated with the security of data, assets, and networks.

From a technical perspective, this discipline also includes involvement in decisions regarding encryption, network requirements, hybrid identity strategies, and tools to automate enforcement of security policies across resource groups.

Security Baseline Tools in Azure.docx

## 3 Manage security operations (25-30%)

### 3.1 Monitor security by using Azure Monitor

#### 3.1.1 create and customize alerts
Alerts proactively notify you when issues are found with your infrastructure or application using your monitoring data in Azure Monitor. They allow you to identify and address issues before the users of your system notice them.

Alert rules are separated from alerts and the actions taken when an alert fires. The alert rule captures the target and criteria for alerting. The alert rule can be in an enabled or a disabled state. Alerts only fire when enabled.

The following are key attributes of an alert rule:

**Target Resource** - Defines the scope and signals available for alerting. A target can be any Azure resource. Example targets:

* Virtual machines.
* Storage accounts.
* Log Analytics workspace.
* Application Insights.
For certain resources (like virtual machines), you can specify multiple resources as the target of the alert rule.

**Signal** - Emitted by the target resource. Signals can be of the following types: metric, activity log, Application Insights, and log.

**Criteria** - A combination of signal and logic applied on a target resource. Examples:

* Percentage CPU > 70%
* Server Response Time > 4 ms
* Result count of a log query > 100
**Alert Name** - A specific name for the alert rule configured by the user.

**Alert Description** - A description for the alert rule configured by the user.

**Severity** - The severity of the alert after the criteria specified in the alert rule is met. Severity can range from 0 to 4.

* Sev 0 = Critical
* Sev 1 = Error
* Sev 2 = Warning
* Sev 3 = Informational
* Sev 4 = Verbose
**Action** - A specific action taken when the alert is fired.

[What are alerts in Microsoft Azure?](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview)
#### 3.1.2 monitor security logs by using Azure Monitor
Security logging and monitoring focuses on activities related to enabling, acquiring, and storing audit logs for Azure services.
1. Use approved time synchronization sources
Microsoft maintains time sources for Azure resources, however, you have the option to manage the time synchronization settings for your compute resources.
2. Configure central security log management
Ingest logs via Azure Monitor to aggregate security data generated by endpoint devices, network resources, and other security systems. Within Azure Monitor, use Log Analytics Workspace(s) to query and perform analytics, and use Azure Storage Accounts for long-term/archival storage.

Alternatively, you may enable and on-board data to Azure Sentinel or a third-party SIEM.
3. Enable audit logging for Azure resources
Enable Diagnostic Settings on Azure resources for access to audit, security, and diagnostic logs. Activity logs, which are automatically available, include event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.
4. Collect security logs from operating systems
If the compute resource is owned by Microsoft, then Microsoft is responsible for monitoring it. If the compute resource is owned by your organization, it's your responsibility to monitor it. You can use Azure Security Center to monitor the OS. Data collected by Security Center from the operating system includes OS type and version, OS (Windows Event Logs), running processes, machine name, IP addresses, and logged in user. The Log Analytics Agent also collects crash dump files.
5. Configure security log storage retention
Within Azure Monitor, set your Log Analytics Workspace retention period according to your organization's compliance regulations. Use Azure Storage Accounts for long-term/archival storage.
6. Monitor and review Logs
Analyze and monitor logs for anomalous behavior and regularly review results. Use Azure Monitor's Log Analytics Workspace to review logs and perform queries on log data.

Alternatively, you may enable and on-board data to Azure Sentinel or a third party SIEM.

7. Enable alerts for anomalous activities
Use Azure Security Center with Log Analytics Workspace for monitoring and alerting on anomalous activity found in security logs and events.

Alternatively, you may enable and on-board data to Azure Sentinel.
8. Centralize anti-malware logging
Enable antimalware event collection for Azure Virtual Machines and Cloud Services.
9. Enable DNS query logging
Implement a third-party solution from Azure Marketplace for DNS logging solution as per your organizations need.
10. Enable command-line audit logging
Use Microsoft Monitoring Agent on all supported Azure Windows virtual machines to log the process creation event and the CommandLine field. For supported Azure Linux Virtual machines, you can manually configure console logging on a per-node basis and use Syslog to store the data. Also, use Azure Monitor's Log Analytics workspace to review logs and perform queries on logged data from Azure Virtual machines.


[Security Control: Logging and Monitoring](https://docs.microsoft.com/en-us/security/benchmark/azure/security-control-logging-monitoring)
---
Home > Azure Sentinel workspaces > Azure Sentinel | Incidents > Incident
- use the investigate button

The investigation graph provides you with:

* Visual context from raw data - The live, visual graph displays entity relationships extracted automatically from the raw data. This enables you to easily see connections across different data sources.

* Full investigation scope discovery - Expand your investigation scope using built-in exploration queries to surface the full scope of a breach.

* Built-in investigation steps - Use predefined exploration options to make sure you are asking the right questions in the face of a threat.

NOTE: You will only be able to investigate the incident if you used the entity mapping fields when you set up your analytic rule. The investigation graph requires that your original incident includes entities.
#### 3.1.3 configure diagnostic logging and log retention
- Each Azure resource requires its own diagnostic setting, which defines the following criteria:
    - Categories of logs and metric data sent to the destinations defined in the setting. The available categories will vary for different resource types.
    - One or more destinations to send the logs. Current destinations include Log
    - A single diagnostic setting can define no more than one of each of the destinations. If you want to send data to more than one of a particular destination type (for example, two different Log Analytics workspaces), then create multiple settings. Each resource can have up to 5 diagnostic settings.

- Destinations
    - Platform logs and metrics can be sent to the destinations in the following list:
    - Log Analytics workspace	- Collecting logs and metrics into a Log Analytics workspace allows you to analyze them with other monitoring data collected by Azure Monitor using powerful log queries and also to leverage other Azure Monitor features such as alerts and visualizations.
    - Event hubs - Sending logs and metrics to Event Hubs allows you to stream data to external systems such as third-party SIEMs and other log analytics solutions.
    - Azure storage account - Archiving logs and metrics to an Azure storage account is useful for audit, static analysis, or backup. Compared to Azure Monitor Logs and a Log Analytics workspace, Azure storage is less expensive and logs can be kept there indefinitely.

- Data retention
    - 30 Days to 730 (2 years)
### 3.2 Monitor security by using Azure Security Center

#### 3.2.1 evaluate vulnerability scans from Azure Security Center
The vulnerability scanner included with Azure Security Center is powered by Qualys. It is only available to users on the standard pricing tier. You do not need a Qualys license or even a Qualys account - everything's handled seamlessly inside Security Center.

Your VMs will appear in one or more of the following groups:
* Healthy resources – the vulnerability scanner extension has been deployed to these VMs.
* Unhealthy resources – the vulnerability scanner extension can be deployed to these VMs.
* Not applicable resources – these VMs cannot have the vulnerability scanner extension deployed.

- Click Remdiate to change the VM

Security Center > Resource Security Hygiene | Recommendations > This will bring broad remediation across the domain

* What is scanned by the built-in vulnerability scanner?

The scanner is running on your virtual machine and looking for vulnerabilities of the VM itself. From the virtual machine, it cannot scan your network.

* Does the scanner integrate with my existing Qualys console?

The Security Center extension is a separate tool from your existing Qualys scanner. Licensing restrictions mean that it can only be used within Azure Security Center.

* How do I View and remediate discovered vulnerabilities? -

When Security Center identifies vulnerabilities, it presents findings and related information as recommendations. The related information includes remediation steps, related CVEs, CVSS scores, and more. You can view the identified vulnerabilities for one or more subscriptions, or for a specific VM.
#### 3.2.2 configure Just in Time VM access by using Azure Security Center
#### 3.2.3 configure compliance policies and evaluate for compliance by using Azure Security Center
#### 3.2.4 configure workflow automation by using Azure Security Center

### 3.3 Monitor security by using Azure Sentinel
- very similar to SCOM (system center operations manager); intune, log analytic capabilities, agent based monitoring

- Just a few examples of what you can do with Azure Monitor include:
    - Detect and diagnose issues across applications and dependencies with Application Insights
    - Correlate infrastructure issues with Azure Monitor for VMs and Azure Monitor for Containers
    - Drill into your monitoring data with Log Analytics for troubleshooting and deep diagnostics
    - Support operations at scale with smart alerts and automated actions 
    - Create visualizations with Azure dashboards and workbooks
        - NOTE: This service supports Azure delegated resource management, which lets service providers sign in to their own tenant to manage subscriptions and resource groups that customers have delegated.

    **Azure Monitor** *Charges by ingestion amounts and retention amounts*

- All data collected by Azure Monitor fits into one of two fundamental types, metrics and logs.
    - Metrics are numerical values that describe some aspect of a system at a particular point in time. They are lightweight and capable of supporting near real-time scenarios.
    - Logs contain different kinds of data organized into records with different sets of properties for each type. Telemetry such as events and traces are stored as logs in addition to performance data so that it can all be combined for analysis.

- What data does Azure Monitor collect?
    - Azure Monitor can collect data from a variety of sources. You can think of monitoring data for your applications in tiers ranging from your application, any operating system and services it relies on, down to the platform itself.
    - Azure Monitor collects data from each of the following tiers:
        - Application monitoring data - Data about the performance and functionality of the code you have written, regardless of its platform.
            - Guest OS monitoring data - Data about the operating system on which your application is running. This could be running in Azure, another cloud, or on-premises.
            - Azure resource monitoring data - Data about the operation of an Azure resource.
            - Azure subscription monitoring data - Data about the operation and management of an Azure subscription, as well as data about the health and operation of Azure itself.
            - Azure tenant monitoring data - Data about the operation of tenant-level Azure services, such as Azure Active Directory.
                - NOTE: Azure Monitor can collect log data from any REST client using the Data Collector API. This allows you to create custom monitoring scenarios and extend monitoring to resources that do not expose telemetry through other sources.
#### 3.3.1 create and customize alerts
Monitor > Monitor | Alerts

Create alert rule > Scope (Select a resource, and the hierarchy is applied) > Condition > Add action group (select security group and determine an action) > Alert rule details (name, description)

**You can only define one Activity Log signal per alert rule. To alert on more signals, create additional rules**

* Log Alerts: With the visualization in place, Alert Logic can be selected from shown options of Condition, Aggregation and finally Threshold. Finally specify in the logic, the time to assess for the specified condition, using Period option. Along with how often Alert should run by selecting Frequency. Log Alerts can be based on:
 * Number of Records: An alert is created if the count of records returned by the query is either greater than or less than the value provided.
 * Metric Measurement: An alert is created if each aggregate value in the results exceeds the threshold value provided and it is grouped by chosen value. The number of breaches for an alert is the number of times the threshold is exceeded in the chosen time period. You can specify Total breaches for any combination of breaches across the results set or Consecutive breaches to require that the breaches must occur in consecutive samples.
 * *For Log Alerts only, some additional functionality is available in Alert details:*
  * Suppress Alerts: When you turn on suppression for the alert rule, actions
for the rule are disabled for a defined length of time after creating a new alert. The rule is still running and creates alert records provided the criteria is met. Allowing you time to correct the problem without running duplicate actions.
#### 3.3.2 configure data sources to Azure Sentinel
#### 3.3.3 evaluate results from Azure Sentinel
#### 3.3.4 configure a playbook by using Azure Sentinel
Microsoft Azure Sentinel is a scalable, cloud-native, security information event management (SIEM) and security orchestration automated response (SOAR) solution. Azure Sentinel delivers intelligent security analytics and threat intelligence across the enterprise, providing a single solution for alert detection, threat visibility, proactive hunting, and threat response.

What can Azure Sentinel do?
* Collect data at cloud scale across all users, devices, applications, and infrastructure, both on-premises and in multiple clouds.
* Detect previously undetected threats, and minimize false positives using Microsoft's analytics and unparalleled threat intelligence.
* Investigate threats with artificial intelligence, and hunt for suspicious activities at scale, tapping into years of cyber security work at Microsoft.
* Respond to incidents rapidly with built-in orchestration and automation of common tasks.

Sentinel uses data connectors within the Azure and 365 fabric to pull data, conduct analysis, and use playbooks to automate remediation

- _connectors_ = template to injest elements from on solution to sentinel (come with workbooks, queries, etc)
- _playbook_ = logic app; you can use logic app designer

### 3.4 Configure security policies

#### 3.4.1 configure security settings by using Azure Policy
#### 3.4.2 configure security settings by using Azure Blueprint

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

NOTE: Key Vault does not support EXPORT operations. Once a key is provisioned in the system, it cannot be extracted or its key material modified. However, users of Key Vault may require their key for other use cases, such as after it has been deleted. In this case, they may use the BACKUP and RESTORE operations to export/import the key in a protected form. Keys created by the BACKUP operation are not usable outside Key Vault. Alternatively, the IMPORT operation may be used against multiple Key Vault instances.
#### 4.4.3.6 backup and restore of Key Vault items
#### 4.4.3.7 configure Azure Defender for Key Vault






























# Excess
### Configure Multi-Factor Authentication security
* Security > Left pane, under the Manage subsection
* Click MFA
    * Account Lockout - specify locoucks for too man denials in a row that only applies to users who enter a PIN to authenticate
        * number of denials to trigger, minute s until rest, minutes until account is unblocked
    * Block/unblock users
        * Adding a user - prevents them from receiving the MFA prompt (auto blocked for 90 days)
    * Fraud Alert - allows user to report fraud if they receive a two-step verification request
        * Default is off
    * Notifications - the global admin is automatically listed
        * One-time bypass = a temporary allow for a user to authenticate for a default time period [default is 300 seconds - 5 min.]
        * Activity report = can see who has activated and usage logs
    * in the security section > Named locations > Configure MFA IPs
        * allows for whitelisting internal IPs
        * allows for remembering MFA for a set amount of days for trusted devices
#### Deleting groups
- You can initially delete from the group list
- Navigate to Deleted groups 
    - You can Delete permanently or restore
    - Groups are held in delete for 30 days
#### Managing Licenses
- Choose a Security Group
    - Licenses
        - You can select licenses and services you want to enable or disable
#### Deleting a User
- You need to go into the username from the menu
- Deleted users go into the 'Deleted users' option
    - can be permanently delted or restored (30 day)
#### Password Reset
- You can enable 'Self service passwords'
    - Apply to end users in your oganization
    - Admins auto-enrolled
    - require two methods of verification
#### User Settings
- Admin portal
- LinkedIn Account SSO
#### Roles and Administators
- Assignments : allow you to choose users (like application admin or application developer)
*you can manage licenses to users the same way*
### Install and Configure Azure AD Connect
* AD Connect tool
    * Express Install - requires a routable (.com) domain
        * Customize Install
            * Specify a custom installation location = Default is C:\Program Files\Microsoft
        * User sign-in
        * Connecting to Azure AD = Requires Global admin credentials
* For SSO Create a GPO
    * Site to Zone Assignment List > Edit to enable
        * https://autologon.microsoftazuread-sso.com | Data: 1
    * **Tip** Must be 2012 or newer
    * Ideally domain joined not the DC
##### Define the options after looking into the portal****
## Configure Azure AD Priveleged Identity Management
## Configure Azure tenant security
### Transfer Azure subs between Azure AD tenants
Navigate to 'Cost Management + Billing' 
* Billing
    * Subscriptions - In the options you can hit the elipses
You do this by emailing the subscription. You can change billing admins not necessarirly the entire tenant.
This removes RBAC permissions to manage Azure resources in the subscription
### Manage API access Azure subscriptions and resources
Authentication and Authorization steps
#### OAuth 2.0
The basic steps required to use the OAuth 2.0 authorization code grant flow to get an access token from the Microsoft identity platform endpoint are:
1. Register your app with Azure AD
2. Get authorization (/authorize endpoint) & Consent Experience
3. Get an access token (/token endpoint)
4. Call Microsoft Graph with the access token
5. Use a refresh token to get a new access token
## Implement network security
### Configure remote access management
* A virtual network gateway is composed of two or more VMs that are deployed to a specific subnet you create called the gateway subnet. Virtual network gateway VMs contain routing tables and run specific gateway services.
* Gateway types - VPN, ExpressRoute
    * VPN - from on prem to azure (Site 2 Site)
        *  SKUs named and number (ex. VpnGw1 - VpnGw5), higher the more expensive. Basic is also a SKU but can only be a Generation1.

    * Express Route - dedicated connectivity through an ISP
* Adding a Connection
    * Connection Type
        * VNet-to-VNet
        * Site-to-site (IPsec)
        * Express Route
    * Shared key (PSK)*
    * First VNG
    * Second VNG
* Point-to-site
    * Address pool - must be unique
    * Tunnel type
    * Authentication type
// A drawing would be nice
### Configure baseline
What is Azure Policy? -
Azure Policy helps to enforce organizational standards and to assess compliance at-scale. Through its compliance dashboard, it provides an aggregated view to evaluate the overall state of the environment, with the ability to drill-down to the per-resource, per-policy granularity. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources.
* Baselining isn't an option - it's a combination of following best practices. Leveraging azure policy to do so
* After creating a policy you can assign a policy
* Definitions : looking at existing elements or create new
    * location = subscription
## Implement host security
### Configure VM security & Configure baseline
Configuring the baseline is about going from the "as-is" to the "to be"
### Configure networking
* choose the appropriate network model
    * kubenet vs. azure CNI networking
* Distribute ingress traffic
    * An ingress resource & an ingress controller
* Secure traffic with a web application firewlall (WAF)
* Control traffic flow with network policies
    * Azure vs. Calico
* Securely connect to nodes through a bastion host
## Implement Azure Resource Management
### Create Azure resource locks
- resource locks
    - APIs that bound objects as ReadOny or CanNotDelete (users can still modify)
- Who can create or delete locks? 
    - To create or delete management locks, you must have access to Microsoft.Authorization/* or Microsoft.Authorization/locks/* actions.
- Blueprints
    - definitions / assignments
    - build the logic in a workflow to create a template that can be assigned to users
### Managing security using policies, resource groups, roles and permissions
- Azure Policy
    - Azure Policy helps to enforce organizational standards and to assess compliance at-scale. Through its compliance dashboard, it provides an aggregated view to evaluate the overall state of the environment, with the ability to drill-down to the per-resource, per-policy granularity. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources. Common use cases for Azure Policy include implementing governance for resource consistency, regulatory compliance, security, cost, and management. Policy definitions for these common use cases are already available in your Azure environment as built-ins to help you get started.
    - has the scorecard for compliance
    - has remediation steps
    - authored by assignments/definitions
- roles and permissions
    - set in azure AD
- How can I control the response to an evaluation?
    - Examples of how an organization wants the platform to respond to a non-complaint resource include:
        - Deny the resource change
        - Log the change to the resource
        - Alter the resource before the change
        - Alter the resource after the change
        - Deploy related compliant resources
    - The following are the times or events that cause a resource to be evaluated:
        - A resource is created, updated, or deleted in a scope with a policy assignment.
            - A policy or initiative is newly assigned to a scope.
            - A policy or initiative already assigned to a scope is updated
            - During the standard compliance evaluation cycle, which occurs once every 24 hours.
## Configure security services
## Manage security alerts
### Configure data classification
What is Azure Information Protection (AIP)? a cloud-based solution that helps an organization to classify and optionally, protect its documents and emails by applying labels. Labels can be applied automatically by administrators who define rules and conditions, manually by users, or a combination where users are given recommendations.
### Configure data retention
1. Retention wins over deletion
2. The longest retention period wins
3. Explicit inclusion wins over implicit inclusion.
4. The shortest deletion period wins
**Maximum numbers for the retention policy:**
* 1,000 mailboxes
* 1,000 Microsoft 365 groups
* 1,000 users for Teams private chats
* 100 sites (OneDrive or SharePoint)
### Configure data sovereignty
where our data is located, regulatory concerns, 
### Configure security for HDInsight
HDInisght cluster
The Azure HDInsight Enterprise Security Package (ESP), provides Active Directory-based authentication, multi-user support, and role-based access control for HDInsight clusters.
Perimeter security -
Perimeter security in HDInsight is achieved through virtual networks.
All clusters deployed in a VNET will also have a private endpoint. The endpoint resolves to a private IP inside the VNET for private HTTP access to the cluster gateways.
Authentication -
Active Directory integration is achieved through the use of Azure Active Directory Domain Services. With these capabilities, you can create an HDInsight cluster joined to an Active Directory domain. Then configure a list of employees from the enterprise who can authenticate to the cluster.
Authorization -
Configuring RBAC policies allows you to associate permissions with a role in the organization.
Auditing -
The admin can view and report all access to the HDInsight cluster resources and data. The admin can view and report changes to the access control policies.
To access Apache Ranger and Ambari audit logs, and ssh access logs, enable Azure Monitor, and view the tables that provide auditing records.
Encryption -
Azure storage and Data Lake Storage Gen1/Gen2, support transparent server-side encryption of data at rest. Secure HDInsight clusters will seamlessly work with server-side encryption of data at rest.
Compliance -
Azure compliance offerings are based on various types of assurances, including formal certifications.
### Configure security for Cosmos DB
How does Azure Cosmos DB secure my database? -
Network security - Azure Cosmos DB supports policy driven IP-based access controls for inbound firewall support. The IP-based access controls are similar to the firewall rules used by traditional database systems, but they are expanded so that an Azure Cosmos database account is only accessible from an approved set of machines or cloud services.
Azure Cosmos DB enables you to enable a specific IP address, an IP range, and combinations of IPs and ranges.
All requests originating from machines outside this allowed list are blocked by Azure Cosmos DB. Requests from approved machines and cloud services then must complete the authentication process to be given access control to the resources.
You can use virtual network service tags to achieve network isolation and protect your Azure Cosmos DB resources from the general Internet. Use service tags in place of specific IP addresses when you create security rules. By specifying the service tag name (for example, AzureCosmosDB) in the appropriate source or destination field of a rule, you can allow or deny the traffic for the corresponding service.
Authorization - Azure Cosmos DB uses hash-based message authentication code (HMAC) for authorization.
Each request is hashed using the secret account key, and the subsequent base-64 encoded hash is sent with each call to Azure Cosmos DB. To validate the request, the Azure Cosmos DB service uses the correct secret key and properties to generate a hash, then it compares the value with the one in the request. If the two values match, the operation is authorized successfully and the request is processed, otherwise there is an authorization failure and the request is rejected.
You can use either a master key, or a resource token allowing fine-grained access to a resource such as a document.
Users and permissions - Using the master key for the account, you can create user resources and permission resources per database. A resource token is associated with a permission in a database and determines whether the user has access (read-write, read-only, or no access) to an application resource in the database. Application resources include container, documents, attachments, stored procedures, triggers, and UDFs. The resource token is then used during authentication to provide or deny access to the resource.
Active directory integration (RBAC) - You can also provide or restrict access to the Cosmos account, database, container, and offers (throughput) using Access control (IAM) in the Azure portal. You can use built in roles or custom roles for individuals and groups.
Global replication - Global replication lets you scale globally and provide low-latency access to your data around the world.
In the context of security, global replication ensures data protection against regional failures.
Regional failovers - If you have replicated your data in more than one data center, Azure Cosmos DB automatically rolls over your operations should a regional data center go offline. You can create a prioritized list of failover regions using the regions in which your data is replicated.
Local replication - Even within a single data center, Azure Cosmos DB automatically replicates data for high availability giving you the choice of consistency levels. This replication guarantees a 99.99% availability SLA for all single region accounts and all multi-region accounts with relaxed consistency, and 99.999% read availability on all multi-region database accounts.
Automated online backups - Azure Cosmos databases are backed up regularly and stored in a geo redundant store.
Restore deleted data - The automated online backups can be used to recover data you may have accidentally deleted up to ~30 days after the event.
Protect and isolate sensitive data - Personal data and other confidential data can be isolated to specific container and read-write, or read-only access can be limited to specific users.
Geo-fencing - Azure Cosmos DB ensures data governance for sovereign regions
HTTPS/SSL/TLS encryption - All connections to Azure Cosmos DB support HTTPS. Azure Cosmos DB also supports TLS 1.2.
NOTE: It is possible to enforce a minimum TLS version server-side. To do so, you need to contact azurecosmosdbtls@service.microsoft.com
Encryption at rest - All data stored into Azure Cosmos DB is encrypted at rest.
Patched servers - As a managed database, Azure Cosmos DB eliminates the need to manage and patch servers, that's done for you, automatically.
Administrative accounts with strong passwords - It is impossible to have an administrative account with no password in Azure Cosmos DB. Security via TLS and HMAC secret based authentication is baked in by default.
### Configure security for Azure Data Lake
Azure Data Lake Storage is an enterprise-wide hyper-scale repository for big data analytic workloads.
Data Lake Storage Gen1 can be accessed from Hadoop(available with HDInsight cluster) using the WebHDFS-compatible REST APIs
Best practices:
* for identity management and authentication Data Lake Storage Gen1 uses Azure Active Directory
* RBAC provided by azure for acct mgmt
    * RBAC for acct management.docx
* POSIX ACL for accessing data in the store
    * used for accessing data within the store
    * focuses on consistency, not as powerful as RBAC
Roles built in
- owner, reader, contributor, administrator
Network isolation
- you can establish firewalls and define an IP addresss reange for trusted clients
key management
- two modes for master encryption keys (MEKs)
    - let data lake storage gen1 manage the MEKs for you
    - choose to retain ownership of the MEKs using you Azure Key Vault account
        - specified on creation
Activity and diagnostic logs
- acct mgmt - related activites use Azure Resource Manager APIs and are surfaced in the Azure portal via activity logs
- data-related - diagnostic logs

##### Configure virtual netowrk connectivity
Azure Virtual Network (VNet) is the fundamental building block for your private network in Azure. VNet enables many types of Azure resources, such as Azure Virtual Machines (VM), to securely communicate with each other, the internet, and on-premises networks. VNet is similar to a traditional network that you'd operate in your own data center, but brings with it additional benefits of Azure's infrastructure such as scale, availability, and isolation.

__**Why use an Azure Virtual network?
Azure virtual network enables Azure resources to securely communicate with each other, the internet, and on-premises networks. Key scenarios that you can accomplish with a virtual network include - communication of Azure resources with the internet, communication between Azure resources, communication with on-premises resources, filtering network traffic, routing network traffic, and integration with Azure services.

__**Communicate with the internet
All resources in a VNet can communicate outbound to the internet, by default. You can communicate inbound to a resource by assigning a public IP address or a public Load Balancer. You can also use public IP or public Load Balancer to manage your outbound connections. To learn more about outbound connections in Azure, see Outbound connections, Public IP addresses, and Load Balancer.

> Note
> When using only an internal Standard Load Balancer, outbound connectivity is not available until you define how you want outbound connections to work with an instance-level public IP or a public Load Balancer.

__**Communicate between Azure resources
Azure resources communicate securely with each other in one of the following ways:

* **Through a virtual network:** You can deploy VMs, and several other types of Azure resources to a virtual network, such as Azure App Service Environments, the Azure Kubernetes Service (AKS), and Azure Virtual Machine Scale Sets. To view a complete list of Azure resources that you can deploy into a virtual network, see Virtual network service integration.
* **Through a virtual network service endpoint:** Extend your virtual network private address space and the identity of your virtual network to Azure service resources, such as Azure Storage accounts and Azure SQL Database, over a direct connection. Service endpoints allow you to secure your critical Azure service resources to only a virtual network. To learn more, see Virtual network service endpoints overview.
* **Through VNet Peering:** You can connect virtual networks to each other, enabling resources in either virtual network to communicate with each other, using virtual network peering. The virtual networks you connect can be in the same, or different, Azure regions. To learn more, see Virtual network peering.
__**Communicate with on-premises resources
You can connect your on-premises computers and networks to a virtual network using any combination of the following options:

* **Point-to-site virtual private network (VPN):** Established between a virtual network and a single computer in your network. Each computer that wants to establish connectivity with a virtual network must configure its connection. This connection type is great if you're just getting started with Azure, or for developers, because it requires little or no changes to your existing network. The communication between your computer and a virtual network is sent through an encrypted tunnel over the internet. To learn more, see Point-to-site VPN.
* **Site-to-site VPN:** Established between your on-premises VPN device and an Azure VPN Gateway that is deployed in a virtual network. This connection type enables any on-premises resource that you authorize to access a virtual network. The communication between your on-premises VPN device and an Azure VPN gateway is sent through an encrypted tunnel over the internet. To learn more, see Site-to-site VPN.
* **Azure ExpressRoute:** Established between your network and Azure, through an ExpressRoute partner. This connection is private. Traffic does not go over the internet. To learn more, see ExpressRoute.
__**Filter network traffic
You can filter network traffic between subnets using either or both of the following options:

* **Network security groups:** Network security groups and application security groups can contain multiple inbound and outbound security rules that enable you to filter traffic to and from resources by source and destination IP address, port, and protocol. To learn more, see Network security groups or Application security groups.
* **Network virtual appliances:** A network virtual appliance is a VM that performs a network function, such as a firewall, WAN optimization, or other network function. To view a list of available network virtual appliances that you can deploy in a virtual network, see Azure Marketplace.
__**Route network traffic
Azure routes traffic between subnets, connected virtual networks, on-premises networks, and the Internet, by default. You can implement either or both of the following options to override the default routes Azure creates:

* **Route tables:** You can create custom route tables with routes that control where traffic is routed to for each subnet. Learn more about route tables.
* **Border gateway protocol (BGP) routes:** If you connect your virtual network to your on-premises network using an Azure VPN Gateway or ExpressRoute connection, you can propagate your on-premises BGP routes to your virtual networks. Learn more about using BGP with Azure VPN Gateway and ExpressRoute.
__**Virtual network integration for Azure services
Integrating Azure services to an Azure virtual network enables private access to the service from virtual machines or compute resources in the virtual network. You can integrate Azure services in your virtual network with the following options:

Deploying dedicated instances of the service into a virtual network. The services can then be privately accessed within the virtual network and from on-premises networks.
Using Private Link to access privately a specific instance of the service from your virtual network and from on-premises networks.
You can also access the service using public endpoints by extending a virtual network to the service, through service endpoints. Service endpoints allow service resources to be secured to the virtual network.

[https://docs.microsoft.com/en-us/azure/virtual-network/tutorial-connect-virtual-networks-portal](https://docs.microsoft.com/en-us/azure/virtual-network/tutorial-connect-virtual-networks-portal)
---
* Virtual network access settings are enabled by default and traffic forwarding is disabled
* Have to add IPv6 if you want that address space

Access to cloud shell
* shell.azure.com
    * editor is similar to ISE