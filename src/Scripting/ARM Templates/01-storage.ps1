$rg_name = "rg-storage"
$location = "uksouth"

New-AzResourceGroup -Name $rg_name -Location $location

New-AzResourceGroupDeployment -Name 'new-storage' -ResourceGroupName $rg_name -TemplateFile '01-storage.json'