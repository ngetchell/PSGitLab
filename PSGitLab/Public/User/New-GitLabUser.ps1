Function New-GitLabUser {
    [CmdletBinding()]
    param (
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Email,

        [ValidateNotNullOrEmpty()]
        [ValidatePattern("(?# Error: Password Must Contain at least 8 characters).{8,}")]
        [Parameter(Mandatory=$true)]
        [string]$Password,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Username,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [string]$SkypeID = $null,
        [string]$LinkedIn = $null,
        [string]$Twitter = $null,
        [string]$WebsiteURL = $null,
        [int]$ProjectsLimit = $null,
        [switch]$Admin = $false,
        [switch]$CanCreateGroup = $false,
        [switch]$External = $false,
        [switch]$Passthru = $false
    )

    $Body = @{
        email = $Email
        password = $Password
        username = $Username
        name = $Name
    }

    $user = Get-GitLabUser -Username $UserName

    if ($user) {
        Write-Warning "$UserName already exists. Skipping..."
    } else {
        if ($PSBoundParameters.ContainsKey('SkypeID')) { $Body.Add('skype',$SkypeID) }
        if ($PSBoundParameters.ContainsKey('LinkedIn')) { $Body.Add('linkedin',$LinkedIn) }
        if ($PSBoundParameters.ContainsKey('Twitter')) { $Body.Add('twitter',$Twitter) }
        if ($PSBoundParameters.ContainsKey('WebsiteURL')) { $Body.Add('website_url',$WebsiteURL) }
        if ($PSBoundParameters.ContainsKey('ProjectsLimit')) { $Body.Add('projects_limit',$ProjectsLimit) }
        if ($Admin.IsPresent) { $Body.Add('admin','true') }
        if ($CanCreateGroup.IsPresent) { $Body.Add('can_create_group','true') }
        if ($External.IsPresent) { $Body.Add('external','true') }

        $Request = @{
            URI = '/users'
            Method = 'POST'
            Body = $Body
        }

        $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
        if ($Passthru.IsPresent) {
            $Results
        }
    }
}