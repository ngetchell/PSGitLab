Function Unblock-GitLabUser {
    <#
    .SYNOPSIS
    Used to unblock gitlab users. 
    .DESCRIPTION
    Used to unblock gitlab users.  Can be done form the parameters or from the pipeline.
    .EXAMPLE
    Unlock-GitLabUser -ID 22
    .EXAMPLE
    Unlock-GitLabUser -Email fake@email.com
    .EXAMPLE
    Unlock-GitLabUser -Username fake
    .EXAMPLE
    Get-GitLabUser -Username fake | Unblock-GitLabUser
    .PARAMETER ID
    The user ID.
    .PARAMETER Username
    The username for the user.
    .PARAMETER Email
    The email address for the user.
    .PARAMETER Passthru
    To return the unblocked user to the pipeline.
    #>
    [cmdletbinding(DefaultParameterSetName='ID')]
    param(
        [Parameter(Mandatory=$True,
                   ParameterSetName='ID',                   
                   ValueFromPipelineByPropertyName=$true)]
        [string]$ID,

        [Parameter(Mandatory=$True,
                   ParameterSetName='Username')]
        [string]$Username,

        [Parameter(Mandatory=$True,
                   ParameterSetName='Email')]
        [string]$Email,

        [switch] $Passthru = $false
    )

    BEGIN {}

    PROCESS {

        Write-Verbose "$ID"
        switch ($PSCmdlet.ParameterSetName) {
            'ID' { $User = Get-GitLabUser -ID $ID }
            'Email' { $User = Get-GitLabUser -ID $Email }
            'Username' { $User = Get-GitLabUser -ID $Username }
        }

        $request = @{
            URI = "/users/$($User.ID)/unblock"
            Method = 'PUT'
        }

        $null = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User' 
        if ($Passthru.IsPresent) {
            Get-GitLabuser -id $User.ID
        }    

    }

    END {}


}