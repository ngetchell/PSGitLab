Function New-GitLabUserKey {
    [cmdletbinding(DefaultParameterSetName='Explicit')]
    [OutputType('GitLab.User.Key')]
    param(
        [Parameter(ParameterSetName='Explicit')]
        [string]$Title,

        [Parameter(ParameterSetName='Explicit',Mandatory=$true)]
        [string]$Key,

        [Parameter(ParameterSetName='File',Mandatory=$true)]
        [string]$KeyFile = $null,

        [Parameter(Mandatory=$false)]
        $Username = $null
    )

    if ( $PSBoundParameters.ContainsKey('Username') ) {
        try {
            $User = Get-GitLabUser -Username $Username
        } catch {
            Write-Error "Unable to find user"
        }
        $URI = '/users/{0}/keys' -f $User.ID
    } else {
        $URI = "/user/keys"
    }

    if ( $PSCmdlet.ParameterSetName -eq 'File' ) {
        $Contents = Get-Content -Path $KeyFile
        $Title = ($Contents -split " ")[2]
        $Key = "{0} {1}" -f ($Contents -split " ")[0],($Contents -split " ")[1]

        Write-Verbose "Title: $Title Key: $Key"
    }

    if ($Title -eq $null) {
        Write-Error "Title could not be determined."
    }

    $Body = @{
        title= $Title
        key = $Key
    }

    $Request = @{
        URI=$URI;
        Method='POST'
        Body = $Body
    }



    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User.Key'
}
