Function Get-GitLabVersion 
{
    [OutputType('GitLab.Version')]  
    [cmdletbinding()]
    param(
    )

BEGIN {} 

PROCESS {
    Write-Verbose ( $PSBoundParameters | ConvertTo-Json )

    $Request = @{
        URI = "/version"
        Method = 'GET'
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Version'
}

END {}

}