$userprefix = Read-Host "Enter User Prefix (E.G. CPB): "
$usercount = Read-Host "Enter how many users should be created (up to 999): "
$initialivalue = Read-Host "Enter starting user number (E.G. 000, 100): "
$acctpasswd = Read-Host "Enter the user password: "
$adminorstd = Read-Host "Admin or User? "

    if ($adminorstd -eq "admin") {
        $userprefix = $userprefix + "ADMIN"
    } else {
    }

For($i = $initialivalue -as [int]; $i -lt $usercount -as [int]; $i++)

{

$UserNumber = $i

    if ($UserNumber -lt 10)
    {

    New-ADUser "$userprefix-00$UserNumber" -UserPrincipalName "$userprefix-00$UserNumber" -AccountPassword (ConvertTo-SecureString -AsPlainText -Force -String $acctpasswd) -Description "Auto-Generated User" -Enabled $True -PasswordNeverExpires $True -ChangePasswordAtLogon $false -GivenName "$userprefix-00$UserNumber" -DisplayName "$userprefix-00$UserNumber"
        if ($adminorstd -eq "admin")
        {
            Add-ADGroupMember "Domain Admins" "$userprefix-00$UserNumber"
        } 
        
    $UserNumber = $i + 1
    }
    
    elseif (($UserNumber -lt 100) -and ($UserNumber -ge 10))
    {
    
    New-ADUser "$userprefix-0$UserNumber" -UserPrincipalName "$userprefix-0$UserNumber" -AccountPassword (ConvertTo-SecureString -AsPlainText -Force -String $acctpasswd) -Description "Auto-Generated User" -Enabled $True -PasswordNeverExpires $True -ChangePasswordAtLogon $false -GivenName "$userprefix-0$UserNumber" -DisplayName "$userprefix-0$UserNumber"
    
        if ($adminorstd -eq "admin")
        {
            Add-ADGroupMember "Domain Admins" "$userprefix-0$UserNumber"
        } 

    $UserNumber = $i + 1
    }

    elseif (($UserNumber -lt 1000) -and ($UserNumber -ge 100))
    {
    
    New-ADUser "$userprefix-$UserNumber" -UserPrincipalName "$userprefix-$UserNumber" -AccountPassword (ConvertTo-SecureString -AsPlainText -Force -String $acctpasswd) -Description "Auto-Generated User" -Enabled $True -PasswordNeverExpires $True -ChangePasswordAtLogon $false -GivenName "$userprefix-$UserNumber" -DisplayName "$userprefix-$UserNumber"
    
        if ($adminorstd -eq "admin")
        {
            Add-ADGroupMember "Domain Admins" "$userprefix-$UserNumber"
        } 

    $UserNumber = $i + 1
    }

}