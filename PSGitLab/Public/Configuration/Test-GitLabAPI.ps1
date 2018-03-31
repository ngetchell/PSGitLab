Function Test-GitLabAPI {
    param(
    [Parameter(Mandatory=$false)]
    [string]$Version = 'v3'
)
    $GitLabConfig = ImportConfig

    if ($GitLabConfig.APIVersion) { $Version = "v$($GitLabConfig.APIVersion)" }

    $Domain = $GitLabConfig.Domain

    if ( $isWindows -or ( [version]$PSVersionTable.PSVersion -lt [version]"5.99.0") ) {

        $Token = DecryptString -Token $GitLabConfig.Token
    } elseif ( $isLinux  -or $IsMacOS ) {
        $Token = $GitLabConfig.Token
    }
    
    $Result = Invoke-WebRequest -UseBasicParsing -Uri "$Domain/api/$Version/projects?private_token=$Token"
    Remove-Variable Token
    GetGitLabStatusCode $Result.StatusCode
}