﻿#$httpservice = Get-NsxService -Name APP_MSSQL_TCP -LocalOnly -Service $httpservice
Get-NsxFirewallSection "App - CPACS" | New-NsxFirewallRule -name "CPACS-Web to CPACS-App" -Source (Get-NsxSecurityGroup SG-cpacs-web) -Destination (Get-NsxSecurityGroup SG-cpoint-app)   -Action Allow 