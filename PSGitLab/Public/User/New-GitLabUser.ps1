Function New-GitLabUser {
    <#
    .SYNOPSIS
    Make a new users for your GitLab instance. 
    .DESCRIPTION
    Make a new users for your GitLab instance. 
    .EXAMPLE
    New-GitLabUser -Email 'fake@domain.com' -username 'fake' -name 'Fake User' -Password 'GitLabPassword'
    .PARAMETER email
    The email of the user.
    .PARAMETER Password
    The password for the user.
    .PARAMETER Username
    The username for the user.
    .PARAMETER Name
    The full name of the user.
    .PARAMETER SkypeID
    The SkypeID of the user.
    .PARAMETER linkedin
    The URL for the LinkedIn user profile.
    .PARAMETER Twitter
    The twitter handle of the user.
    .PARAMETER WebsiteURl
    The URL for the user's website.
    .PARAMETER ProjectsLimit
    To limit how many projects a user can have open.
    .PARAMETER Admin
    Make a user an admin.
    .PARAMETER CanCreateGroup
    Whether a user can create a group.
    .PARAMETER External
    External UID.
    .PARAMETER Passthru
    To return the user to the pipeline. 
    #>
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
        [int]$ProjectsLimit = 0,
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

    if ($SkypeID -ne $null ) { $Body.Add('skype',$SkypeID) }
    if ($LinkedIn -ne $null ) { $Body.Add('linkedin',$LinkedIn) }
    if ($Twitter -ne $null ) { $Body.Add('twitter',$Twitter) }
    if ($WebsiteURL -ne $null ) { $Body.Add('website_url',$WebsiteURL) }
    if ($ProjectsLimit -ne $null ) { $Body.Add('projects_limit',$ProjectsLimit) }
    if ($Admin.IsPresent ) { $Body.Add('admin','true') }
    if ($CanCreateGroup.IsPresent ) { $Body.Add('can_create_group','true') }
    if ($External.IsPresent ) { $Body.Add('external','true') }

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