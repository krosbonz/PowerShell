﻿Get-NsxFirewallSection "App - Corepoint" | New-NsxFirewallRule -name "CPoint-App to WSD" -Source (Get-nsxsecuritygroup sg-cpoint-app) -Destination "239.255.255.250" -Action Allow