Function Get-GitLabRunner {
    [cmdletbinding(DefaultParameterSetName='Single')]
    [OutputType("GitLab.Runner")]
    param(
        [Parameter(ParameterSetName='Single',
                   Mandatory=$true)]
        [int]$Id,

        [Parameter(ParameterSetName='Project',
                   Mandatory=$true)]
        [int]$ProjectId,

        [Parameter(ParameterSetName='Owned',
                   Mandatory=$true)]
        [switch]$Owned,

        [Parameter(ParameterSetName='All',
                   Mandatory=$true)]
        [switch]$All,
        
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by scope',
                   ParameterSetName='Owned')]
        [Parameter(Mandatory=$false,
                   HelpMessage='Limit by scope',
                   ParameterSetName='All')]
        [ValidateSet("active", "paused", "online")]
        $Scope = $null
    )

    if ($PSCmdlet.ParameterSetName -ne 'Single') {
        Write-Verbose "Create GET Request"
        $GetUrlParameters = @()
        if ($Scope) {
            $GetUrlParameters += @{scope=$Scope}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
        Write-Host $URLParameters
    }

    $Request = @{
        URI = ''
        Method = 'GET'
    }

    Write-Verbose "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        Single { $Request.URI = "/runners/$Id"; break; }
        Owned { $Request.URI = "/runners/$URLParameters"; break; }
        All { $Request.URI="/runners/all$URLParameters"; break; }
        Project { $Request.URI="/projects/$ProjectId/runners"; break; }
    }
    
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Runner'
}