Function Get-GitLabProjectTag
{
[OutputType('GitLab.Project.Tag')]
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
    URI    = "/projects/$($Project.id)/repository/tags"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Tag'
}
