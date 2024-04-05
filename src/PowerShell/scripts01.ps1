# To Connect to an Azure Account and Subscription

Connect-AzAccount

# Creating Resource Group

Get-Help New-AzResourceGroup

New-AzResourceGroup -Name rg-powershell -Location uksouth

Get-AzResourceGroup -Name rg-powershell

# Creating a VNet and fetching the details

$VNetName = "vnet-001"
$ResourceGroup = "rg-powershell"
$Location = "uksouth"
$AddressPrefix = "10.0.0.0/16"

New-AzVirtualNetwork -Name $VNetName -Location $Location -AddressPrefix $AddressPrefix `
-ResourceGroupName $ResourceGroup


$VNetDetails = Get-AzVirtualNetwork -ResourceGroupName ResourceGroup -Name $VNetName

Write-Host $VNetDetails.$Location


$SubnetName = "subnet-A"
$SubnetAddressPrefix = "10.0.0.0/24"

Add-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix `
-VirtualNetwork $VNetDetails

$VNetDetails | Set-AzVirtualNetwork



