Function Remove-GitLabProjectServiceMSTeams
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
    [string]$Namespace

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

  try
  {
    $Request = @{
      URI    = "/projects/$($Project.id)/services/microsoft-teams"
      Method = 'DELETE'
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Services.MSTeams'
  }
  catch
  {
    Write-Error -Message $_
  }
}
