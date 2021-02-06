# current version
Get-InstalledModule -Name "Az"

# Sign-in to azure
Connect-AzAccount

# create a new resource group with PowerShell using the New-AzResourceGroup command:
# put resource group in a variable so you can use the same group name going forward,
# without hard-coding it repeatedly
$resourceGroup = "storage-resource-group"
$location = "westus"
New-AzResourceGroup -Name $resourceGroup -Location $location

# list of supported regions for your subscription with the Get-AzLocation command:
Get-AzLocation | select Location

# create a general-purpose v2 storage account with read-access geo-redundant storage (RA-GRS) by using the New-AzStorageAccount command. 
# Remember that the name of your storage account must be unique across Azure, 
# so replace the placeholder value in brackets with your own unique value:
New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name <account-name> `
  -Location $location `
  -SkuName Standard_RAGRS `
  -Kind StorageV2
  
# delete the storage account, use the Remove-AzStorageAccount command:
Remove-AzStorageAccount -Name <storage-account> -ResourceGroupName <resource-group>

# Alternately, you can delete the resource group, which deletes the storage account and any other resources in that resource group. 
# For more information about deleting a resource group, see https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/delete-resource-group?tabs=azure-powershell.

# It's not possible to restore a deleted storage account or retrieve any of the content that it contained before deletion. 
# Be sure to back up anything you want to save before you delete the account. 
# This also holds true for any resources in the account—once you delete a blob, table, queue, or file, it is permanently deleted.
# If you try to delete a storage account associated with an Azure virtual machine, you may get an error about the storage account still being in use. 
# For help troubleshooting this error, see https://docs.microsoft.com/en-us/azure/virtual-machines/troubleshooting/ when you delete storage accounts.
