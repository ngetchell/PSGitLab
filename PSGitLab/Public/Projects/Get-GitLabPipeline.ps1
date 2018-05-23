Function Get-GitLabPipeline {
    [cmdletbinding(DefaultParameterSetName='Pipelines')]
    [OutputType("GitLab.Project.Pipeline")]
    param(    

        [Parameter(Mandatory=$true)]

        [int]$ProjectID,

        [Parameter(Mandatory=$true,ParameterSetName='Single')]
        [int]$Id,

        [Parameter(Mandatory=$false, ParameterSetName='ByBranch')]
        [Parameter(Mandatory=$false, ParameterSetName='ByTag')]
        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet("running","pending","finished","branches","tags","all")]
        $Scope = 'all',

        [Parameter(Mandatory=$false, ParameterSetName='ByBranch')]
        [Parameter(Mandatory=$false, ParameterSetName='ByTag')]
        [Parameter(Mandatory=$false, ParameterSetName='Pipelines')]
        [ValidateSet("running","pending","success","failed","canceled","skipped","all")]
        $Status = 'all',

        [Parameter(Mandatory=$true, ParameterSetName='ByBranch')]
        [String]$Branch,

        [Parameter(Mandatory=$true, ParameterSetName='ByTag')]
        [String]$Tag,

        [Parameter(Mandatory=$false, ParameterSetName='ByBranch')]
        [Parameter(Mandatory=$false, ParameterSetName='ByTag')]
        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet("id","status","ref","user_id")]
        $Order_by = "id",

        [Parameter(Mandatory=$false, ParameterSetName='ByBranch')]
        [Parameter(Mandatory=$false, ParameterSetName='ByTag')]
        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet('asc','desc')]
        $Sort = 'desc'       

    )    

    $Request = @{
        URI = ''
        Method = 'GET'
    }

    $Project = Get-GitlabProject -Id $ProjectId
    
    Write-Verbose -Message "Returning a pipeline(s) for the project $($Project.Name) and id $($Project.Id)"

    if ($PSCmdlet.ParameterSetName -ne 'Single') {

        $GetUrlParameters = @()

        if ($PSCmdlet.ParameterSetName -eq 'ByBranch') {
            $GetUrlParameters += @{ref=$Branch}
        }
        elseif ($PSCmdlet.ParameterSetName -eq 'ByTag') {
            $GetUrlParameters += @{ref=$Tag}
        }

        if ($Scope -ne 'all') {
            $GetUrlParameters += @{scope='all'}
        }

        if ($Status -ne 'all') {
            $GetUrlParameters += @{status=$Status}
        }

        $GetUrlParameters += @{order_by=$order_by}
        $GetUrlParameters += @{sort=$sort}
        $GetUrlParameters += @{per_page=100}
        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

    }

    Write-Verbose -Message "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        Pipelines { $Request.URI="/projects/$($Project.id)/pipelines$URLParameters"; break; }
        Single { $Request.URI= "/projects/$($Project.id)/pipelines/$($Id)"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    Write-Verbose -Message "A prepared API request: $($($Request.URI).ToString())"

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Pipeline' -Verbose

}
