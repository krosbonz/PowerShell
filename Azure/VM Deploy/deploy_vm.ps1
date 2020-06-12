$resourcegroup = "mytechwestrg"
$VMName = "win2k16-vm-2-w"
$location = "West US"
$Size = "Standard_B1s"
$vnet = "mytechwestvnet1"
$subnet = "mytechwestsnet1"
$nsg = "mytechwestnsg"
$strgacct = "mytechwestsg"


New-AzVm `
    -ResourceGroupName $resourcegroup `
    -Name $vmname `
    -Location $location `
    -Size $size `
    -Image "Win2016Datacenter"
    -VirtualNetworkName $vnet `
    -SubnetName $subnet `
    -SecurityGroupName $nsg `
    -PublicIpAddressName "$vmname-ip" `
    -OpenPorts 3389