Function New-GitLabMergeRequest {
    <#
    .SYNOPSIS
    Creates a new merge request. Uses the user namespace. 
    .DESCRIPTION
    Creates a new merge request. Uses the user namespace. This uses the v3 GitLab API.  
    .EXAMPLE
    New-GitLabMergeRequest -ProjectId 8 -SourceBranch issue-1234 -TargetBranch master -Title "WIP: issue 1234"
    .PARAMETER ProjectID
    The ID of a project.
    .PARAMETER SourceBranch
    The source branch.
    .PARAMETER TargetBranch
    The target branch. 
    .PARAMETER AssigneeId
    Assignee user ID.
    .PARAMETER Title
    Title of the merge request.
    .PARAMETER Description
    Description of the merge request.
    .PARAMETER TargetProjectID
    The target project (numeric id).
    .PARAMETER Labels
    Labels for MR as a comma-separated list.
    .PARAMETER MilestoneID
    Milestone ID.
    #>
    [cmdletbinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$ProjectId,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$SourceBranch,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$TargetBranch,
        
        [int]$AssigneeId,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$Title,

        [string]$Description,

        [string]$TargetProjectId,

        [string]$Labels,

        [string]$MilestoneId
    )

    $Project = $Project = Get-GitlabProject -Id $ProjectId;

    $GetUrlParameters = @()
    $GetUrlParameters += @{source_branch=$SourceBranch}
    $GetUrlParameters += @{target_branch=$TargetBranch}
    $GetUrlParameters += @{title=$Title}

    if ($AssigneeId) {
        $GetUrlParameters += @{assignee_id=$AssigneeId}
    }
    if ($Description) {
        $GetUrlParameters += @{description=$Description}
    }
    if ($TargetProjectId) {
        $GetUrlParameters += @{target_project_id=$TargetProjectId}
    }
    if ($Labels) {
        $GetUrlParameters += @{labels=$Labels}
    }
    if ($MilestoneId) {
        $GetUrlParameters += @{milestone_id=$MilestoneId}
    }

    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

    $Request = @{
        URI="/projects/$($Project.id)/merge_requests$URLParameters";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'
}
