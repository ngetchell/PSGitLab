function Get-GitlabProjectSubmodule
{

  [OutputType('GitLab.Project.Submodule.Information')]
  [cmdletbinding()]
  param(
    [parameter(mandatory,HelpMessage='Project ID')][int]$ProjectID,
    [string]$CommitID
  )
  $repoTree = Get-GitlabProjectRepositoryTree -ProjectID $ProjectID
  If (-not($repotree | Where-Object -FilterScript {
      ($_.Type -eq 'blob') -and ($_.name -eq '.gitmodules')
  })) {
    Throw ('.gitmodules file missing from Project {0}' -f $ProjectID)
  }
  $Projects = Get-GitLabProject
  $repoTree = $repoTree | Where-Object -FilterScript {
      $_.Type -eq 'commit'
  }
  $Request = @{
    URI    = ('/projects/{0}/repository/files/.gitmodules?ref={1}' -f $repoTree[0].ProjectID, $repoTree[0].CommitID)
    Method = 'GET'
  }
  $GitsubmoduleFile = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((QueryGitLabAPI -Request $Request -ObjectType 'File').content))
  $Gitsubmodules = $GitsubmoduleFile.Split('[]') -ne '' | ForEach-Object -Begin {
    $i = 0
  } -Process {
    if ($i++ % 2)
    {
      [PSCustomObject](ConvertFrom-StringData -StringData $_)
    }
  }
  $Object = @()
  Foreach ($commit in $repoTree)
  {
    $SubmoduleURL = ($Gitsubmodules | Where-Object -FilterScript {
        $_.path -eq $commit.Path
    }).url
    $SubmoduleProjectName = $SubmoduleURL.Split('/')[-1].Replace('.git','')
    $SubModuleNamespace = $SubmoduleURL.Split('/')[-2]
    $SubmoduleProjectID = ($Projects | Where-Object -FilterScript {
        $_.name -eq $SubmoduleProjectName
    }).Id
    $hash = [pscustomobject]@{
      ParentProjectID          = $commit.ProjectID
      ParentProjectCommitID    = $commit.CommitID
      SubModuleNamespace       = $SubModuleNamespace
      SubmoduleProjectID       = $SubmoduleProjectID
      SubmoduleProjectName     = $SubmoduleProjectName
      SubmodulePath            = $commit.Path
      SubmoduleFoldername      = $commit.Name
      SubmoduleURL             = $SubmoduleURL
      SubmoduleProjectCommitID = $commit.ID
    }
    $Object += $hash
  }

  $Object
}
