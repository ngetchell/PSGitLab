Function Search-GitLabUser {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$User
)

    $Request = @{
        URI="/users?search=$($User)";
        Method='Get';
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User' -Version "v4"
}
