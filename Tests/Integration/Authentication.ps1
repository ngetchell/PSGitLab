$Domain = 'http://gitlab:5000'

if ( -not ( Get-Variable -Name GitLabCredential -ErrorAction SilentlyContinue ) ) {
    $GitlabCredential = Get-Credential
}

Function Get-GitlabUserPrivateToken {
    [cmdletbinding()]
    param(
        $GitlabCredential
    )

    $URI = "$Domain/api/v4/session?login={0}&password={1}" -f $GitlabCredential.UserName, $GitlabCredential.GetNetworkCredential().Password
    
    Invoke-RestMethod -URI $URI -Method POST | 
        Select-Object -ExpandProperty Private_Token
}

$PrivateToken = Get-GitlabUserPrivateToken -GitlabCredential $GitlabCredential
Save-GitLabAPIConfiguration -Domain $Domain -Token $PrivateToken
