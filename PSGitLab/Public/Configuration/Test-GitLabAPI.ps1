Function Test-GitLabAPI {
    $GitLabConfig = ImportConfig
    $Domain = $GitLabConfig.Domain
    $Token = DecryptString -Token $GitLabConfig.Token
    
    $Result = Invoke-WebRequest -Uri "$Domain/api/v3/projects?private_token=$Token"
    Remove-Variable Token
    GetGitLabStatusCode $Result.StatusCode
}