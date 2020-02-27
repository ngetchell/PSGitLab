Function Block-GitLabUser {
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
        switch ($PScmdlet.ParameterSetName ) {
            'Email' { $User = Get-GitLabUser -Email $Email }
            'Username' { $User = Get-GitLabUser -Username $UserName }
            'ID' { $User = Get-GitLabUser -id $ID }
        }

        if ( -not $User ) {
            Write-Error "User does not exist"
        }
        
        $request = @{
            URI = "/users/$($User.ID)/block"
            Method = 'POST'
        }

        $null = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
        if ($Passthru.IsPresent) {
            Get-GitLabuser -id $User.ID
        }

    }

    END {}



}
