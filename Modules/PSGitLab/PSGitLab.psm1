$ConfigurationPath = $Env:AppData
$CommandPath = split-path $PSCommandPath -Parent

Function Save-GitLabAPIConfiguration {
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
