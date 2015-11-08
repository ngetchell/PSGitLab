Function New-GitLabProject {
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [string]$Path,
        [string]$Namespace_ID,
        [string]$Description,
        [switch]$Issues_Enabled,
        [switch]$Merge_Requests_Enabled,
        [switch]$Wiki_Enabled,
        [Switch]$Snippets_Enabled,
        [Switch]$public
    )

    $Body = @{
        name=$Name;
    }

    $Request = @{
        URI='/projects';
        Method='POST';
        Body=$Body;
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'

}
