
$resourceGroup = "aw125-rg1"
$location = "West Europe"
$subscriptionName = "Visual Studio Enterprise"

#See https://azure.microsoft.com/en-gb/documentation/articles/resource-group-authenticate-service-principal/
$certThumbprint = "95BC3CB48859825DA39DC404BEA4307C52C56113" #needs to exist in IE keystore
$applicationId = "4f49460f-c86d-4e09-80de-ab96a5758d30"
$tenantId = "5f941d5d-a25b-401f-8867-c434248dfae4"

Add-AzureRmAccount -ServicePrincipal -CertificateThumbprint $certThumbprint -ApplicationId $applicationId -TenantId $tenantId

Get-AzureRmSubscription –SubscriptionName $subscriptionName | Select-AzureRmSubscription

New-AzureRmResourceGroup -Name $resourceGroup  -Location $location

New-AzureRmResourceGroupDeployment -Name $resourceGroup -ResourceGroupName $resourceGroup  -TemplateFile "$resourceGroup.json"