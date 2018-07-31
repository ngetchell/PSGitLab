Function Stop-GitLabPipeline {
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

    Write-Verbose -Message "Stoping a pipeline for the project $($Project.Name) and id $($Project.Id)"

    $Pipeline = Get-GitLabPipeline -Id $ProjectID -Id $Id

    if (@('running', 'pending') -contains $Pipeline.status ) {

        $Request.URI= "/projects/$($Project.id)/pipelines/$Id/cancel"

        Write-Verbose -Message "A prepared API request: $($($Request.URI).ToString())"

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Pipeline'

    }
    else {

        Write-Warning -Message "The status for the pipeline $Id is $PipelineId so it can't be canceled."

    }

}
