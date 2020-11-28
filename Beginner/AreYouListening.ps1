## Iron Scripter Challenge https://ironscripter.us/are-you-listening-to-me/

## TO DO

# advanced
# formatted table view grouped by computer name?

# property with txt note about the port (DNS, FTP, etc)
# parameter to resolve remote IP to hostname
#    ehhh this is implemented but it's disgusting
# formatted view groups by local port or remote address

function Get-LocalConnectionInfo{
    Param(
    [switch]$resolveAddresses
    )
    # getting current connections
    $connections = Get-NetTCPConnection

    # checking current IP addresses
    $ipaddresses = $connections.LocalAddress | Sort-Object | Get-Unique 

    # cleaning up IP addresses by removing loopbacks
    [System.Collections.ArrayList]$extaddresses = $ipaddresses
    foreach($ip in $ipaddresses){
        if(($ip -eq "0.0.0.0") -or ($ip -eq "::") -or ($ip -eq "127.0.0.1") -or ($ip -like "fe80*")){
            $extaddresses.Remove($ip)
            }
        }

    foreach($connection in $connections){
        if($extaddresses.Contains($connection.localaddress)){
            if($resolveAddresses -eq $true){
                $connection | select @{Name='ComputerName';Expression={$env:COMPUTERNAME}},localaddress,localport,remoteaddress,remoteport,@{Name='ResolvedAddress';Expression={(Resolve-DnsName $_.RemoteAddress).NameHost}},state,owningprocess,@{Name='ProcessName';Expression={(Get-Process -ID $_.OwningProcess).ProcessName}},@{Name='ProcessPath';Expression={(Get-Process -ID $_.OwningProcess).Path}},@{Name='ProcessOwner';Expression={(Get-Process -ID $_.OwningProcess -includeusername).UserName}},creationtime,@{Name='ConnectionLength';Expression={((get-date) - $_.CreationTime).ToString("dd\:hh\:mm\:ss")}}
                }
            else{
                $connection | select @{Name='ComputerName';Expression={$env:COMPUTERNAME}},localaddress,localport,remoteaddress,remoteport,state,owningprocess,@{Name='ProcessName';Expression={(Get-Process -ID $_.OwningProcess).ProcessName}},@{Name='ProcessPath';Expression={(Get-Process -ID $_.OwningProcess).Path}},@{Name='ProcessOwner';Expression={(Get-Process -ID $_.OwningProcess -includeusername).UserName}},creationtime,@{Name='ConnectionLength';Expression={((get-date) - $_.CreationTime).ToString("dd\:hh\:mm\:ss")}}

                }
            }
        }
}