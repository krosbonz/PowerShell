﻿Get-NsxFirewallSection "App - SCE" | New-NsxFirewallRule -name "Printing to SCE-App" -Source (Get-NSXIPSet ip-printing) -Destination (Get-NSXsecuritygroup sg-sce-app)   -Action Allow 