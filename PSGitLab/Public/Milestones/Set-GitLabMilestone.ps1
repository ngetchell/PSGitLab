Function Set-GitLabMilestone {
    <#
    .SYNOPSIS
    Modify your GitLab milestone.
    .DESCRIPTION
    Modify your GitLab milestone. Useful for changing the names or other parameter of your milestone. 
    .EXAMPLE
    Set-GitLabMilestone -ProjectId 8 -Id 32 -Name "NewName"
    .EXAMPLE
    Get-GitLabMilestone -ProjectId 8 | Set-GitLabMilestone -Description 'Fake Description' 
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

        [string]$Title = $null,

        [string]$Description = $null,

        [Nullable[datetime]]$DueDate = $null,

        [Alias('state_event')]
        [ValidateSet("close", "activate")]
        [string]$StateEvent = $null
    )

BEGIN {} 

PROCESS {

    foreach ( $MilestoneID in $ID ) {
        $Project = $Project = Get-GitlabProject -Id $ProjectId;

        $Milestone = Get-GitLabMilestone -ProjectId $ProjectId -Id $MilestoneID

        Write-Verbose "Project Name: $($Project.Name), Milestone Name: $($Milestone.Name)"

        $GetUrlParameters = @()

        if ($Title -ne $null) {
            $GetUrlParameters += @{title=$Title}
        }
        if ($Description -ne $null) {
            $GetUrlParameters += @{description=$Description}
        }
        if ($DueDate -ne $null) {
            $GetUrlParameters += @{due_date=$DueDate.ToString("yyyy-MM-dd")}
        }
        if ($StateEvent -ne $null) {
            $GetUrlParameters += @{state_event=$StateEvent}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

        $Request = @{
            URI = "/projects/$($Project.ID)/milestones/$($Milestone.ID)$URLParameters"
            Method = 'PUT'
        }

        $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Milestone'

        if ( $Passthru.isPresent ) {
            $Results
        }
    }
}

END {}

}