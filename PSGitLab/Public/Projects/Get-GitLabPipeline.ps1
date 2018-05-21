Function Get-GitLabPipeline {
    [cmdletbinding(DefaultParameterSetName='Pipelines')]
    [OutputType("GitLab.Project.Pipeline")]
    param(    

        [Parameter(Mandatory=$true,ParameterSetName='Single')]
        [Parameter(Mandatory=$true,ParameterSetName='Pipelines')]
        [int]$ProjectID,

        [Parameter(ParameterSetName='Single',
                   Mandatory=$true)]
        [int]$Id,

        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet("running","pending","finished","branches","tags","all")]
        $Scope = 'all',

        [Parameter(Mandatory=$false, ParameterSetName='Pipelines')]
        [ValidateSet("running","pending","success","failed","canceled","skipped","all")]
        $Status = 'all',

        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet("id","status","ref","user_id")]
        $order_by = "id",

        [Parameter(Mandatory=$false,ParameterSetName='Pipelines')]
        [ValidateSet('asc','desc')]
        $Sort = 'desc'       

    )    

    $Request = @{
        URI = ''
        Method = 'GET'
    }

    $Project = Get-GitlabProject -Id $ProjectId

    if ($PSCmdlet.ParameterSetName -ne 'Single') {
        Write-Verbose "Create GET Request"

        $GetUrlParameters = @()
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

    $Request = @{
        URI = ''
        Method = 'GET'
    }

    Write-Verbose -Message "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        Pipelines { $Request.URI="/projects/$($Project.id)/pipelines$URLParameters"; break; }
        Single { $Request.URI= "/projects/$($Project.id)/pipelines/$($Id)"; break; }
        default { Write-Error "Incorrect parameter set."; break; }

    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Pipeline'

}