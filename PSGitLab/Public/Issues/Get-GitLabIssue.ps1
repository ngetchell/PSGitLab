Function Get-GitLabIssue {
    [cmdletbinding(DefaultParameterSetName='User')]
    [OutputType('GitLab.Issue')]
    param(
        [Parameter(ParameterSetName='GroupID')]
        [Int]$GroupID,

        [Parameter(ParameterSetName='User')]
        [Parameter(ParameterSetName='GroupID')]
        [ValidateSet('All','CreatedByMe','AssignedToMe')]
		[String]$Scope,
 
        [Parameter(ParameterSetName='User')]
        [Parameter(ParameterSetName='GroupID')]
        [ValidateSet("opened", "closed")]
        [String]$State 
	)
	
    $Request = @{
        URI = '/issues'
        Method = 'GET'
    }

    # https://docs.gitlab.com/ee/api/issues.html

    $GetUrlParameters = @()
    
    if($State)
    {
        $GetUrlParameters += @{state=$State}
    }

    if($Scope)
    {
        # Set the expected API value for the scope. Kebab case will change in Gitlab 11.
        if($Scope -eq 'CreatedByMe') { 
            $GetUrlParameters += @{scope='created-by-me'} 
        }
        elseif($Scope -eq 'AssignedToMe') {
            $GetUrlParameters += @{scope='assigned-to-me'}
        }
        elseif($Scope -eq 'all') {
            $GetUrlParameters += @{scope='all'}
        }
        else {
        }
    }
    else {
        # Defaults to issues 'created' by the user. 
    }

    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
		
	switch($PSCmdlet.ParameterSetName) {
        'GroupID' { $Request.URI = "/groups/$GroupID/issues$URLParameters"; break; }
        'User' { $Request.URI = "/issues$URLParameters"; break; }
    }
 
	QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Issue'
}