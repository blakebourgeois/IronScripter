## Iron Scripter Challenge https://ironscripter.us/a-powershell-counting-challenge/

#method 1
$count = 0
$total = 0
while($count -lt 100){
    if($count%2 -eq 0){
        $total += $count
        }
    $count++
    }
$total

#method2
$count = 0
$total = 0
while($count -lt 100){
    $total += $count
    $count = $count + 2
    }
$total

#method3????
$count = 0
$total = 0
while($count -lt 100){
    $digit = $count.ToString()[$count.ToString().Length - 1]
    if(($digit -eq "0") -or ($digit -eq "2") -or ($digit -eq "4") -or ($digit -eq "6") -or ($digit -eq "8")){
        $total += $count
        }
    $count++
    }
$total

#intermediate
#function to get sum and average of every X number between 1 and user supplied max

function Get-IntervalMath{
    param(
    [parameter(
    Mandatory = $true)]
    [int]
    $interval,
    [parameter(
    Mandatory = $true)]
    [int]
    $maximum
    )

    $count = 1
    $avgCount = 0
    $total = 0

    while($count -lt $maximum){
        if($count % $interval -eq 0){
            $avgCount++
            $total += $count
            }
        $count++
        }

    $avg = $total/$avgCount

    write-host "Total: $total"
    write-host "Avg: $avg"
    }

#advanced
#limit the interval between 1 and 10
# property that includes every matching number
# specify start and stop

function Get-AdvancedIntervalMath{
    param(
    [parameter(
    Mandatory = $true)]
    [int]
    $interval,
    [parameter(
    Mandatory = $true)]
    [int]
    $startFrom,
    [parameter(
    Mandatory = $true)]
    [int]
    $endAt
    )

    if(($interval -lt 1) -or ($interval -gt 10)){
        Throw "$($interval) is outside the acceptable range of 1-10."
        }

    $count = $startFrom
    $avgCount = 0
    $total = 0
    $matches = @()

    while($count -lt $endAt){
        if($count % $interval -eq 0){
            $avgCount++
            $total += $count
            $matches += $count
            }
        $count++
        }

    $avg = $total/$avgCount

    $outObject = [PSCustomObject]@{
        Total = $total
        Average = $avg
        Matches = $matches
        }

    return $outObject
    }