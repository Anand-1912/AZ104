$rg_name = "rg-network"
$location = "uksouth"

New-AzResourceGroup -Name $rg_name -Location $location

$vnet_name = "vnet-002"
$vnet_address_prefix = "10.0.0.0/16"
$subnet_name = "subnet-001"
$subnet_prefix = "10.0.0.0/24"


$subnet_config_001 = New-AzVirtualNetworkSubnetConfig -Name $subnet_name -AddressPrefix $subnet_prefix
#$IPconfig = New-AzNetworkInterfaceIpConfig -Name "IPConfig1" -PrivateIpAddressVersion IPv4 -PrivateIpAddress "10.0.0.10"

$vnet = New-AzVirtualNetwork -Name $vnet_name -Location $location -AddressPrefix $vnet_address_prefix -ResourceGroupName $rg_name -Subnet $subnet_config_001

$subnet_001 = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnet_name
New-AzNetworkInterface -Name $vnet_name -Location $location -ResourceGroupName $rg_name -SubnetId $subnet_001.Id -IpConfigurationName "IpConfig"

