Get-Command *AzVirtualNetwork*

Get-Help New-AzVirtualNetwork -Examples

$rg_name = "rg-compute"
$location = "uksouth"
$vnet_name = "vnet-001"
$address_prefix = "10.0.0.0/16"

New-AzResourceGroup -Name $rg_name -Location $location

# Creating a Vnet
New-AzVirtualNetwork -Name $vnet_name -Location $location `
-AddressPrefix $address_prefix -ResourceGroupName $rg_name 

# Getting a Vnet
$vnet = Get-AzVirtualNetwork -Name $vnet_name -ResourceGroupName $rg_name

# Subnets
Get-Help New-AzVirtualNetworkSubnetConfig -Examples

$subnet_name = "frontendsubnet"
$subnet_address_prefix = "10.0.0.0/24"

Add-AzVirtualNetworkSubnetConfig -Name $subnet_name -AddressPrefix $subnet_address_prefix -VirtualNetwork $vnet

$vnet | Set-AzVirtualNetwork






