Function Set-GitLabProjectWebhook
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
    [parameter(mandatory,HelpMessage='Webhook URL')][string]$URL,
    [parameter(mandatory,HelpMessage='Hook ID')][string]$hook_id,
    [switch]$push_events,
    [switch]$issues_events,
    [switch]$merge_requests_events,
    [switch]$tag_push_events,
    [switch]$note_events,
    [switch]$pipeline_events,
    [switch]$wiki_events,
    [switch]$enable_ssl_verification,
    [string]$Token

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
    id  = $Project.id
    url = $URL
  }
  $null = $PSBoundParameters.Remove('URL')
  try
  {
    foreach($p in $PSBoundParameters.GetEnumerator())
    {
      $Body.Add($p.Key, $($p.Value))
    }

    $Request = @{
      URI    = "/projects/$($Project.id)/hooks/$hook_id"
      Method = 'PUT'
      Body   = $Body
      ContentType = 'application/x-www-form-urlencoded'
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
  }
  catch
  {
    Write-Error -Message $_
  }
}
