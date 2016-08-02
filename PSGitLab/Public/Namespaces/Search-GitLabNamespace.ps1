Function Search-GitLabNamespace {
<#
.SYNOPSIS
Used to find GitLab namespaces.
.DESCRIPTION
Used to find GitLab namespaces. It returns the kind of namepsace and the namespace ID.
.EXAMPLE
Search-GitLabNamespace -Namespace HomeLab
id path    kind 
-- ----    ---- 
 4 HomeLab group
#>
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
