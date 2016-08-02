Function Get-GitLabNamespace {
<#
.SYNOPSIS
Retrieves all of the different namespaces in a GitLab instance.
.DESCRIPTION
Retrieves all of the different namespaces in a GitLab instance. Queries over HTTP and returns GitLab.Namespace type.
.EXAMPLE
Get-GitLabNamespace
#>
[cmdletbinding()]
    $Request = @{
        URI="/namespaces";
        Method='Get';
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Namespace'
}
