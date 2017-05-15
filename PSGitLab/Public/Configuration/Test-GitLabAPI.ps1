Function Test-GitLabAPI {
    param(
    [Parameter(Mandatory=$false)]
    [string]$Version = 'v3'
)
    $GitLabConfig = ImportConfig
    $Domain = $GitLabConfig.Domain
    $Token = DecryptString -Token $GitLabConfig.Token
    
    $Result = Invoke-WebRequest -UseBasicParsing -Uri "$Domain/api/$Version/projects?private_token=$Token"
    Remove-Variable Token
    GetGitLabStatusCode $Result.StatusCode
}