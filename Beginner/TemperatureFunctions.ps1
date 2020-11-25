## Iron Scripter Challenge https://ironscripter.us/a-beginner-powershell-function-challenge/

function ConvertTo-Celcius($tempinF){
    $type = $tempinF.getType().Name
    if(($type -eq "Int32") -or ($type -eq "Double")){
        $tempinC = ($tempinF - 32)/1.8
        return $tempinC
        }
    else{
        Write-Host "Invalid number provided!" -ForegroundColor Red
        return $null
        }
    }

function ConvertTo-Fahrenheit($tempinC){
    $type = $tempinC.getType().Name
    if(($type -eq "Int32") -or ($type -eq "Double")){
        $tempinF = ($tempinC * 1.8) + 32
        return $tempinF
        }
    else{
        Write-Host "Invalid number provided!" -ForegroundColor Red
        return $null
        }
    }
