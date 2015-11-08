Function ImportConfig {
<#
.Synopsis
   Check for configuration and output the information.
.DESCRIPTION
   Check for configuration and output the information. Goes into the $env:appdata for the configuration file.
.EXAMPLE
    ImportConfig
#>
$ConfigFile = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
if (Test-Path $ConfigFile) {
    Import-Clixml $ConfigFile

} else {
    Write-Warning 'No Saved Configration Information. Run Save-GitLabAPIConfiguration.'
    break;
}
}
