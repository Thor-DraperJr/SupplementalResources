# Azure
## The Hierarchy of Azure:
Tenancy -> Subscription -> Resource Group -> Resource.
* From left to right, it's a one to multiple relationship:
* One tenancy can have multiple subscriptions, but a subscription can only belong to one tenancy.
* One Subscription can have multiple Resource Groups, but a Resource Group can only belong to one Subscription.
* And one Resource Group can have multiple Resources, but a Resource can only belong to one Subscription.

## Resource Group
A resource group is a container that holds related resources for an Azure solution. All the resources in your resource group should share the same lifecycle (deployment, updates, and deletion). Each resource can only exist in only one resource group. However, a resource can connect to resources in other resource groups. This scenario is common when have related resources on different lifecycles (web apps that connect to a database). You can add or remove a resource to a resource group at a time. To create a resource group, you can use the portal, PowerShell, Azure CLI, or an ARM template. You can also move a resource from one resource group to another. The resources can be located in different regions than the resource group. The location of the resource group matters because the location specifies where the metadata is stored (for compliance regions you may need to). A resource group can be used to scope administrative actions. You can apply tags to a resource group, keep in mind the resources don't automatically inherit those tags. When a resource group is deleted, all resources in the resource group are also deleted.

Keep in mind:
* In the case that the resource group's region is temporarily unavaialable, you can't update the resource group because the metadata is unavaliable. The resources in other regions will still function as expected, but you can't up date them. 
* You can deploy up to 800 instances of a resource type in each resource group. Some resource types are exempt from the 800 instance limit.
* Some resources can exist outside of a resource group. These resources are deployed to the subscription, management group, or tenant. Only specific resource types are supported at these scopes.

## Azure Storage
Core storage services offer a built around being durable and highly available

Core storage services offer a massively scalable object store for data objects, disk storage for Azure virtual machines (VMs), a file system service for the cloud, a messaging store for reliable messaging, and a NoSQL store. The services are:
* Durable and

## How to connect to an Azure resource: 
* CLI
* PowerShell
* Portal
* SSH
* RDP

## What if an RDP connection attempt fails, what would you do?
* Scale set and availibility set
    * what they are and how they work

* Storage account
    * different types of storage: https://azure.microsoft.com/en-us/product-categories/storage
        * disk storage
        * blog storage...
* What can you store in a storage account
* Roles and permissions: https://docs.microsoft.com/en-us/azure/azure-monitor/roles-permissions-security
* What is IaaS? PaaS? SaaS?


## Advantages of using Cloud
* Easy to lift and shift without rewriting code and you can even get dedicated hosts that can provide single tenant physical servers dedicated to your organization

## VM sizes
* Our linux kernals offer performance features and a faster cadence compared to default or generic kernals
* fo

* VM families can be optimized for:
    * compute
    * memory
    * storage workloads
    * ai
    * machine learning
can be adjusted wheneter
you can take advantage of brands

entry level - A series; low cost
bustable - low to moderate cpu but need to burst for high cpu - check in/ check out at hotel

D-family: vcpus/memory/and temporary storage good for producaiton
Da-series: run an AMD
Dc-encrypts the data while in use with dedicated hardware TPMs

E-series: high memory, data analyitics, in-memory business critical workloads

M-sereies: designed for apps that process a lot of information in memory; like SAP hannah

F-series: high cpue to memory ratio; video encoding/rendering; lates intel xeon vido processors

L series: big data; storage optimized for I/O bandwidth

## Scale sets
Scale sets: in response to demand or based on a schedule you define

spot workloads: good for processes that can be interrupted


* https://docs.microsoft.com/en-us/azure/virtual-machines/sizes
* (https://www.youtube.com/watch?v=zOSvnJFd3ZM