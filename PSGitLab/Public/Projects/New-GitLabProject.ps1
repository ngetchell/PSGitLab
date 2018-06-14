Function New-GitLabProject {
    [cmdletbinding()]
    param(
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [Alias('Path')]
        [string]$name,
        [Parameter(Mandatory=$true)]
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
