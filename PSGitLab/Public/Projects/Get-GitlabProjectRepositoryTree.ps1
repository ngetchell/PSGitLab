function Get-GitlabProjectRepositoryTree
{

  [OutputType('GitLab.Repository.Tree')]
  [cmdletbinding()]
  param(
     [parameter(mandatory,HelpMessage='Project ID')][int]$ProjectID,
     [string]$CommitID
  )


  $Commits = Get-GitLabProjectCommit -Id $ProjectID
  IF (-not($CommitID))
  {
    $CommitID = $Commits[0].id #most recent commit id
  }
  ElseIF ($Commits | Where-Object -FilterScript {
      $_.id -eq $CommitID
  })
  {
    Write-Verbose -Message ('Commit id OK')
  }
  Else
  {
    Throw 'Commit ID bad'
  }

  $repoTree = (QueryGitLabAPI -Request @{
      URI    = ('/projects/{0}/repository/tree?ref_name={1}&recursive=true' -f $ProjectID, $CommitID)
      Method = 'GET'
  } -ObjectType 'GitLab.Repository.Tree')
  $repoTree | Add-Member -MemberType NoteProperty -Name 'ProjectID' -Value $ProjectID
  $repoTree | Add-Member -MemberType NoteProperty -Name 'CommitID' -Value $CommitID
  return $repoTree
}
