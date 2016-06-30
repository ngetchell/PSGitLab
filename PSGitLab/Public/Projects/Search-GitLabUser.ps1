Function Search-GitLabUser {
<#
.SYNOPSIS
Retrives a GitLab user. 
.DESCRIPTION
Retrives a GitLab user. 
.EXAMPLE
Search-GitLabUser ngetchell
name               : Nicholas Getchell
username           : ngetchell
id                 : 2
state              : active
is_admin           : true
#>
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$User
)

    $Request = @{
        URI="/users?search=$($User)";
        Method='Get';
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Users'
}
