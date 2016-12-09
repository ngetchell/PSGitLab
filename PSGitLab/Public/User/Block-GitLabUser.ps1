Function Block-GitLabUser {
    <#
    .SYNOPSIS
    Gives you the ability to block users in GitLab.
    .DESCRIPTION
    Gives you the ability to block users in GitLab. Can be done by parameter or by pipeline. 
    .EXAMPLE
    Block-GitLabUser -Username fake
    .EXAMPLE
    Block-GitLabUser -Email fake@email.com
    .EXAMPLE
    Block-GitLabUser -ID 22
    .EXAMPLE
    Get-GitLabUser -Username fake | Block-GitLabUser
    .PARAMETER Id
    The GitLab user ID.
    .PARAMETER Username
    The username of the user to be blocked.
    .PARAMETER Email
    The email of the user to be blocked.
    .PARAMETER Passthru
    Return the blocked user to the pipeline.
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
            URI = "/users/$($User.ID)/block"
            Method = 'PUT'
        }

        $null = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.User' 
        if ($Passthru.IsPresent) {
            Get-GitLabuser -id $User.ID
        }    

    }

    END {}



}