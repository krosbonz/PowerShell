﻿Get-NsxFirewallSection "App - Pyramis" | New-NsxFirewallRule -name "Pyramis-Int to CommDir" -Source (Get-nsxsecuritygroup sg-responder-db) -Destination (get-vm lgh-mt-cd)   -Action Allow