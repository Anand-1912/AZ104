$resourceGroup="app-grp"
$location="North Europe"
$accountSKU="Standard_LRS"
$storageAccountName="appstore4443434"
$storageAccountKind="StorageV2"

New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $storageAccountName `
-Location $location -Kind $storageAccountKind -SkuName $accountSKU