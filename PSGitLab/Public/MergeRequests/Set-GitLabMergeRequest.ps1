Function Set-GitLabMergeRequest {
    [cmdletbinding()]
    param(
        [Alias('project_id')]
        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string]$ProjectId,

        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string[]]$ID,

        [string]$TargetBranch,

        [string]$AssigneeId,

        [string]$Title,

        [string]$Description,

        [ValidateSet("close", "reopen", "merge")]
        [string]$StateEvent,

        [string]$Labels,

        [string]$MilestoneId,

        [switch]$Passthru

    )

BEGIN {}

PROCESS {

    foreach ( $MergeRequestID in $ID ) {
        $Project = $Project = Get-GitlabProject -Id $ProjectId;

        $MergeRequest = Get-GitLabMergeRequest -ProjectId $ProjectId -Id $MergeRequestID

        Write-Verbose "Project Name: $($Project.Name), Merge Request Name: $($MergeRequest.Name)"

        $GetUrlParameters = @()

        if ($TargetBranch) {
            $GetUrlParameters += @{target_branch=$TargetBranch}
        }
        if ($AssigneeId) {
            $GetUrlParameters += @{assignee_id=$AssigneeId}
        }
        if ($Title) {
            $GetUrlParameters += @{title=$Title}
        }
        if ($Description) {
            $GetUrlParameters += @{description=$Description}
        }
        if ($StateEvent) {
            $GetUrlParameters += @{state_event=$StateEvent}
        }
        if ($Labels) {
            $GetUrlParameters += @{labels=$Labels}
        }
        if ($MilestoneId) {
            $GetUrlParameters += @{milestone_id=$MilestoneId}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

        $Request = @{
            URI = "/projects/$($Project.ID)/merge_requests/$($MergeRequest.ID)$URLParameters"
            Method = 'PUT'
        }

        $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'

        if ( $Passthru.isPresent ) {
            $Results
        }
    }
}

END {}

}
