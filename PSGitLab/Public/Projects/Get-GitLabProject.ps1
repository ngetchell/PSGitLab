Function Get-GitLabProject {
    [cmdletbinding(DefaultParameterSetName='Projects')]
    [OutputType("GitLab.Project")]
    param(

        [Parameter(ParameterSetName='Single',
                   Mandatory=$true)]
        [int]$Id,
        [Parameter(ParameterSetName='PerGroup',
                   Mandatory=$true)]
        [int]$GroupId,

        [Parameter(Mandatory=$false,
                   ParameterSetName='Projects',
                   HelpMessage='Return only archived projects')]
        [Parameter(Mandatory=$false,
                   ParameterSetName='Owned',
                   HelpMessage='Return only archived projects')]
        [Parameter(Mandatory=$false,
                   ParameterSetName='All',
                   HelpMessage='Return only archived projects')]
        [Parameter(Mandatory=$false,
                   ParameterSetName='Starred',
                   HelpMessage='Return only archived projects')]
        [Parameter(Mandatory=$false,
                   ParameterSetName='PerGroup',
                   HelpMessage='Return only archived projects')]
        [switch]$Archived = $false,

        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by visibility',
                   ParameterSetName='Projects')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by visibility',
                   ParameterSetName='Owned')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by visibility',
                   ParameterSetName='All')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by visibility',
                   ParameterSetName='Starred')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by visibility',
                   ParameterSetName='PerGroup')]
        [ValidateSet("public", "internal", "private","none")]
        $Visibility = 'none',

        [Parameter(Mandatory=$false,
                   HelpMessage='Choose the order in which projects are returned.',
                   ParameterSetName='Projects')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Choose the order in which projects are returned.',
                   ParameterSetName='Owned')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Choose the order in which projects are returned.',
                   ParameterSetName='All')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Choose the order in which projects are returned.',
                   ParameterSetName='Starred')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Choose the order in which projects are returned.',
                   ParameterSetName='PerGroup')]
        [ValidateSet('id','name','path','created_at','updated_at','last_activity_at')]
        $Order_by = 'created_at',


        [Parameter(Mandatory=$false,
                   HelpMessage='Ascending or Descending',
                   ParameterSetName='Projects')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Ascending or Descending',
                   ParameterSetName='Owned')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Ascending or Descending',
                   ParameterSetName='All')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Ascending or Descending',
                   ParameterSetName='Starred')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Ascending or Descending',
                   ParameterSetName='PerGroup')]
        [ValidateSet('asc','desc')]
        $Sort = 'desc',

        [Parameter(Mandatory=$false,
                   HelpMessage='Search for a project.',
                   ParameterSetName='Projects')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Search for a project.',
                   ParameterSetName='Owned')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Search for a project.',
                   ParameterSetName='All')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Search for a project.',
                   ParameterSetName='Starred')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Search for a project.',
                   ParameterSetName='PerGroup')]
        $Search,

        [Parameter(ParameterSetName='Owned',
                   Mandatory=$true)]
        [switch]$Owned,

        [Parameter(ParameterSetName='All',
                   Mandatory=$true)]
        [switch]$All,

        [Parameter(ParameterSetName='Starred',
                   Mandatory=$true)]
        [switch]$Starred

    )

    if ($PSCmdlet.ParameterSetName -ne 'Single') {
        Write-Verbose "Create GET Request"
        $GetUrlParameters = @()
        if ($archived) {
            $GetUrlParameters += @{archived='true'}
        }
        else {
            $GetUrlParameters += @{archived='false'}
        }
        
        if ($search -ne $null) {
            $GetUrlParameters += @{search=$search}
        }
        $GetUrlParameters += @{order_by=$order_by}
        $GetUrlParameters += @{sort=$sort}
        $GetUrlParameters += @{per_page=100}
        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
        #$Request.URI = "$($Request.URI)" + "$URLParameters"
    }


    $Request = @{
        URI = ''
        Method = 'GET'
    }

    Write-Verbose "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        Projects { $Request.URI = "/projects$URLParameters"; break; }
        PerGroup { $Request.URI = "/groups/$GroupId/projects$URLParameters"; break; }
        Owned { $Request.URI = "/projects/owned$URLParameters"; break; }
        All { $Request.URI="/projects$URLParameters"; break; }
        Starred { $Request.URI="/projects/starred$URLParameters"; break; }
        Single { $Request.URI="/projects/$Id"; break; }
        default { Write-Error "Incorrect parameter set."; break; }

    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'

}
