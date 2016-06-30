Function Test-GitLabAPI {
    <#
    .SYNOPSIS
    Used to check your configuration. 
    .DESCRIPTION
    Used to check your configuration. Calls an API to test the token. 
    .EXAMPLE
    Test-GitLabAPI
    #>
    $GitLabConfig = ImportConfig
    $Domain = $GitLabConfig.Domain
    $Token = $GitLabConfig.Token
    
    $Result = Invoke-WebRequest -Uri "$Domain/api/v3/projects?private_token=$Token"
    GetGitLabStatusCode $Result.StatusCode
}