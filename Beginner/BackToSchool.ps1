## Iron Scripter Challenge https://ironscripter.us/powershell-back-to-school-scripting-challenge/

# to do
# error checking/input validation
# configure as module w/ manifest

# given two lengths of a right triangle (a, b, and c) calculate the missing length
function SolveFor-Triangle{
    param(
        [parameter()]
        [int]$a,
        [parameter()]
        [int]$b,
        [parameter()]
        [int]$c
    )

    if($a -and $b -and $c){
        Throw "Too many sides provided. Only provide two lengths."
        }

    if($a -and $b){
        $newa = $a
        $newb = $b
        $newc = [Math]::Round([Math]::Sqrt(($a*$a) + ($b*$b)),2)
        }
    elseif($a -and $c){
        $newa = $a
        $newc = $c
        $newb = [Math]::Round([Math]::Sqrt(($c*$c) - ($a*$a)),2)
        }
    elseif($b -and $c){
        $newb = $b
        $newc = $c
        $newa = [Math]::Round([Math]::Sqrt(($c*$c) - ($b*$b)),2)
        }
    else{
        write-host "what did you do to get here??"
        }

    $fullTriangle = [PSCustomObject]@{
        A = $newa
        B = $newb
        C = $newc
        }

    return $fullTriangle
    }

# calculate area of a circle given diameter
function Calculate-CircleArea{
    Param(
        [parameter(Mandatory)]
        [int]$diameter
    )

    $radius = $diameter/2
    $area = [math]::Round([math]::pi*($radius*$radius),2)

    $fullCircle = [PsCustomObject]@{
        Diameter = $diameter
        Radius = $radius
        Area = $area
        }

    return $fullCircle
    }

# calculate volume of sphere given diameter
function Calculate-SphereVolume{
    Param(
        [parameter(Mandatory)]
        [int]$diameter
    )

    $radius = $diameter/2
    $volume = [math]::Round([math]::pi*($radius*$radius*$radius)*(4/3),2)

    $fullSphere = [PsCustomObject]@{
        Diameter = $diameter
        Radius = $radius
        Volume = $volume
        }

    return $fullSphere
    }

# calculate volume of cylinder given diameter and height
function Calculate-CylinderVolume{
    Param(
        [parameter(Mandatory)]
        [int]$diameter,
        [parameter(Mandatory)]
        [int]$height
    )

    $radius = $diameter/2
    $volume = [math]::Round([math]::pi*($radius*$radius)*($height),2)

    $fullCylinder = [PsCustomObject]@{
        Diameter = $diameter
        Radius = $radius
        Height = $height
        Volume = $volume
        }

    return $fullCylinder
    }

# calculate factorial of integer
function Calculate-Factorial{
    Param(
        [parameter(Mandatory)]
        [int]$integer
    )

    $total = 1
    1..$integer | % {$total = $total * $_}

    return $total
    }