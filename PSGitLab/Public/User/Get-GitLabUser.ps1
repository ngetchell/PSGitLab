Function Get-GitLabUser {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.User')]
    param(
        [Parameter(ParameterSetName='ID')]
        [string]$ID,

        [Parameter(ParameterSetName='All')]
        [switch]$All,

        [Parameter(ParameterSetName='Username')]
        [string]$Username,

        [Parameter(ParameterSetName='Email')]
        [string]$Email,

        [Parameter(ParameterSetName='CurrentUser')]
        [switch]$CurrentUser
    )
    $Request = @{
        URI = '/users'
        Method = 'GET'
    }

    switch ( $PSCmdlet.ParameterSetName) {
        'ID' { $Request.URI = "/users/$ID" }
        'All' { $Request.URI = '/users' }
        'CurrentUser' { $Request.URI = '/user' }
    }

    if ( $PSCmdlet.ParameterSetName -eq 'Username') {

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User' | where-object { $_.username -eq $Username }

    } elseif ( $PSCmdlet.ParameterSetName -eq 'Email') {

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User' | where-object { $_.email -eq $email }

    } else {

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
    }
}
