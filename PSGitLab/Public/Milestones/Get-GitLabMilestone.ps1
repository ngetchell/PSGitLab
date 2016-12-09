Function Get-GitLabMilestone {
<#
.SYNOPSIS
Retrieves all of the different milestones for a project in a GitLab instance.
.DESCRIPTION
Retrieves all of the different milestones for a project in a GitLab instance. Queries over HTTP and returns GitLab.MergeRequest type.
.EXAMPLE
# list all milestones for the project 1
Get-GitLabMilestone -ProjectId 1

# list a specific milestone from the id for the project 1
Get-GitLabMilestone -ProjectId 1 -Id 20
.PARAMETER ProjectId
The project ID.
.PARAMETER Id
The ID of the milestone.
.PARAMETER Iid
The exacty milestone Id.
.PARAMETER State
Return only active or closed milestones.
#>
[cmdletbinding(DefaultParameterSetName='MergeRequests')]
[OutputType('GitLab.Milestone')]
param (
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Single',Mandatory)]
    [Parameter(ParameterSetName='MergeRequests',Mandatory)]
    [string]$ProjectId,

    [Parameter(ParameterSetName='Single',Mandatory)]
    [string]$Id,

    [Parameter(ParameterSetName='MergeRequests')]
    # milestone iid
    [string]$Iid,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: active, closed
    [string]$State
    
)
    $Project = Get-GitlabProject -Id $ProjectId;
    
    if($PSCmdlet.ParameterSetName -ne 'Single') {
        $GetUrlParameters = @()

        if ($Iid) {
            $GetUrlParameters += @{iid=$Id}
        }
        if ($State) {
            $GetUrlParameters += @{state=$State}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
    }


    $Request = @{
        URI = ''
        Method = 'GET'
    }

    switch ($PSCmdlet.ParameterSetName) {
        MergeRequests { $Request.URI="/projects/$($Project.id)/milestones$URLParameters"; break; }
        Single { $Request.URI="/projects/$($Project.id)/milestones/$Id"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Milestone'
}
