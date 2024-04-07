$vmName="appvm"
$resourceGroup="app-grp"
$diskName="app-disk"

$vm=Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName

$vm | Add-AzVMDataDisk -Name $diskName -DiskSizeInGB 16 -CreateOption Empty -Lun 0

$vm | Update-AzVM

