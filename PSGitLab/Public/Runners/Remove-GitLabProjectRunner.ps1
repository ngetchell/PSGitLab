Function Remove-GitLabProjectRunner {
    param(
        [Parameter(Mandatory=$true)]
        [int]$RunnerId,
        
        [Parameter(Mandatory=$true)]
        [int]$ProjectId)

    $Request = @{
        URI="/projects/$ProjectId/runners/$RunnerId";
        Method='DELETE';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}