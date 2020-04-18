# Supress breaking warning alerts
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

# Set the current active subscription for the session
$context = Get-AzSubscription -AccountId fb0a14a6-d68a-4594-94d9-8950a5a7030e
Set-AzContext $context

New-AzResourceGroup mytechrg "East US"

New-AzStorageAccount -ResourceGroupName mytechrg -Name mytechsg -Location 'East US' -SkuName Standard_LRS

New-AzVirtualNetwork -Name mytechvnet1 -ResourceGroupName mytechrg -Location "East US" -AddressPrefix "10.10.0.0/16" -Subnet $newSubnet
$newSubnet = add-AzVirtualNetworkSubnetConfig -Name "mytechsnet1" -AddressPrefix "10.10.1.0/24"

New-AzNetworkSecurityGroup -Name "mytechnsg" -ResourceGroupName "mytechrg" -Location "East US"


# Add subnet to virtual network
$snetname = 
$addprefix = 
$virtnet = Get-AzVirtualNetwork -Name 'mytechvnet1' -ResourceGroupName 'mytechrg' `
add-AzVirtualNetworkSubnetConfig -Name $snetname -AddressPrefix $addprefix -VirtualNetwork $virtnet `
$virtnet | Set-AzVirtualNetwork

