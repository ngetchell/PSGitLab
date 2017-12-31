Function Save-GitLabAPIConfiguration {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true,
               HelpMessage='You can find the token in your profile.',
               Position=0)]
    [ValidateNotNullOrEmpty()]
    $Token,

    [Parameter(Mandatory=$true,
               HelpMessage='Please provide a URI to the GitLab installation',
               Position=1)]
    [ValidateNotNullOrEmpty()]
    [ValidatePattern("^(?:http|https):\/\/(?:[\w\.\-\+]+:{0,1}[\w\.\-\+]*@)?(?:[a-z0-9\-\.]+)(?::[0-9]+)?(?:\/|\/(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+)|\?(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+))?$")]
    $Domain,

    $APIVersion = 3
)

if ( $Domain -match '^http:\/\/' ) {
    Write-Warning "All tokens will be sent over HTTP. Recommendation: Use HTTPS."
}

if ( $IsWindows -or ( [version]$PSVersionTable.PSVersion -lt [version]"5.99.0" ) ) {
    
    $Parameters = @{
        Token=(ConvertTo-SecureString -string $Token -AsPlainText -Force)
        Domain=$Domain;
        APIVersion=$APIVersion;
    }
    
    $ConfigFile = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"

} elseif ( $IsLinux ) {

    Write-Warning "Warning: Your GitLab token will be stored in plain-text on non-Windows platforms."

    $Parameters = @{
        Token=$Token
        Domain=$Domain;
        APIVersion=$APIVersion;
    }
    
    $ConfigFile = "{0}/.psgitlab/PSGitLabConfiguration.xml" -f $HOME

} else {
    Write-Error "Unknown Platform"
}
if (-not (Test-Path (Split-Path $ConfigFile))) {
    New-Item -ItemType Directory -Path (Split-Path $ConfigFile) | Out-Null

}
$Parameters | Export-Clixml -Path $ConfigFile
Remove-Variable Parameters
}
