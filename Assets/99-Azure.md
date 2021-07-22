# Azure
### The hierarchy of Azure goes like this:
Tenancy -> Subscription -> Resource Group -> Resource.
* From left to right, it's a one to multiple relationship:
* One tenancy can have multiple subscriptions, but a subscription can only belong to one tenancy.
* One Subscription can have multiple Resource Groups, but a Resource Group can only belong to one Subscription.
* And one Resource Group can have multiple Resources, but a Resource can only belong to one Subscription.