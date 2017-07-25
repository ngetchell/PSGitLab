Function Get-GitLabGroup {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.Group')]
    param(
        [Parameter(ParameterSetName='ID')]
        $GroupID,

        [Parameter(ParameterSetName='Search')]
        $Search,

        [Parameter(ParameterSetName='All')]
        [switch]$All
    )

    $Request = @{
        URI = '/groups'
        Method = 'GET'
    }

    if ( $PSBoundParameters.ContainsKey('GroupID') ) {
        $Request.URI = '/groups/{0}' -f $GroupID
    }

    if ( $PSBoundParameters.ContainsKey('Search') ) {
        $Request.URI = '/groups?search={0}' -f $Search
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'

}