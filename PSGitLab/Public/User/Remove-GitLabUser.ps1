Function Remove-GitLabUser {
    [cmdletbinding(SupportsShouldProcess=$True,ConfirmImpact='High')]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string[]]$Username
    )

    BEGIN {}

    PROCESS {
        foreach ( $user in $Username ) {

            $UserInfo = (Get-GitLabUser -Username $User)[0]
            Write-Verbose "$($UserInfo.Username)"
            $Request = @{
                URI="/users/$($UserInfo.ID)"
                Method = 'DELETE'
            }

            if ( $PSCmdlet.ShouldProcess("Delete User $Username") ) {
                $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
            }

        }

    }

    END {}

}
