Function New-GitLabProject {
    <#
    .SYNOPSIS
    Creates a new GitLab project. Requires a name. 
    .DESCRIPTION
    Creates a new GitLab project. Requires a name. 
    .EXAMPLE
    New-GitlabProject -Name 'Fake'
    .PARAMETER Name
    The name of the new project.
    .PARAMETER Path
    Custom repository name for new project. By default generated based on name.
    .PARAMETER Namespace
    Namespace for the new project (defaults to the current user's namespace).
    .PARAMETER Description
    The description of the project.
    .PARAMETER Issues_enabled
    Whether to turn on issues for this project.
    .PARAMETER Merge_requests_enabled
    Whether to turn on merge requests for this project.
    .PARAMETER Builds_enabled
    Whether to turn on builds for the project.
    .PARAMETER Wiki_enabled
    Whether to turn on a wiki for the project.
    .PARAMETER Snippets_enabled
    Whether to turn on snippets for the project.
    .PARAMETER Container_registry_enabled
    Whether to turn on the container registry. 
    .PARAMETER Public
    Whether the project should be public.
    .PARAMETER visibility_level
    Whether the project should be private, internal, or public.
    #>    
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$name,
        [string]$path,
        [string]$namespace,
        [string]$description,
        [switch]$issues_enabled,
        [switch]$merge_requests_enabled,
        [switch]$builds_enabled,
        [switch]$wiki_enabled,
        [Switch]$snippets_enabled,
        [Switch]$container_registry_enabled,
        [Switch]$public,
        [ValidateSet("Private", "Internal", "Public")]
        [String]$visibility_level
    )

    $Body = @{
        name = $Name
    }
    $PSBoundParameters.Remove('Name') | Out-Null

    try {
        if ($PSBoundParameters.ContainsKey('Namespace')) {
            $nSpace = Get-GitLabNamespace | Where-Object {$_.path -eq "$Namespace"}
            if ($nSpace.id.Count -eq 1) {
                $Body.Add('namespace_id', $nSpace.id)
                $PSBoundParameters.Remove('Namespace') | Out-Null
            } else {
                throw "Error: No Namespace found"
        }

        foreach($p in $PSBoundParameters.GetEnumerator()) {
            if ($p.Key -eq 'visibility_level') {
                $vLevel = switch ($p.Value) {
                    'Private' {0}
                    'Internal' {10}
                    'Public' {20}
                }
                $Body.Add($p.Key, $vLevel)
            } else {
                $Body.Add($p.Key, $p.Value)
            }
        }

        $Request = @{
            URI='/projects';
            Method='POST';
            Body=$Body;
        }

        QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'
        }
    }
    catch {
        Write-Error $_
    }
}
