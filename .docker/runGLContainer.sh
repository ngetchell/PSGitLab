sudo docker run --detach \
    --hostname gitlab.example.com \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://localhost/'; gitlab_rails['lfs_enabled'] = true; gitlab_rails['initial_root_password'] = 'longterriblepassword!' " \
    --publish 443:443 --publish 80:80 --publish 2222:22 \
    --name gitlab \
    --restart always \
    gitlab/gitlab-ce:latest
