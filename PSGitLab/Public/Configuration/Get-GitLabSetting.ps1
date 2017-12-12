Function Get-GitLabSetting {
    [cmdletbinding()]
    [OutputType('GitLab.Setting')]
    param(
    )
    $Request = @{
        URI="/application/settings";
        Method='Get';
    }
    
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Setting'

}