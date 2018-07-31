Function Get-GitLabUserKey {

    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.User.Key')]
    param(
        [Parameter(ParameterSetName='All')]
        [switch]$All,

        [Parameter(ParameterSetName='Key')]
        [int]$Key,

        [Parameter(ParameterSetName='Username')]
        [string]$Username,

        [Parameter(ParameterSetName='UserID')]
        [int]$UserId

    )

    $Request = @{
        URI="";
        Method='Get';
    }

    if ( $PSCmdlet.ParameterSetName -eq 'Username' ) {
        $UserID = Get-GitLabUser -Username $Username | Select-Object -ExpandProperty Id -First 1
    }

    switch ( $PSCmdlet.ParameterSetName) {
        'Key' { $Request.URI = "/user/keys/$Key" }
        'All' { $Request.URI = "/user/keys/" }
        'Username' { $Request.URI = "/users/$UserID/keys" }
        'UserID' { $Request.URI = "/users/$UserID/keys" }
    }


    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User.Key'
}
