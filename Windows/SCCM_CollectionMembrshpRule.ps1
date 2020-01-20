$memrule = Get-CMDeviceCollectionIncludeMembershipRule -CollectionName "LGH - WU - Win7 - Remote - 2" | Select-Object -ExpandProperty RuleName
#Write-Host $memrule
Add-Content c:\users\mhauck\desktop\Win7OUs.txt $memrule