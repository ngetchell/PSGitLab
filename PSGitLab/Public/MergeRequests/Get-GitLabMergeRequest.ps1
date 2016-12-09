Function Get-GitLabMergeRequest {
<#
.SYNOPSIS
Retrieves all of the different merge requests for a project in a GitLab instance.
.DESCRIPTION
Retrieves all of the different merge requests for a project in a GitLab instance. Queries over HTTP and returns GitLab.MergeRequest type.
.EXAMPLE
# list all merge requests for the project 1
Get-GitLabMergeRequest -ProjectId 1

# list a specific merge request from the id for the project 1
Get-GitLabMergeRequest -ProjectId 1 -Id 20
.PARAMETER ProjectID
The ID of a project
.PARAMETER ID
The ID of the merge request your retrieving.
.PARAMETER iid
Return the request having the given iid.
.PARAMETER State
Return all requests or just those that are merged, opened or closed.
.PARAMETER OrderBy
Return requests ordered by created_at or updated_at fields. Default is created_at.
.PARAMETER Sort
Return requests sorted in asc or desc order. Default is desc.
#>
[cmdletbinding(DefaultParameterSetName='MergeRequests')]
[OutputType('GitLab.MergeRequest')]
param (
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Single',Mandatory)]
    [Parameter(ParameterSetName='MergeRequests',Mandatory)]
    [string]$ProjectId,

    [Parameter(ParameterSetName='Single',Mandatory)]
    [string]$Id,

    [Parameter(ParameterSetName='MergeRequests')]
    # merge request iid
    [string]$Iid,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: all, merged, opened, closed
    [string]$State,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: created_at (default) and updated_at 
    [string]$OrderBy,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: asc and desc (default)
    [string]$Sort
    
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
        if ($OrderBy) {
            $GetUrlParameters += @{order_by=$OrderBy}
        }
        if ($Sort) {
            $GetUrlParameters += @{sort=$Sort}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
    }


    $Request = @{
        URI = ''
        Method = 'GET'
    }

    Write-Verbose "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        MergeRequests { $Request.URI="/projects/$($Project.id)/merge_requests$URLParameters"; break; }
        Single { $Request.URI="/projects/$($Project.id)/merge_requests/$Id"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'
}
