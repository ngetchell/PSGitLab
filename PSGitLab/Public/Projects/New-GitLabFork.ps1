Function New-GitLabFork {
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

    $Project = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $Project = Get-GitlabSingleProject -Id $Id }
        'Namespace' { $Project = Get-GitlabSingleProject -Namespace $Namespace }
    }

    $Request = @{
        URI="/projects/fork/$($Project.id)";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'
}
