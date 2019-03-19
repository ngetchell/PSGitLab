Function Get-GitLabGroup
{
  [cmdletbinding(DefaultParameterSetName = 'Groups')]
  [OutputType("GitLab.Group")]
  param(

    [Parameter(ParameterSetName = 'Single',
      Mandatory = $true)]
    [int]$Id,

    [Parameter(Mandatory = $false,
      ParameterSetName = 'Groups',
      HelpMessage = 'Return only archived groups')]
    [Parameter(Mandatory = $false,
      ParameterSetName = 'Owned',
      HelpMessage = 'Return only archived groups')]
    [Parameter(Mandatory = $false,
      ParameterSetName = 'All',
      HelpMessage = 'Return only archived groups')]
    [Parameter(Mandatory = $false,
      ParameterSetName = 'Starred',
      HelpMessage = 'Return only archived groups')]
    [switch]$Archived = $false,

    [Parameter(Mandatory = $false,
      HelpMessage = 'Limit by visibility',
      ParameterSetName = 'Groups')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Limit by visibility',
      ParameterSetName = 'Owned')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Limit by visibility',
      ParameterSetName = 'All')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Limit by visibility',
      ParameterSetName = 'Starred')]
    [ValidateSet("public", "internal", "private", "none")]
    $Visibility = 'none',

    [Parameter(Mandatory = $false,
      HelpMessage = 'Choose the order in which groups are returned.',
      ParameterSetName = 'Groups')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Choose the order in which groups are returned.',
      ParameterSetName = 'Owned')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Choose the order in which groups are returned.',
      ParameterSetName = 'All')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Choose the order in which groups are returned.',
      ParameterSetName = 'Starred')]
    [ValidateSet('id', 'name', 'path')]
    $Order_by = 'name',


    [Parameter(Mandatory = $false,
      HelpMessage = 'Ascending or Descending',
      ParameterSetName = 'Groups')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Ascending or Descending',
      ParameterSetName = 'Owned')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Ascending or Descending',
      ParameterSetName = 'All')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Ascending or Descending',
      ParameterSetName = 'Starred')]
    [ValidateSet('asc', 'desc')]
    $Sort = 'desc',

    [Parameter(Mandatory = $false,
      HelpMessage = 'Search for a project.',
      ParameterSetName = 'Groups')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Search for a project.',
      ParameterSetName = 'Owned')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Search for a project.',
      ParameterSetName = 'All')]
    [Parameter(Mandatory = $false,
      HelpMessage = 'Search for a project.',
      ParameterSetName = 'Starred')]
    $Search,

    [Parameter(ParameterSetName = 'Owned',
      Mandatory = $true)]
    [switch]$Owned,

    [Parameter(ParameterSetName = 'All',
      Mandatory = $true)]
    [switch]$All,

    [Parameter(ParameterSetName = 'Starred',
      Mandatory = $true)]
    [switch]$Starred

  )

  if ($PSCmdlet.ParameterSetName -ne 'Single')
  {
    Write-Verbose "Create GET Request"
    $GetUrlParameters = @()
    if ($archived)
    {
      $GetUrlParameters += @{archived = 'true'}
    }

    if ($search -ne $null)
    {
      $GetUrlParameters += @{search = $search}
    }
    $GetUrlParameters += @{order_by = $order_by}
    $GetUrlParameters += @{sort = $sort}
    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
    #$Request.URI = "$($Request.URI)" + "$URLParameters"
  }


  $Request = @{
    URI    = ''
    Method = 'GET'
  }

  Write-Verbose "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

  switch ($PSCmdlet.ParameterSetName)
  {
    Groups { $Request.URI = "/groups$URLParameters"; break; }
    Owned { $Request.URI = "/groups/owned$URLParameters"; break; }
    All { $Request.URI = "/groups/all$URLParameters"; break; }
    Starred { $Request.URI = "/groups/starred$URLParameters"; break; }
    Single { $Request.URI = "/groups/$Id"; break; }
    default { Write-Error "Incorrect parameter set."; break; }

  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'

}
