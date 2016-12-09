Function Get-GitLabNamespace {
<#
.SYNOPSIS
Retrieves all of the different namespaces in a GitLab instance.
.DESCRIPTION
Retrieves all of the different namespaces in a GitLab instance. Queries over HTTP and returns GitLab.Namespace type.
.EXAMPLE
Get-GitLabNamespace
.PARAMETER Search
Returns a list of namespaces the user is authorized to see based on the search criteria.
#>
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
