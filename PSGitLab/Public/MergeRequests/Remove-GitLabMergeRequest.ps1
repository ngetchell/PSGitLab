Function Remove-GitLabMergeRequest {
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
