$rg_name = "rg-storage"
$location = "uksouth"

New-AzResourceGroup -Name $rg_name -Location $location

New-AzResourceGroupDeployment -Name 'new-storage-v2' `
-ResourceGroupName $rg_name `
-TemplateFile '01-storage-V2.json' `
-storageName 'storageaccount1041304' `
-storageSKU 'Standard_LRS'