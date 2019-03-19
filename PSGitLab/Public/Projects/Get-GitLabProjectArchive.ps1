Function Get-GitLabProjectArchive
{
[OutputType('String')]
  param(
    [parameter(mandatory,HelpMessage = 'Project ID')][int]$ProjectID,
    [string]$CommitID = $null,
    [string]$OutFile = "$PWD\test.zip"
  )

  $Commits = Get-GitLabProjectCommit -id $ProjectID
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
  $ProjectName = (Get-GitLabProject | Where-Object -FilterScript {
      ($_.id -eq $ProjectID)
  }).Name
  $RequestURI = ('/projects/{0}/repository/archive.zip?sha={1}' -f $ProjectID, $CommitID)
  DownloadFromGitLabAPI -RequestURI $RequestURI -OutFile $OutFile
  return ('Project ID:{0} Archive saved to {1}' -f $ProjectID, $OutFile)
}
