Function Set-GitLabUser {
    <#
    .SYNOPSIS
    Modify users already created in your GitLab instance. 
    .DESCRIPTION
    Modify users already created in your GitLab instance. Useful for making someone an admin from the command line. 
    .EXAMPLE
    Set-GitLabUser -Email FakeEmail@example.com -Twitter 'newtwitterID'
    .EXAMPLE
    Set-GitLabUser -Username FakeUserName -Admin
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
    .PARAMETER ID
    The ID of the user.
    .PARAMETER NewUsername
    The new username for the given user. 
    #>
    [cmdletbinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true,ParameterSetName='ID')]
        [string]$ID,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true,ParameterSetName='Email')]
        [string]$Email,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory=$true,ParameterSetName='Username')]
        [string]$Username,        

        #[string]$NewEmail = $null,     
        [string]$Password = $null,    
        [string]$NewUsername = $null,        
        [string]$Name = $null,
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

    switch ($PScmdlet.ParameterSetName ) {
        'Email' { $User = Get-GitLabUser -Email $Email }
        'Username' { $User = Get-GitLabUser -Username $UserName }
        'ID' { $User = Get-GitLabUser -id $ID }
    }

    $Body = @{}

    #if ($NewEmail -ne $null ) { $Body.Add('email',$NewEmail) }
    if ($Password -ne $null ) { $Body.Add('password',$Password) }
    if ($NewUsername -ne $null ) { $Body.Add('username',$NewUsername) }
    if ($Name -ne $null ) { $Body.Add('name',$Name) }
    if ($SkypeID -ne $null ) { $Body.Add('skype',$SkypeID) }
    if ($LinkedIn -ne $null ) { $Body.Add('linkedin',$LinkedIn) }
    if ($Twitter -ne $null ) { $Body.Add('twitter',$Twitter) }
    if ($WebsiteURL -ne $null ) { $Body.Add('website_url',$WebsiteURL) }
    if ($ProjectsLimit -ne 0 ) { $Body.Add('projects_limit',$ProjectsLimit) }
    if ($Admin.IsPresent ) { $Body.Add('admin','true') }
    if ($CanCreateGroup.IsPresent ) { $Body.Add('can_create_group','true') }
    if ($External.IsPresent ) { $Body.Add('external','true') }

    $Request = @{
        URI = "/users/$($User.ID)"
        Method = 'PUT'
        Body = $Body 
        ContentType = 'application/x-www-form-urlencoded'
    }

    #Write-Debug -Message "Before Request"
    Write-Verbose "Body: $( $Body | ConvertTo-Json ) "

    $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
    if ($Passthru.IsPresent) {
        $Results
    }
}