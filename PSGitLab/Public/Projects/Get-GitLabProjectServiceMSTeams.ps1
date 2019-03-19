Function Get-GitLabProjectServiceMSTeams
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
    }
    'Namespace'
    {
      $Project = Get-GitLabProject -Namespace $Namespace
    }
  }

  $Request = @{
    URI    = "/projects/$($Project.id)/services/microsoft-teams"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Service.MSTeams'
}
