## Iron Scripter Challenge https://ironscripter.us/a-powershell-word-play-challenge/

#$myString = "powershell practice"
$myString = ""

#beginner challenge
function ConvertTo-TotalAndString{
    param(
        [parameter(
        Mandatory = $true,
        ValueFromPipeline = $true)]
        $myString
    )

    $total = 0
    $myNewString = ""
    $count = 0
    while($count -lt $myString.Length){
        $charInt = [char]$myString[$count] -as [int]
        $total += $charInt
        $myNewString += [string]$charInt + " "
        $count++
        }

    $total
    $myNewString
    }

#advanced challenge
function ConvertTo-DoubledChar{
    param(
        [parameter(
        Mandatory = $true,
        ValueFromPipeline = $true)]
        $myString
    )

    $myNewString = ""
    $count = 0
    while($count -lt $myString.Length){
        $charInt = [char]$myString[$count] -as [int]
        $charInt = $charInt*2
        $myNewString += [char]$charInt
        $count++
        }

    return $myNewString
    }

function ConvertFrom-DoubledChar{
    param(
        [parameter(
        Mandatory = $true,
        ValueFromPipeline = $true)]
        $myString
    )

    $myNewString = ""
    $count = 0
    while($count -lt $myString.Length){
        $charInt = [char]$myString[$count] -as [int]
        $charInt = $charInt/2
        $myNewString += [char]$charInt
        $count++
        }

    return $myNewString
    }
