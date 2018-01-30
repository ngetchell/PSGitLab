Function Set-GitLabRunner {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Id,
        
        [string]$Description,
        
        # See http://itproctology.blogspot.be/2014/03/powershell-passing-empty-parameters-and.html
        # for the rationale for this
        [ValidateSet("True","False","", 0, 1)]
        [string]$Active,
        [string]$Tags,
        
        [ValidateSet("True","False","", 0, 1)]
        [string]$RunUntagged,
        
        [ValidateSet("True","False","", 0, 1)]
        [string]$Locked,

        [ValidateSet("not_protected", "ref_protected")]
        [string]$AccessLevel)

    $Body = @{}

    
    if ($Description) { $Body.Add('description',$Description) }
    if ($Active) { $Body.Add('active',$active) }
    if ($Tags) { $Body.Add('tag_list', $Tags) }
    if ($RunUntagged) { $Body.Add('run_untagged', $RunUntagged) }
    if ($Locked) {$Body.Add('locked', $Locked) }
    if ($AccessLevel) { $Body.Add('access_level', $AccessLevel) }

    Write-Host (ConvertTo-Json $Body)

    $Request = @{
        URI="/runners/$Id";
        Method='PUT';
        Body=$Body;
        ContentType='application/x-www-form-urlencoded';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}