Function New-GitLabMergeRequest {
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

        [string]$MilestoneId,

        [switch]$RemoveSourceBranch
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
    if ($RemoveSourceBranch) {
        $GetUrlParameters += @{remove_source_branch=$true}
    }

    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

    $Request = @{
        URI="/projects/$($Project.id)/merge_requests$URLParameters";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'
}
