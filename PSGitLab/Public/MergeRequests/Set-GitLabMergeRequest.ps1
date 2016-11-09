Function Set-GitLabMergeRequest 
{
    <#
    .SYNOPSIS
    Modify your GitLab merge requests.
    .DESCRIPTION
    Modify your GitLab merge requests. Useful for changing the names or changing the visibility of your project. 
    .EXAMPLE
    Set-GitLabMergeRequest -ProjectId 8 -Id 32 -Name "NewName"
    .EXAMPLE
    Get-GitLabMergeReqeust -ProjectId 8 | Set-GitLabMergeReqeust -ProjectId 8 -Description 'Fake Description' 
    #>
    [cmdletbinding()]
    param(
        [Alias('project_id')]
        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string]$ProjectId,

        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string[]]$ID,

        [string]$TargetBranch = $null,

        [string]$AssigneeId = $null,

        [string]$Title = $null,

        [string]$Description = $null,

        [ValidateSet("close", "reopen", "merge")]
        [string]$StateEvent = $null,

        [string]$Labels = $null,

        [string]$MilestoneId = $null,

        [switch]$Passthru

    )

BEGIN {} 

PROCESS {

    foreach ( $MergeRequestID in $ID ) {
        $Project = $Project = Get-GitlabProject -Id $ProjectId;

        $MergeRequest = Get-GitLabMergeRequest -ProjectId $ProjectId -Id $MergeRequestID

        Write-Verbose "Project Name: $($Project.Name), Merge Request Name: $($MergeRequest.Name)"

        $GetUrlParameters = @()

        if ($TargetBranch -ne $null) {
            $GetUrlParameters += @{target_branch=$TargetBranch}
        }
        if ($AssigneeId -ne $null) {
            $GetUrlParameters += @{assignee_id=$AssigneeId}
        }
        if ($Title -ne $null) {
            $GetUrlParameters += @{title=$Title}
        }
        if ($Description -ne $null) {
            $GetUrlParameters += @{description=$Description}
        }
        if ($StateEvent -ne $null) {
            $GetUrlParameters += @{state_event=$StateEvent}
        }
        if ($Labels -ne $null) {
            $GetUrlParameters += @{labels=$Labels}
        }
        if ($MilestoneId -ne $null) {
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