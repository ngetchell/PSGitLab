# Author: Nicholas M. Getchell
# Original: Warren Frame
# Original Link: https://github.com/RamblingCookieMonster/PSStackExchange/blob/master/PSStackExchange/PSStackExchange.psm1



# Get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.psm1 -ErrorAction SilentlyContinue | Add-Member -NotePropertyName Public -NotePropertyValue $true -PassThru )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.psm1 -ErrorAction SilentlyContinue | Add-Member -NotePropertyName Public -NotePropertyValue $false -PassThru)

$FunctionsToExport = @()
# Import Modules
foreach($import in @($Public + $Private)) {
    try {
        Import-Module $import.fullname
        if ($import.Public -or -not ($import.public)) {
            $FunctionsToExport += Get-Command -Module $import.basename | Select-Object -ExpandProperty Name
        }
    }
    catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Here I might...
    # Read in or create an initial config file and variable
    # Export Public functions ($Public.BaseName) for WIP modules
    # Set variables visible to the module and its functions only

Export-ModuleMember -Function $FunctionsToExport
