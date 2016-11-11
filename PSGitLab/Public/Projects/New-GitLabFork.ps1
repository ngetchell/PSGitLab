Function New-GitLabFork {
    <#
    .SYNOPSIS
    Creates a new fork from a project. Uses the user namespace. 
    .DESCRIPTION
    Creates a new fork from a project. Uses the user namespace. This uses the v3 GitLab API.  
    .EXAMPLE
    New-GitLabFork -Id 39
    id                  : 99
    name                : Chef
    name_with_namespace : ngetchell / Chef
    web_url             : http://example.com/HomeLab/Chef
    created_at          : 2016-02-01T23:55:26.696Z
    last_activity_at    : 2016-04-24T18:42:58.529Z
    #>
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(ParameterSetName='Id')]
        [string]$Id,

        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        #[Parameter(ParameterSetName='Namespace')]
        [string]$Namespace
    )

    $Project = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $Project = Get-GitLabProject -Id $Id }
        'Namespace' { $Project = Get-GitLabProject -Namespace $Namespace }
    }

    $Request = @{
        URI="/projects/fork/$($Project.id)";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'
}
