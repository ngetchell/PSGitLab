
$Token = Get-Random
$ContainerName = 'gitlab'
$URI = 'http://localhost'

Write-Host "Checking Status of gitlab container"

$Inspect = docker inspect $ContainerName | ConvertFrom-Json
if ( $Inspect.State.Status -ne 'running' ) {
    Write-Host "Starting $ContainerName"
    docker run --detach --hostname gitlab.example.com --env GITLAB_OMNIBUS_CONFIG="external_url '$URI'; gitlab_rails['lfs_enabled'] = true; gitlab_rails['initial_root_password'] = 'longterriblepassword!' "     --publish 4433:433 --publish 80:80 --publish 2222:22 --name $ContainerName --restart always gitlab/gitlab-ce:latest
}

do {
    Write-Host "Waiting for $ContainerName to start web server."
    $StatusCode = docker exec -ti gitlab curl -s -o /dev/null -w "%{http_code}" localhost
    Start-Sleep -Seconds 5
} while ( $StatusCode -ne 302 )
Write-Host "Web server started and is properly redirecting."

Write-Host "Setting Personal Access Token to $Token"
docker exec -ti -u git gitlab gitlab-rails r "token = PersonalAccessToken.new(user: User.where(id: 1).first, name: 'temp token13', token: '$Token', scopes: ['api','read_user','sudo']); token.save"'!'

Save-GitLabAPIConfiguration -Token $Token -Domain 'http://localhost'

Test-GitLabAPI

Get-Gitlabuser -all