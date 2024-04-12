$rg_name = "rg-network"
$location = "uksouth"
$pip_name = "pip-001"
$dns_label_name = "blueskytech"

New-AzResourceGroup -Name $rg_name -Location $location

New-AzPublicIpAddress -ResourceGroupName $rg_name -Location $location -Name $pip_name -AllocationMethod Static -DomainNameLabel $dns_label_name