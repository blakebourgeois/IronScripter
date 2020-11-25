## Iron Scripter Challenge https://ironscripter.us/a-powershell-scripting-challenge-for-everyone/

## TO DO ##
# Swap read-host to path from pipeline (intermediate)
# Accept parameter for remote computer name with creds, accept multiple paths, run as a background job. Allow user to specify job name (advanced)

function Get-PathDetails{
    
    # get path from user
    $path = Read-Host "Enter Path"

    # validate the path exists
    if(get-item $path){
        # get recurvively get files from directory
        $files = gci $path -Recurse

        # count the files
        $filecount = ($files | Measure-Object).count
        $size = 0

        # add up all the file lengths
        foreach($file in $files){
            $size += $file.length
            }

        # make the size and average pretty
        $size = $size/1MB
        $size = [math]::Round($size,2)
        $avg = [math]::Round($size/$filecount,2)
        $date = get-date -f "yyyy-MM-dd"

        # output
        write-host "There are $filecount files in the path, totaling $size MB with an average of $avg MB per file. This command was run on" $env:COMPUTERNAME "on $date"
    }
    else{
        # error handling for non-existent path
        Write-Host "That path doesn't exist." -foregroundcolor Red
        }
}
