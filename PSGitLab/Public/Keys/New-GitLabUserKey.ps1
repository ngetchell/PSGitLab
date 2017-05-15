Function New-GitLabUserKey {
    [cmdletbinding(DefaultParameterSetName='Explicit')]
    [OutputType('GitLab.User.Key')]
    param(
        [Parameter(ParameterSetName='Explicit')]
        [string]$Title,

        [Parameter(ParameterSetName='Explicit',Mandatory=$true)]
        [string]$Key,

        [Parameter(ParameterSetName='File',Mandatory=$true)]
        [string]$KeyFile = $null
    )

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
        URI="/user/keys";
        Method='POST';
        Body = $Body
    }

   
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User.Key'      
}