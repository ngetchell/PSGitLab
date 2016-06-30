Function Get-GitlabSingleProject {
<#
.SYNOPSIS
Gets only one of the projects associated with a GitLab domain. 
.DESCRIPTION
Gets onyl one of the projects associated with a GitLab domain. Only returns projects you have access to. This uses the v3 GitLab API.  
.EXAMPLE
Get-GitLabSingleProject -Id 39
id                  : 39
name                : Chef
name_with_namespace : HomeLab / Chef
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
