$region = "eastus"
$resgrp = "kubetech"
$snet = "ktechsnet1"
$vnet = "ktechvnet1"

$vnetconfig = New-AzVirtualNetwork `
-Name $vnet `
-ResourceGroupName $resgrp `
-Location $region `
-AddressPrefix 192.168.0.0/16

$snetconfig = Add-AzVirtualNetworkSubnetConfig `
-Name $snet `
-VirtualNetwork $vnetconfig `
-AddressPrefix 192.168.1.0/24

$vnetconfig | Set-AzVirtualNetwork 



