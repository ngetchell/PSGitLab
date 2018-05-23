Function Start-GitLabPipeline {
    [OutputType("GitLab.Project.Pipeline")]
    param(    

        [Parameter(Mandatory=$true)]
        [int]$ProjectID, 
        
        [Parameter(Mandatory=$true, ParameterSetName='ByBranch')]
        [String]$Branch,

        [Parameter(Mandatory=$true, ParameterSetName='ByTag')]
        [String]$Tag

    )    

    $Request = @{
        URI = ''
        Method = 'POST'
    }

    $Project = Get-GitlabProject -Id $ProjectId

    Write-Verbose -Message "Starting a pipeline for the project $($Project.Name) and id $($Project.Id)"

    if ($PSCmdlet.ParameterSetName -eq 'ByBranch') {
        $ref=$Branch
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'ByTag') {
        $ref=$Tag
    }

    $Request.URI= "/projects/$($Project.id)/pipeline/?ref=$ref"

    Write-Verbose -Message "A prepared API request: $($($Request.URI).ToString())"

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Pipeline'

}
