$ConfigurationPath = $Env:AppData
$CommandPath = split-path $PSCommandPath -Parent

Function Save-GitLabAPIConfiguration {
<#
.Synopsis
   Used to store information about your GitLab instance. 
.DESCRIPTION
   Used to store information about your GitLab instance. The domain and api token are given. 
.EXAMPLE
   Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "Token"
.NOTES
   Implemented using Export-CLIXML saving the configurations. Stores .xml in $env:appdata\GitLabAPI\
#>
[cmdletbinding()]
param(
    [Parameter(mandatory=$true)]
    [ValidateNotNullOrEmpty()]    
    $Token,

    [Parameter(mandatory=$true,
               HelpMessage="Please provide a URI to the GitLab installation")]
    [ValidateNotNullOrEmpty()]  
    [ValidatePattern("^(?:http|https):\/\/(?:[\w\.\-\+]+:{0,1}[\w\.\-\+]*@)?(?:[a-z0-9\-\.]+)(?::[0-9]+)?(?:\/|\/(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+)|\?(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+))?$")]  
    $Domain 
)

    $Parameters = @{
        Token=$Token;
        Domain=$Domain;
    }
    $ConfigPath = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
    if (-not (Test-Path (Split-Path $ConfigPath))) {
        New-Item -ItemType Directory -Path (Split-Path $ConfigPath) | Out-Null
        
    }
    $Parameters | Export-Clixml -Path $ConfigPath
}
