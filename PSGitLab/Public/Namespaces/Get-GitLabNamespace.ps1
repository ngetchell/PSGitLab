Function Get-GitLabNamespace {
[cmdletbinding()]
[OutputType('GitLab.Namespace')]
param (
    [string]$search
)
    $GetUrlParameters = @()

    if ($search -ne $null) {
        $GetUrlParameters += @{search=$search}
    }
    $GetUrlParameters += @{per_page=100}
    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
    #$Request.URI = "$($Request.URI)" + "$URLParameters"
    $Request = @{
        URI="/namespaces$URLParameters";
        Method='Get';
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Namespace'
}
