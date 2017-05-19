$Domain = 'http://10.1.1.83'
Function Get-GitlabUserPrivateToken {
    [cmdletbinding()]
    param(
        $Username,

        $Password
    )

    $URI = "$Domain/api/v4/session?login=$Username&password=$Password"
    
    Invoke-RestMethod -URI $URI -Method POST | 
        Select-Object -ExpandProperty Private_Token
}

$PrivateToken = Get-GitlabUserPrivateToken -Username root -Password gitlab1234
Save-GitLabAPIConfiguration -Domain $Domain -Token $PrivateToken
