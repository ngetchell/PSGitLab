Function Test-GitLabAPI {

    $GitLabConfig = ImportConfig
    $Domain = $GitLabConfig.Domain
    $Token = $GitLabConfig.Token
    
    $Result = Invoke-WebRequest -Uri "$Domain/api/v3/projects?private_token=$Token"
    GetGitLabStatusCode $Result.StatusCode
}