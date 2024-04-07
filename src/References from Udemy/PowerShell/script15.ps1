$resourceGroup="app-grp"
$location="North Europe"
$appServiceName="demoplan55534"
$webAppName="webapp55434434"

New-AzAppServicePlan -ResourceGroupName $resourceGroup -Location $location `
-Name $appServiceName -Tier "F1"

New-AzWebApp -ResourceGroupName $resourceGroup -Name $webAppName `
-Location $location -AppServicePlan $appServiceName
