## Iron Scripter Challenge https://ironscripter.us/a-windows-feature-powershell-challenge/

##TO DO##
# multiple features through pipeline
# incorporate whatif
# incorporate logging
# improve error handling
# configure to run on multiple remote computers
# autocomplete feature names

function Manage-MyFeatures{
    Param(
        [Parameter(Mandatory=$true)]
        [String]
        $myFeature,

        [Parameter(Mandatory=$true)]
        [boolean]
        $enable
    )
    
    $feature = Get-WindowsOptionalFeature -Online -FeatureName $myFeature
    
    if($enable -eq $true){
        if($feature.State -eq "Enabled"){
            write-host "This feature is already enabled."  
            }
        else{
            Enable-WindowsOptionalFeature -Online -FeatureName $myFeature
            }
        }
    if($enable -eq $false){
        if($feature.State -eq "Disabled"){
            write-host "This feature is already disabled."
            }
        else{
            Disable-WindowsOptionalFeature -Online -FeatureName $myFeature
            }
        }
    }