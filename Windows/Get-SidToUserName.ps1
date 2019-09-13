

    <#

       .Synopsis

        Translates a user name to a SID or a SID to a user name.

       .Description

        This script translates a user name to a SID or a SID to a user name.

        Note: To translate the user name to the SID, you must

        use the logon name (SAMAccountName), and not the full user name.

       .Example

        UserToSid.ps1  -user "mytestuser"

        Displays SID of mytestuser in current domain

       .Example

        UserToSid.ps1  -sid "S-1-5-21-1877799863-120120469-1066862428-500"

        Displays user with SID of "S-1-5-21-1877799863-120120469-1066862428-500"

       .Inputs

        [string]

       .OutPuts

        [string]

       .Notes

        NAME:  UserToSid-SidToUser.ps1

        AUTHOR: Ed Wilson

        LASTEDIT: 10/05/2010

        VERSION: 2.0

        KEYWORDS: Active Directory, user accounts, Security.Principal.SecurityIdentifier

       .Link

         Http://www.ScriptingGuys.com

    #Requires -Version 2.0

    #>