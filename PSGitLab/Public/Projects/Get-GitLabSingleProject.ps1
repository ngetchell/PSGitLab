Function Get-GitlabSingleProject {
[cmdletbinding()]
param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Id')]
    [string]$Id,

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Namespace')]
    [string]$Namespace
)

    $queryID = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $queryID = $id }
        'Namespace' { $queryID = $Namespace -replace '/','%2F' -replace ' ','' }
    }

    $Request = @{
        URI="/projects/$queryID";
        Method='Get';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'


}
