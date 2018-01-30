Function Remove-GitLabRunner {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Id)

    $Request = @{
        URI="/runners/$Id";
        Method='DELETE';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}