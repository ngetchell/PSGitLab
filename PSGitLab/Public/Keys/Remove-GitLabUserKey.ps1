Function Remove-GitLabUserKey {
    [cmdletbinding(SupportsShouldProcess=$true)]
    [OutputType('GitLab.User.Key')]
    param(
        [Parameter(ParameterSetName='Id',Mandatory=$true)]
        [Parameter(ParameterSetName='User',Mandatory=$true)]
        [string]$Id,

        [Parameter(ParameterSetName='User',Mandatory=$true)]
        [string]$Username,

        [switch]$Passthru

    )

    $Request = @{
        URI='';
        Method='DELETE';
    }

    switch ( $PSCmdlet.ParameterSetName ) {
        'User' {
            $UserId = (Get-GitLabUser -Username $Username).Id
            $Request.URI = "/users/$UserId/keys/$Id"
        }
        'Id' {
            $Request.URI = "/user/keys/$Id"
        }
    }


    if ( $PSCmdlet.ShouldProcess("Delete SSH Key $Id") ) {
        $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User.Key'
        if ( $Passthru ) {
            $Results
        }
    }
}
