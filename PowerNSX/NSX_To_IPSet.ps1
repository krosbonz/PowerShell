﻿Test
Get-NsxFirewallSection "App - SCE" | New-NsxFirewallRule -name "SCE-App to Printing" -Source (Get-NSXsecuritygroup sg-sce-app) -Destination (Get-NSXIPSet ip-printing)   -Action Allow