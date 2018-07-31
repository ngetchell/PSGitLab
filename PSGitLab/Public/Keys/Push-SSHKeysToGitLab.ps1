Function Push-SSHKeysToGitLab {
    [cmdletbinding(SupportsShouldProcess=$true,ConfirmImpact='High')]
    param(
        [ValidateScript({ Test-Path $_ })]
        $SSHDirectory = "~/.ssh/"
    )

    $PublicKeyFiles = Get-Childitem -Recurse -Path $SSHDirectory -Include "*.pub"

    if ($PublicKeyFiles.count -gt 0 ) {

        $PublicKeyFiles | ForEach-Object {
            if ( $PSCmdlet.ShouldProcess("Push SSH Key $_ to GitLab Instance") ) {
                Write-Verbose "Uploading $($_.Fullname)"
                New-GitLabUserKey -KeyFile $_.FullName
            }
        }

    } else {
        Write-Warning "No Public Keys Found"
    }
}
