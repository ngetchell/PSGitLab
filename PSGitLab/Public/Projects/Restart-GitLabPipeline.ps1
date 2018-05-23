Function Restart-GitLabPipeline {
    [OutputType("GitLab.Project.Pipeline")]
    param(    

        [Parameter(Mandatory=$true)]
        [int]$ProjectID,

        [Parameter(Mandatory=$true)]
        [int]$Id

    )    

    $Request = @{
        URI = ''
        Method = 'GET'
    }

    $Project = Get-GitlabProject -Id $ProjectId

    $Pipeline = Get-GitLabPipeline -Id $ProjectID -Id $Id

    if (@('running', 'pending') -contains $Pipeline.status ) {

        Write-Warning -Message "The status for the pipeline $Id is $PipelineId so it can't be canceled."

    }
    else {

        $Request.URI= "/projects/$($Project.id)/pipelines/$Id/retry"

        Write-Verbose -Message "A prepared API request: $($($Request.URI).ToString())"

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Pipeline'

    }

}
