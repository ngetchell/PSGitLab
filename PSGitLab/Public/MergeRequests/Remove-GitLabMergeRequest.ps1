Function Remove-GitLabMergeRequest {
<#
.SYNOPSIS
Deletes a GitLab merge request from project.
.DESCRIPTION
Deletes a GitLab merge request from project. Can only be done by ID. Supports should process.
.EXAMPLE
Remove-GitLabMergeRequest -ProjectId 8 -Id 99
#>
[cmdletbinding(SupportsShouldProcess,ConfirmImpact='High')]
param(
    [Alias('project_id')]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [string]$ProjectId,

    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [string]$Id
)
    BEGIN {}

    PROCESS {
        $Project = $Project = Get-GitlabProject -Id $ProjectId;
        
        $Request = @{
            URI="/projects/$($Project.id)/merge_requests/$Id";
            Method='Delete';
        }

        $MergeRequest = Get-GitLabMergeRequest -Project $ProjectId -Id $Id

        if ($PSCmdlet.ShouldProcess($MergeRequest.Title, 'Delete Merge Request')) {
            $Worked = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'
        }

    }

    END {}
}
