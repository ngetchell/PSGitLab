Function Set-GitLabProjectServiceMSTeams
{
[OutputType('GitLab.Project.Service.MSTeams')]
  [cmdletbinding()]
  param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName = 'Id')]
    [string]$Id,

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    #[Parameter(ParameterSetName='Namespace')]
    [string]$Namespace,
    [parameter(mandatory,HelpMessage='MSTeams Webhook')][string]$webhook 
  )
  
  $Project = $null
  switch ($PSCmdlet.ParameterSetName) {
    'Id' 
    {
      $Project = Get-GitLabProject -Id $Id
      $null = $PSBoundParameters.Remove('Id')
    }
    'Namespace' 
    {
      $Project = Get-GitLabProject -Namespace $Namespace
      $null = $PSBoundParameters.Remove('Namespace')
    }
  }
  If ($PSBoundParameters.ContainsKey('verbose'))
  {
    $null = $PSBoundParameters.Remove('verbose')
  }
  $Body = @{
    webhook = $webhook
  }
  $null = $PSBoundParameters.Remove('webhook')
  try 
  {
    $Request = @{
      URI         = "/projects/$($Project.id)/services/microsoft-teams"
      Method      = 'PUT'
      Body        = $Body
      ContentType = 'application/x-www-form-urlencoded'
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Service.MSTeams'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
