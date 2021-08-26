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

Two main groups of storage:
* accessible via REST API
    * Queue Storage
        * When your services need to communicate with each other. Queue Storage is designed to connect the components of your application. It allows you to build flexible applications with independent components that rely on asynchronous message queuing.
    * Table Storage
        * Cheaper, more scalable storage for your structured data and big data analysis. In Table storage you can store, what a surprise, tables. But not all tables. Microsoft Azure Table Storage was designed to store structured NoSQL data.
    * Blob Storage 
        * Blob is a file. It all has begun with Blob Storage in Microsoft Azure. BLOB is an acronym and means Binary Large OBject. Or, in plain English, the unstructured files, such as images, video, music files, backup files, etc.
* access exclusively from VMs
    * File Storage
        * a network share
    * Disk Storage
        * your local drive
            * Speeds
                * HDDs that are cheap but slow and called **standard** storage.
                * SSDs that are fast but expensive and called **premium** storage.
        * Management
            * Unmanaged disk - you should manage the disk storage and corresponding account yourself
            * Managed disk - Azure does everything for you. You need to select only the size of the disk and the desired type - standard or premium


Redundancy: 
* Locally-Redundant Storage
    * 3 copies of each file in one building but 3 different places
* Geo-Redundant Storage
    * 3 copies in one building, 3 copies in the other.
    * Basically, this is LRS times 2.
* Zone Redundant Storage
    * Zone-redundant storage (ZRS) asynchronously replicates your data across data centers in one or two regions in addition to storing three replicas similarly to LRS. The data stored in ZRS is durable even if the primary data center is unavailable thus. ZRS is only available for block blobs and cannot be converted to LRS or GRS or vice versa.


## How to connect to an Azure resource: 
* CLI
* PowerShell
* Portal
* SSH
* RDP

## What if an RDP connection attempt fails, what would you do?






* Roles and permissions: https://docs.microsoft.com/en-us/azure/azure-monitor/roles-permissions-security
## What is IaaS? PaaS? SaaS?
IaaS
* Data center physical plant / building
* Networking firewalls / security
* Servers and storage
PaaS
* Operating systems
* Deployment tools, database management, business analytics
SaaS
* Hosted applications

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

* D-family: vcpus/memory/and temporary storage good for producaiton
* Da-series: run an AMD
* Dc-encrypts the data while in use with dedicated hardware TPMs
* E-series: high memory, data analyitics, in-memory business critical workloads
* M-sereies: designed for apps that process a lot of information in memory; like SAP hannah
* F-series: high cpue to memory ratio; video encoding/rendering; lates intel xeon vido processors
* L series: big data; storage optimized for I/O bandwidth

## Scale sets
Increase or decrease the number of VMs automatically in response to demand or based on a schedule you define.

Vertical scaling, also known as scale up and scale down, means increasing or decreasing virtual machine (VM) sizes in response to a workload. Compare this behavior with horizontal scaling, also referred to as scale out and scale in, where the number of VMs is altered depending on the workload.

spot workloads: good for processes that can be interrupted


## Availability sets
Deployed across multiple fault domains and have different maintenance windows

An availability set is a logical grouping of VMs that allows Azure to understand how your application is built to provide for redundancy and availability. We recommended that two or more VMs are created within an availability set to provide for a highly available application and to meet the 99.95% Azure SLA. There is no cost for the Availability Set itself, you only pay for each VM instance that you create.

Each virtual machine in your availability set is assigned an update domain and a fault domain by the underlying Azure platform. Each availability set can be configured with up to three fault domains and twenty update domains.

## Availability Zone
geography	An area of the world containing at least one Azure region

region	A set of datacenters deployed within a latency-defined perimeter and connected through a dedicated regional low-latency network.

Availability Zone	Unique physical locations within a region.



#####



VMs requre a resource group, storage account, vnet, NIC


* https://docs.microsoft.com/en-us/azure/virtual-machines/sizes
* (https://www.youtube.com/watch?v=zOSvnJFd3ZM


https://docs.microsoft.com/en-us/azure/storage/common/storage-introduction
https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview#resource-groups
https://docs.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview
https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/get-started/