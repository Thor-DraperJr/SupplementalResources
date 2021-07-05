## 2. Implement platform protection (15-20%)

### 2.i. Implement advanced network security

#### 2.i.a. secure the connectivity of virtual networks (VPN authentication, Express Route encryption)
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

#### 2.i.b. configure Network Security Groups (NSGs) and Application Security Groups (ASGs)
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

#### 2.i.c. create and configure Azure Firewall
* Firewall solution (Firewall as a Service)
* Scalable solution

* tied into log analytics, has it's own public IP, integrate with SEIM (sec incident and management)

Azure Firewall is a managed, cloud-based network security service that protects your Azure Virtual Network resources. It is a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability.

You can centrally create, enforce, and log application and network connectivity policies across subscriptions and virtual networks. Azure Firewall uses a static public IP address for your virtual network resources allowing outside firewalls to identify traffic originating from your virtual network. The service is fully integrated with Azure Monitor for logging and analytics.

* Stadard SKU Public IP and Static only

* Forced Tunneling : 

* Threat intelligence - off, alert only, alert and deny

* Rules - NAT Rule collection | Network rule collection | Application rule collection
#### 2.i.d. implement Azure Firewall Manager
The *resource firewall* allows us to restrict access to an Azure service that supports the resource firewall feature. Azure storage accounts are one area where that is supported, as are Azure SQL Server and databases as well as Azure SQL Data Warehouse. In fact for Azure SQL, you can actually configure firewall rules at both the server level and the database level. You can use PowerShell, Azure CLI and the Azure Portal.

The *Azure storage firewall* provides access control for the public endpoint of your storage account. You can also use the firewall to block all access through the public endpoint when using private endpoints. Your storage firewall configuration also enables select trusted Azure platform services to access the storage account securely.

An application that accesses a storage account when network rules are in effect still requires proper authorization for the request. Authorization is supported with Azure Active Directory (Azure AD) credentials for blobs and queues, with a valid account access key, or with a SAS token.

* Object bound instances - specify vnet, subnet, address range, endpoint status, rg. You specify stateful connections in and out.

#### 2.i.e. configure Azure Front Door service as an Application Gateway
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

#### 2.i.f. configure a Web Application Firewall (WAF) on Azure Application Gateway
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

#### 2.i.g. configure Azure Bastion
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

#### 2.i.h. configure a firewall on a storage account, Azure SQL, KeyVault, or App Service
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

#### 2.i.i. implement Service Endpoints
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