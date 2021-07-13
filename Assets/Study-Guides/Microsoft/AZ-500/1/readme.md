# 1. Manage identity and access (30-35%)

## 1.i. Manage Azure Active Directory identities

### 1.i.d. configure security for service principles
An Azure Active Directory (Azure AD) service principal is the local representation of an application object in a single tenant or directory.‎It functions as the identity of the application instance. Service principals define who can access the application, and what resources the application can access. A service principal is created in each tenant where the application is used and references the globally unique application object. The tenant secures the service principal’s sign in and access to resources.

### Source
[Securing service principals](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/service-accounts-principal)

---

__**Definition List**__

[Application Object](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals#application-object)
: An Azure AD application is defined by its one and only application object, which resides in the Azure AD tenant where the application was registered (known as the application's "home" tenant). An application object is used as a template or blueprint to create one or more service principal objects. A service principal is created in every tenant where the application is used. Similar to a class in object-oriented programming, the application object has some static properties that are applied to all the created service principals (or application instances).

[Service principal object](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object)
: To access resources that are secured by an Azure AD tenant, the entity that requires access must be represented by a security principal. This requirement is true for both users (user principal) and applications (service principal). The security principal defines the access policy and permissions for the user/application in the Azure AD tenant. This enables core features such as authentication of the user/application during sign-in, and authorization during resource access. There are three types of service principal: Application, Managed identity, Legacy 

### 1.i.b. manage Azure AD directory groups
Azure Active Directory (Azure AD) lets you use groups to manage access to your cloud-based apps, on-premises apps, and your resources. Your resources can be part of the Azure AD organization, such as permissions to manage objects through roles in Azure AD, or external to the organization, such as for Software as a Service (SaaS) apps, Azure services, SharePoint sites, and on-premises resources.

> **Note:** In the Azure portal, you can see some groups whose membership and group details you can't manage in the portal: Groups synced from on-premises Active Directory can be managed only in on-premises Active Directory. Other group types such as distribution lists and mail-enabled security groups are managed only in Exchange admin center or Microsoft 365 admin center. You must sign in to Exchange admin center or Microsoft 365 admin center to manage these groups.

[Manage app and resource access using Azure Active Directory groups](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups)

---

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

### 1.i.c. manage Azure AD users
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

### 1.i.d. manage administrative units
It can be useful to restrict administrative scope by using administrative units in organizations that are made up of independent divisions of any kind. Consider the example of a large university that's made up of many autonomous schools (School of Business, School of Engineering, and so on). Each school has a team of IT admins who control access, manage users, and set policies for their school.

__**A central administrator could:**__
* Create a role with administrative permissions over only Azure AD users in the business school administrative unit.
* Create an administrative unit for the School of Business.
* Populate the administrative unit with only the business school students and staff.
* Add the business school IT team to the role, along with its scope.

[Administrative units in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/roles/administrative-units)

### 1.i.e. configure password writeback
Password writeback can be used to synchronize password changes in Azure AD back to your on-premises AD DS environment. Azure AD Connect provides a secure mechanism to send these password changes back to an existing on-premises directory from Azure AD.

[Tutorial: Enable Azure Active Directory self-service password reset writeback to an on-premises environment](https://docs.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr-writeback)

Azure Active Directory (Azure AD) self-service password reset (SSPR) lets users reset their passwords in the cloud, but most companies also have an on-premises Active Directory Domain Services (AD DS) environment where their users exist. Password writeback is a feature enabled with Azure AD Connect that allows password changes in the cloud to be written back to an existing on-premises directory in real time. In this configuration, as users change or reset their passwords using SSPR in the cloud, the updated passwords also written back to the on-premises AD DS environment

[How does self-service password reset writeback work in Azure Active Directory?](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-sspr-writeback)

### 1.i.f. configure authentication methods including password hash and Pass Through Authentication(PTA), OAuth, and passwordless
Azure Active Directory (Azure AD) Pass-through Authentication allows your users to sign in to both on-premises and cloud-based applications using the same passwords. This feature provides your users a better experience - one less password to remember, and reduces IT helpdesk costs because your users are less likely to forget how to sign in. When users sign in using Azure AD, this feature validates users' passwords directly against your on-premises Active Directory.

[User sign-in with Azure Active Directory Pass-through Authentication](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta)

[Choose the right authentication method for your Azure Active Directory hybrid identity solution](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/choose-ad-authn)

---
__**Password hash synchronization**__ 
: Requires the least effort regarding deployment, maintenance, and infrastructure. This level of effort typically applies to organizations that only need their users to sign in to Office 365, SaaS apps, and other Azure AD-based resources. When turned on, password hash synchronization is part of the Azure AD Connect sync process and runs every two minutes.


__**Federated authentication**__ 
: Relies on an external trusted system to authenticate users. Some companies want to reuse their existing federated system investment with their Azure AD hybrid identity solution. The maintenance and management of the federated system falls outside the control of Azure AD. It's up to the organization by using the federated system to make sure it's deployed securely and can handle the authentication load.
__**Pass-through authentication**__
: You need one or more (we recommend three) lightweight agents installed on existing servers. These agents must have access to your on-premises Active Directory Domain Services, including your on-premises AD domain controllers. They need outbound access to the Internet and access to your domain controllers. For this reason, it's not supported to deploy the agents in a perimeter network.
Pass-through Authentication requires unconstrained network access to domain controllers. All network traffic is encrypted and limited to authentication requests.

---

* Do you want Azure AD to handle Sign-in COMPLETELY in the cloud?

* Hash sychronize is a big factor in between on-prem / cloud envirnements because both environments need to sychronize for changes

* You can add multiple authentication methods

* Seamless SSO = allows users to us the same credentials to access other Azure resources

* Pass-through = No integrated federation, no 

### 1.i.g. transfer Azure subscriptions between Azure AD tenants
When you transfer a subscription to a different Azure AD directory, some resources are not transferred to the target directory. For example, all role assignments and custom roles in Azure role-based access control (Azure RBAC) are permanently deleted from the source directory and are not be transferred to the target directory.

[Transfer an Azure subscription to a different Azure AD directory](https://docs.microsoft.com/en-us/azure/role-based-access-control/transfer-subscription#:~:text=To%20transfer%20the%20subscription%20to%20a%20different%20directory%2C,as%20the%20user%20that%20accepted%20the%20transfer%20request.)

## 1.ii. Configure secure access by using Azure AD

### 1.ii.a. monitor privileged access for Azure AD Privleged Identity Management (PIM)
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

### 1.ii.b. configure Access Reviews
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

### 1.ii.c. configure PIM
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

### 1.ii.d. implement Conditional Access policies including Multi-Factor Authentication (MFA)

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

### 1.ii.e. configure Azure AD identity protection
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

## 1.iii. Manage application access

### 1.iii.a. create App Registration
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

### 1.iii.b. configure App Registration permission scopes
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

### 1.iii.c. manage App Registration permission consent
Applications that integrate with the Microsoft identity platform follow an authorization model that gives users and administrators control over how data can be accessed. The implementation of the authorization model has been updated on the Microsoft identity platform. It changes how an app must interact with the Microsoft identity platform.

[Permissions and consent in the Microsoft identity platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent)
---
proves right person to right level of access. 

Grants consent on behalf of the users in the AADD

**Tip:** https://myapps.microsoft.com

### 1.iii.d. manage API access to Azure subscriptions and resources
When you publish APIs through API Management, it's easy and common to secure access to those APIs by using subscription keys. Developers who need to consume the published APIs must include a valid subscription key in HTTP requests when they make calls to those APIs. Otherwise, the calls are rejected immediately by the API Management gateway. They aren't forwarded to the back-end services.

To get a subscription key for accessing APIs, a subscription is required. A subscription is essentially a named container for a pair of subscription keys. Developers who need to consume the published APIs can get subscriptions. And they don't need approval from API publishers. API publishers can also create subscriptions directly for API consumers.

> Tip: API Management also supports other mechanisms for securing access to APIs, including the following examples:
> * OAuth2.0
> * Client certificates
> * Restrict caller IPs

__**Scope of subscriptions**__
Subscriptions can be associated with various scopes: product, all APIs, or an individual API.

[Subscriptions in Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-subscriptions)

## 1.iv. Manage access control

### 1.iv.a. configure subscription and resource permissions
To manage access to Azure resources, you must have the appropriate administrator role. Azure has an authorization system called Azure role-based access control (Azure RBAC) with several built-in roles you can choose from. You can assign these roles at different scopes, such as management group, subscription, or resource group. By default, the person who creates a new Azure subscription can assign other users administrative access to a subscription.

This article describes how add or change the administrator role for a user using Azure RBAC at the subscription scope.

Microsoft recommends that you manage access to resources using Azure RBAC. However, if you are still using the classic deployment model and managing the classic resources by using Azure Service Management PowerShell Module, you'll need to use a classic administrator.

[Add or change Azure subscription administrators](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/add-change-subscription-administrator)

*unsure*

### 1.iv.b. configure resource group permissions
A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

The resource group stores metadata about the resources. Therefore, when you specify a location for the resource group, you are specifying where that metadata is stored. For compliance reasons, you may need to ensure that your data is stored in a particular region.

[Manage Azure Resource Manager resource groups by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

### 1.iv.c. configure custom RBAC roles
If the Azure built-in roles don't meet the specific needs of your organization, you can create your own custom roles. Just like built-in roles, you can assign custom roles to users, groups, and service principals at management group (in preview only), subscription, and resource group scopes.

Custom roles can be shared between subscriptions that trust the same Azure AD directory. There is a limit of 5,000 custom roles per directory. (For Azure Germany and Azure China 21Vianet, the limit is 2,000 custom roles.) Custom roles can be created using the Azure portal, Azure PowerShell, Azure CLI, or the REST API.

[Azure custom roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles)

### 1.iv.d. identify the appropriate role
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

#### 1.iv.d.a. apply principle of least privilege
Only grant the access users need
Using Azure RBAC, you can segregate duties within your team and grant only the amount of access to users that they need to perform their jobs. Instead of giving everybody unrestricted permissions in your Azure subscription or resources, you can allow only certain actions at a particular scope.

When planning your access control strategy, it's a best practice to grant users the least privilege to get their work done. Avoid assigning broader roles at broader scopes even if it initially seems more convenient to do so. When creating custom roles, only include the permissions users need. By limiting roles and scopes, you limit what resources are at risk if the security principal is ever compromised.

[Best practices for Azure RBAC](https://docs.microsoft.com/en-us/azure/role-based-access-control/best-practices)

### 1.iv.e. interpret permissions

[Azure Policy Regulatory Compliance controls for Azure RBAC](https://docs.microsoft.com/en-us/azure/role-based-access-control/security-controls-policy)

#### 1.iv.e.a. check access
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