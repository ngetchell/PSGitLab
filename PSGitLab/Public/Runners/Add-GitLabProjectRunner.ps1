Function Add-GitLabProjectRunner {
    param(
        [Parameter(Mandatory=$true)]
        [int]$RunnerId,
        
        [Parameter(Mandatory=$true)]
        [int]$ProjectId)
        
    $Body = @{
        runner_id  = $RunnerId
    }

    $Request = @{
        URI="/projects/$ProjectId/runners";
        Method='POST';
        Body=$Body;
        ContentType='application/x-www-form-urlencoded';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}