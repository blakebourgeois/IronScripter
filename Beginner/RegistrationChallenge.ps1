## Iron Scripter Challenge https://ironscripter.us/a-registered-powershell-challenge/

function Get-ComputerRegistrationInfo{
    if((get-item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\").GetValue("RegisteredOwner")){
        $UserName = (get-item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\").GetValue("RegisteredOwner")
        }
    else{
        $UserName = "No owner registered."
        }

    if((get-item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\").GetValue("RegisteredOrganization")){
        $OrganizationName = (get-item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\").GetValue("RegisteredOrganization")
        }
    else{
        $OrganizationName = "No organization registered."
        }

    $registrationDetails = [PSCustomObject]@{
        UserName = $UserName
        OrganizationName = $OrganizationName
        }

    return $registrationDetails

    }

function Set-ComputerRegistrationInfo{
    Param(
    [parameter(Mandatory)]
    [string]$UserName,
    [parameter(Mandatory)]
    [string]$OrganizationName
    )

    try{
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name RegisteredOwner -Value $UserName
        }
    catch{
        New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name RegisteredOwner -Value $UserName
        }

    try{
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name RegisteredOrganization -Value $OrganizationName
        }
    catch{
        New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name RegisteredOrganization -Value $OrganizationName
        }

    }