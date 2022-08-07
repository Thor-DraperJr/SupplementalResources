# Notes

- [How to create an Azure deploy button](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-to-azure-button)

```text
![Deploy to Azure](https://aka.ms/deploytoazurebutton)

<img src="https://aka.ms/deploytoazurebutton"/>

$url = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json"
[uri]::EscapeDataString($url)

https://portal.azure.com/#create/Microsoft.Template/uri/
```

- [ALB Service Tags](https://docs.microsoft.com/en-us/azure/virtual-network/service-tags-overview)
