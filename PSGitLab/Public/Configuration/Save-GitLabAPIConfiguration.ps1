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
    $Domain
)

$Parameters = @{
    Token=(ConvertTo-SecureString -string $Token -AsPlainText -Force)
    Domain=$Domain;
}
$ConfigPath = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
if (-not (Test-Path (Split-Path $ConfigPath))) {
    New-Item -ItemType Directory -Path (Split-Path $ConfigPath) | Out-Null

}
$Parameters | Export-Clixml -Path $ConfigPath
Remove-Variable Parameters
}
