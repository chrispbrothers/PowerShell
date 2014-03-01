$lynccredential = get-credential #requests credentials from user
$serveraddress = Read-Host 'Enter the server url (server.domain.suffix E.G. lyncserver.contoso.com)' #requests user enter portion of lync server admin address
$lyncsession = New-PSSession -ConnectionUri "https://$serveraddress/OcsPowershell" -Credential $lynccredential #establishes a connection with the Lync server management
Import-PSSession $lyncsession #Imports cmdlets from Lync session
$lyncuser = Read-Host 'Enter the username to disable' #requests imput of user to disable
Disable-CsUser -Identity $lyncuser #disables the above requested user
Invoke-CsManagementStoreReplication #forces immediate replication which should also log off the disabled user
