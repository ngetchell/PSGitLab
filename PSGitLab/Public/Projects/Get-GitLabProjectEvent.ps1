Function Get-GitLabProjectEvent {
<#
.SYNOPSIS
Gets all of the project events.  
.DESCRIPTION
Gets all of the project events. This uses the v3 GitLab API. 
.EXAMPLE
Get-GitLabProjectEvent
title           : 
project_id      : 62
action_name     : pushed to
target_id       : 
target_type     : 
author_id       : 2
.PARAMETER Id
The ID or NAMESPACE/PROJECT_NAME of the project.
.PARAMETER Namespace
The namespace of the project.
#>    
[cmdletbinding()]
[OutputType('GitLab.Project.Event')]
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
        URI="/projects/$queryID/events";
        Method='Get';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Event'


}
