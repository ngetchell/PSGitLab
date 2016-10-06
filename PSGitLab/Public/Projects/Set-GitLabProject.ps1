Function Set-GitLabProject 
{
    <#
    .SYNOPSIS
    Modify your GitLab projects.
    .DESCRIPTION
    Modify your GitLab projects. Useful for changing the names or changing the visibility of your project. 
    .EXAMPLE
    Set-GitLabProject -Id 32 -Name "NewName"
    .EXAMPLE
    Get-GitLabProject  | Set-GitLabProject -Description 'Fake Description' 
    #>
    [cmdletbinding()]
    param(
        
        [ValidateNotNullOrEmpty()]
        [Parameter(
            Mandatory=$true,
            ParameterSetName='ID',
            ValueFromPipelineByPropertyName=$true
        )]
        [string[]]$ID,

        [string]$Name = $null,

        [string]$Path = $null,

        [string]$Description = $null,

        #$default_branch,

        #[Alias('issues_enabled')]
        #[switch]$IssuesEnabled = $false,
        #$merge_requests_enabled,
        #$wiki_enabled,
        #$snippets_enabled,
        #$public,
        
        [Alias('visibility_level')]
        [ValidateSet("Public", "Internal", "Private")]
        $VisabilityLevel = $null,

        [switch]$Passthru

    )

BEGIN {} 

PROCESS {

    foreach ( $ProjID in $ID ) {
        $Project = Get-GitLabProject -Id $ProjID

        Write-Verbose "Project Name: $($Project.Name)"

        $Body = @{}

        if ($Name -ne $null) { $Body.Add('name',$Name) }
        if ($Path -ne $null) { $Body.Add('path',$Path) }
        if ($Description -ne $null) { $Body.Add('description',$Description) }
        if ($VisabilityLevel -ne $null ) { $Body.Add('visibility_level', (GetVisibilityLevel $VisabilityLevel) )}

        Write-Verbose ( $PSBoundParameters | ConvertTo-Json )

        Write-Verbose "Body: $($Body | ConvertTo-Json )"

        $Request = @{
            URI = "/projects/$($Project.ID)"
            Method = 'PUT'
            Body = $Body
            ContentType = 'application/x-www-form-urlencoded'
        }

        $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'

        if ( $Passthru.isPresent ) {
            $Results
        }
    }
}

END {}

}