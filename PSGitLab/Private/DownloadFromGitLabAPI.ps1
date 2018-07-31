Function DownloadFromGitLabAPI
{
  <#
    .SYNOPSIS
    Download file from GitLab API

    .DESCRIPTION
    Download file from GitLab API

    .PARAMETER RequestURI
    The URL for download.

    .PARAMETER OutFile
    Where to save the file.

    .EXAMPLE
    DownloadFromGitLabAPI -RequestURI /projects/1/repository/archive.zip -OutFile C:\Temp\temp.zip
    Downloads the whole repo in a zip file for project id 1
    .NOTES

    .LINK

    .INPUTS

    .OUTPUTS

  #>


  [cmdletbinding()]
  param(
    [Parameter(Mandatory,
        HelpMessage = 'URI',
    Position = 0)]
    [ValidateNotNullOrEmpty()]
    [String]$RequestURI,

    [Parameter(Mandatory,
        HelpMessage = 'Output File',
    Position = 1)]
    [string]$OutFile
  )
  $GitLabConfig = ImportConfig
  $Domain = $GitLabConfig.Domain
  if ( $IsWindows -or ( [version]$PSVersionTable.PSVersion -lt [version]'5.99.0' ) )
  {
    $Token = DecryptString -Token $GitLabConfig.Token
  }
  elseif ( $IsLinux )
  {
    $Token = $GitLabConfig.Token
  }

  $RequestURI = ('{0}/api/v3{1}' -f $Domain, $RequestURI)
  try
  {
    Write-Verbose -Message ('URL: {0}' -f $RequestURI)
    $wc = New-Object -TypeName System.Net.WebClient
    $wc.Headers.Add('PRIVATE-TOKEN',$Token)
    Write-Verbose -Message ('Downloading File from {0} to {1}' -f $RequestURI, $OutFile)
    $wc.DownloadFile($RequestURI,$OutFile)
    Remove-Variable -Name Token
    Remove-Variable -Name RequestURI
  }
  catch
  {
    $ErrorMessage = $_.exception.response.statusDescription
    Write-Warning  -Message ('{0}. See {1}/help/api/README.md#status-codes for more information.' -f $ErrorMessage, $Domain)
  }
}
