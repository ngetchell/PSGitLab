Function Get-GitLabOwnedProject {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$false,
               HelpMessage='Return only archived projects.')]
    [ValidateNotNullOrEmpty()]
    [switch]$archived = $false,

    [Parameter(Mandatory=$false,
               HelpMessage='Choose how the objects are returned by GitLab.',
               Position=0)]
    [ValidateSet('id','name','path','created_at','updated_at','last_activity_at')]
    [string]$order_by = 'created_at',

    [Parameter(Mandatory=$false,
               HelpMessage='Choose ascending or descending.',
               Position=1)]
    [ValidateSet('asc','desc')]
    [string]$sort = 'desc',

    [Parameter(Mandatory=$false,
               HelpMessage='Search against GitLab to only return certain projects.',
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$search = $null
)

    $Request = @{
        URI='/projects/owned';
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

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'
}
