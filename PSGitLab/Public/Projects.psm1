Function Get-GitlabOwnedProjects {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$false,
               HelpMessage="Return only archived projects.")]
    [ValidateNotNullOrEmpty()]   
    [switch]$archived = $false,

    [Parameter(Mandatory=$false,
               HelpMessage="Choose how the objects are returned by GitLab.",
               Position=0)]
    [ValidateSet("id","name","path","created_at","updated_at","last_activity_at")]
    [string]$order_by = 'created_at',

    [Parameter(Mandatory=$false,
               HelpMessage="Choose ascending or descending.",
               Position=1)]
    [ValidateSet("asc","desc")]    
    [string]$sort = 'desc',
    
    [Parameter(Mandatory=$false,
               HelpMessage="Search against GitLab to only return certain projects.",
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$search = $null
)

    $Request = @{
        URI="/projects/owned";
        Method='Get';
    }

    ## GET Method Paramters
    $GetUrlParameters = @()
    if ($archived) {
        $GetUrlParameters += @{archived='true'}
    }

    if ($search -ne $null) {
        $GetUrlParameters += @{search=$search}
    }
    $GetUrlParameters += @{order_by=$order_by}
    $GetUrlParameters += @{sort=$sort}
    $URLParamters = GetMethodParameters -GetURLParameters $GetUrlParameters
    $Request.URI = "$($Request.URI)" + "$URLParamters"

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project"
    

}

Function Get-GitlabAllProjects {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$false,
               HelpMessage="Return only archived projects.")]
    [ValidateNotNullOrEmpty()]   
    [switch]$archived = $false,

    [Parameter(Mandatory=$false,
               HelpMessage="Choose how the objects are returned by GitLab.",
               Position=0)]
    [ValidateSet("id","name","path","created_at","updated_at","last_activity_at")]
    [string]$order_by = 'created_at',

    [Parameter(Mandatory=$false,
               HelpMessage="Choose ascending or descending.",
               Position=1)]
    [ValidateSet("asc","desc")]    
    [string]$sort = 'desc',
    
    [Parameter(Mandatory=$false,
               HelpMessage="Search against GitLab to only return certain projects.",
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$search = $null
)

    $Request = @{
        URI="/projects/all";
        Method='Get';
    }

    ## GET Method Paramters
    $GetUrlParameters = @()
    if ($archived) {
        $GetUrlParameters += @{archived='true'}
    }

    if ($search -ne $null) {
        $GetUrlParameters += @{search=$search}
    }
    $GetUrlParameters += @{order_by=$order_by}
    $GetUrlParameters += @{sort=$sort}
    $URLParamters = GetMethodParameters -GetURLParameters $GetUrlParameters
    $Request.URI = "$($Request.URI)" + "$URLParamters"

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" 
    

}

Function Get-GitlabSingleProject {
[cmdletbinding()]
param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Id')]
    [string]$Id,

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Namespace')]
    [string]$Namespace
)

    $queryID = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $queryID = $id }
        'Namespace' { $queryID = $Namespace -replace "/","%2F" -replace " ","" }
    }
    
    $Request = @{
        URI="/projects/$queryID";
        Method='Get';
    }

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" 
    

}

Function Get-GitlabProjectEvents {
[cmdletbinding()]
param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Id')]
    [string]$Id,

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Namespace')]
    [string]$Namespace
)

    $queryID = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $queryID = $id }
        'Namespace' { $queryID = $Namespace -replace "/","%2F" -replace " ","" }
    }
    
    $Request = @{
        URI="/projects/$queryID/events";
        Method='Get';
    }

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project.Events" 
    

}

Function New-GitLabProject {
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [string]$Path,
        [string]$Namespace_ID,
        [string]$Description,
        [switch]$Issues_Enabled,
        [switch]$Merge_Requests_Enabled,
        [switch]$Wiki_Enabled,
        [Switch]$Snippets_Enabled,
        [Switch]$public
    )

    $Body = @{
        name=$Name;
    }
  
    $Request = @{
        URI="/projects";
        Method='POST';
        Body=$Body;
    }

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" 

}

Function Remove-GitLabProject {
[cmdletbinding(SupportsShouldProcess=$True,ConfirmImpact="High")]
param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true,
               ValueFromPipelineByPropertyName=$true)]
    [string]$Id
)

    $Request = @{
        URI="/projects/$ID";
        Method='Delete';
    }

    $Project = Get-GitlabSingleProject -Id $Id

    if ($PSCmdlet.ShouldProcess($Project.Name, "Delete Project")) {
        $Worked = QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project"
    }

    

}

Function Get-GitlabProjects {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$false,
               HelpMessage="Return only archived projects.")]
    [ValidateNotNullOrEmpty()]   
    [switch]$archived = $false,

    [Parameter(Mandatory=$false,
               HelpMessage="Choose how the objects are returned by GitLab.",
               Position=0)]
    [ValidateSet("id","name","path","created_at","updated_at","last_activity_at")]
    [string]$order_by = 'created_at',

    [Parameter(Mandatory=$false,
               HelpMessage="Choose ascending or descending.",
               Position=1)]
    [ValidateSet("asc","desc")]    
    [string]$sort = 'desc',
    
    [Parameter(Mandatory=$false,
               HelpMessage="Search against GitLab to only return certain projects.",
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$search = $null
)

    $Request = @{
        URI="/projects";
        Method='Get';
    }

    ## GET Method Paramters
    $GetUrlParameters = @()
    if ($archived) {
        $GetUrlParameters += @{archived='true'}
    }

    if ($search -ne $null) {
        $GetUrlParameters += @{search=$search}
    }
    $GetUrlParameters += @{order_by=$order_by}
    $GetUrlParameters += @{sort=$sort}
    $URLParamters = GetMethodParameters -GetURLParameters $GetUrlParameters
    $Request.URI = "$($Request.URI)" + "$URLParamters"

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" 
    

}

Function New-GitLabFork {
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(ParameterSetName='Id')]
        [string]$Id,

        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(ParameterSetName='Namespace')]
        [string]$Namespace
    )

    $Project = $null
    switch ($PSCmdlet.ParameterSetName) {
        'Id' { $Project = Get-GitlabSingleProject -Id $Id }
        'Namespace' { $Project = Get-GitlabSingleProject -Namespace $Namespace }
    }

    $Request = @{
        URI="/projects/fork/$($Project.id)";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" 
}

