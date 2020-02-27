Function Set-GitLabUser {
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
        [int]$ProjectsLimit = $null,
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

    if ( -not $User ) {
        Write-Error "User does not exist"
    }

    $Body = @{}

    #if ($NewEmail) { $Body.Add('email',$NewEmail) }
    if ($PSBoundParameters.ContainsKey('Password')) { $Body.Add('password',$Password) }
    if ($PSBoundParameters.ContainsKey('NewUsername')) { $Body.Add('username',$NewUsername) }
    if ($PSBoundParameters.ContainsKey('Name')) { $Body.Add('name',$Name) }
    if ($PSBoundParameters.ContainsKey('SkypeID')) { $Body.Add('skype',$SkypeID) }
    if ($PSBoundParameters.ContainsKey('LinkedIn')) { $Body.Add('linkedin',$LinkedIn) }
    if ($PSBoundParameters.ContainsKey('Twitter')) { $Body.Add('twitter',$Twitter) }
    if ($PSBoundParameters.ContainsKey('WebsiteURL')) { $Body.Add('website_url',$WebsiteURL) }
    if ($PSBoundParameters.ContainsKey('ProjectsLimit')) { $Body.Add('projects_limit',$ProjectsLimit) }
    if ($Admin.IsPresent) { $Body.Add('admin','true') }
    if ($CanCreateGroup.IsPresent) { $Body.Add('can_create_group','true') }
    if ($External.IsPresent) { $Body.Add('external','true') }
    $Request = @{
        URI = "/users/$($User.ID)"
        Method = 'PUT'
        Body = $Body
        ContentType = 'application/x-www-form-urlencoded'
    }

    Write-Verbose "Body: $( $Body | ConvertTo-Json ) "

    $Results = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User'
    if ($Passthru.IsPresent) {
        $Results
    }
}
