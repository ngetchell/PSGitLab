Function Close-GitLabMilestone {
    <#
    .SYNOPSIS
    Closes your GitLab milestone.
    .DESCRIPTION
    Closes your GitLab milestone. 
    .EXAMPLE
    Close-GitLabMilestone -ProjectId 8 -Id 32 
    .PARAMETER ProjectID
    The project ID.
    .PARAMETER ID
    The ID of the milestone to be closed.
    .PARAMETER Passthru
    Return the closed milestone. 
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

        [switch]$Passthru
    )

BEGIN {}

PROCESS {

    foreach ( $MergeRequestID in $ID ) {
        $Results = Set-GitLabMilestone -Project $ProjectId -Id $ID -StateEvent close

        if ( $Passthru.isPresent ) {
            $Results
        }
    }
}

END {}

}