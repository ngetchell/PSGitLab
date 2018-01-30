Function New-GitLabRunner {
    param(
        [Parameter(Mandatory=$true)]
        [string] $Token,

        [Parameter(Mandatory=$true)]
        [string] $Description,

        [Parameter(Mandatory=$true)]
        [string] $Tags,
        
        [bool] $RunUntagged = $false,
        [bool] $Locked = $true,

        [Parameter(Mandatory=$true)]
        [string] $Platform = "linux",

        [Parameter(Mandatory=$true)]
        [string] $Architecture = "amd64",
        
        [Parameter(Mandatory=$true)]
        [ValidateSet("shell", "docker", "docker-ssh", "ssh", "parallels", "virtualbox", "docker+machine", "docker-ssh+machine", "kubernetes")]
        [string] $Executor = "shell",

        [bool] $Artifacts = $true,
        [bool] $Cache = $true,
        [bool] $Image = $true,
        [bool] $Services = $true,
        [bool] $Shared = $true,
        [bool] $Variables = $true,
        
        [Parameter(Mandatory=$true)]
        [string] $Name,
        
        [Parameter(Mandatory=$true)]
        [string] $Revision = "c1ecf97f",
        
        [Parameter(Mandatory=$true)]
        [string] $Version = "10.1.0"
    )

    $requestObject = @{
        "info" = @{
            "name" = $Name;
            "version" = $Version;
            "revision" = $Revision;
            "platform" = $Platform;
            "architecture" = $Architecture;
            "executor" = $Executor;
            "features" = @{
                "variables" = $Variables;
                "image" = $Image;
                "services" = $Services;
                "artifacts" = $Artifacts;
                "cache" = $Cache;
                "shared" = $Shared;
            };
        };
        "token" = $Token;
        "description" = $Description;
        "tag_list" = $Tags;
        "run_untagged" = $RunUntagged;
        "locked" = $locked;
    }

    $Body = ConvertTo-Json $requestObject

    $Request = @{
        URI='/runners';
        Method='POST';
        Body=$Body;
        ContentType="application/json"
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}