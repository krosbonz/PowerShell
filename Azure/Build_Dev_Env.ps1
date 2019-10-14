
# New-AzResourceGroup rgdevdocker "East US"
# New-AzStorageAccount -ResourceGroupName rgdevdocker -Name sgdevdocker -Location 'East US' -SkuName Standard_LRS
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

$newSubnet = New-AzVirtualNetworkSubnetConfig -Name "snetdevdocker" -AddressPrefix "10.26.4.0/24" 
New-AzVirtualNetwork -Name vnetdevdocker -ResourceGroupName rgdevdocker -Location "East US" -AddressPrefix "10.26.0.0/16" -Subnet $newSubnet