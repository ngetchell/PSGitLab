Function Search-GitLabNamespace {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Namespace
)

    $Request = @{
        URI="/namespaces?search=$($Namespace)";
        Method='Get';
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Namespace'
}
