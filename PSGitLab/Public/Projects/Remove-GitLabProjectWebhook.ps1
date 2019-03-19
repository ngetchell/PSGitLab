Function Remove-GitLabProjectWebhook
{
  [OutputType('GitLab.Project.Webhook')]
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
    [parameter(mandatory,HelpMessage = 'Webhook id')][string]$hook_id

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
    id      = $Project.id
    url     = $URL
    hook_id = $hook_id
  }
  try
  {
    $Request = @{
      URI    = "/projects/$($Project.id)/hooks/$hook_id"
      Method = 'DELETE'
      Body   = $Body
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
  }
  catch
  {
    Write-Error -Message $_
  }
}
