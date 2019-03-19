Function Unblock-GitLabUser {
    [cmdletbinding(DefaultParameterSetName='ID')]
    param(
        [Parameter(Mandatory=$True,
                   ParameterSetName='ID',
                   ValueFromPipelineByPropertyName=$true)]
        [string]$ID,

        [Parameter(Mandatory=$True,
                   ParameterSetName='Username')]
        [string]$Username,

        [Parameter(Mandatory=$True,
                   ParameterSetName='Email')]
        [string]$Email,

        [switch] $Passthru = $false
    )

    BEGIN {}

    PROCESS {

        Write-Verbose "$ID"
        switch ($PSCmdlet.ParameterSetName) {
            'ID' { $User = Get-GitLabUser -ID $ID }
            'Email' { $User = Get-GitLabUser -ID $Email }
            'Username' { $User = Get-GitLabUser -ID $Username }
        }

        $request = @{
            URI = "/users/$($User.ID)/unblock"
            Method = 'POST'
        }

        $null = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
        if ($Passthru.IsPresent) {
            Get-GitLabuser -id $User.ID
        }

    }

    END {}


}
