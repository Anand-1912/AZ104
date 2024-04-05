$resourceGroup="app-grp"
$location="North Europe"
$publicIPAddress="app-ip"

New-AzPublicIpAddress -Name $publicIPAddress -ResourceGroupName $resourceGroup `
-Location $location -AllocationMethod Dynamic