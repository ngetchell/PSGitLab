Function Get-GitLabProject {
    <#
    .SYNOPSIS
    Retrieve all projects in a GitLab instance. 
    .DESCRIPTION
    Retrieve all projects in a GitLab instance. Queries over HTTP and gets back GitLab.Project type.  
    .EXAMPLE
    Get-GitLabProject
    .EXAMPLE
    Get-GitLabProject -All
    .EXAMPLE
    Get-GitLabProject -Owned
    .EXAMPLE
    Get-GitLabProject -Id 4
    .EXAMPLE
    Get-GitLabProject -Archived
    .EXAMPLE 
    Get-GitLabProject -Starred
    .EXAMPLE
    Get-GitLabProject -Search 'ngetchell' -Archived
    .PARAMETER Id
    The ID or NAMESPACE/PROJECT_NAME of the project.
    .PARAMETER Archived
    Limit by archived status.
    .PARAMETER Visibility
    Limit by visibility public, internal, or private.
    .PARAMETER Order_by
    Return projects ordered by id, name, path, created_at, updated_at, or last_activity_at fields. Default is created_at.
    .PARAMETER Sort
    Return projects sorted in asc or desc order. Default is desc.
    .PARAMETER Search
    Return list of authorized projects matching the search criteria.
    .PARAMETER Owned
    Return all owned projects.
    .PARAMETER Starred
    Return all starred projects.
    .PARAMETER All
    Return all projects.
    #>
    [cmdletbinding(DefaultParameterSetName='Projects')]
    [OutputType("GitLab.Project")]
    param(

        [Parameter(ParameterSetName='Single',
                   Mandatory=$true)]
        [int]$Id,

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
        Owned { $Request.URI = "/projects/owned$URLParameters"; break; }
        All { $Request.URI="/projects/all$URLParameters"; break; }
        Starred { $Request.URI="/projects/starred$URLParameters"; break; }
        Single { $Request.URI="/projects/$Id"; break; }
        default { Write-Error "Incorrect parameter set."; break; }

    }
    
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'

}