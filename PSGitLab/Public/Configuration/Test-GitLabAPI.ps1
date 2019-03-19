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
    
    try {
        #https://docs.microsoft.com/en-us/dotnet/api/system.net.securityprotocoltype?view=netcore-2.0#System_Net_SecurityProtocolType_SystemDefault
        if ($PSVersionTable.PSVersion.Major -lt 6 -and [Net.ServicePointManager]::SecurityProtocol -notmatch 'Tls12') {
            [Net.ServicePointManager]::SecurityProtocol += [Net.SecurityProtocolType]::Tls12
        }
    }
    catch {
        Write-Warning -Message 'Adding TLS 1.2 to supported security protocols was unsuccessful.'
    }

    $Result = Invoke-WebRequest -UseBasicParsing -Uri "$Domain/api/$Version/projects?private_token=$Token"
    Remove-Variable Token
    GetGitLabStatusCode $Result.StatusCode
}
