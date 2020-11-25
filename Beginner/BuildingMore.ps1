## Iron Scripter Challenge https://ironscripter.us/building-more-powershell/

## TO DO ##
# progress bar for folders
# display hidden files separately
# exclude file extensions
# custom type extension for size/average in kb
# module: maml based external help file
# custom formatting view that shows computername, path, total files, total file size in KB, date

function Get-PathDetails{
    
    # get path from user
    $path = Read-Host "Enter Path"

    # validate the path exists
    if(get-item $path){
        # get recurvively get files from directory
        $files = gci $path -Recurse -Force

        # count the files
        $filecount = ($files | Measure-Object).count
        $size = 0

        # add up all the file lengths
        foreach($file in $files){
            $size += $file.length
            }

        # make the size and average pretty
        ## modified from MB to KB as per challenge
        $size = $size/1KB
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

Set-Alias -Name IronScripter1 -Vaule Get-PathDetails