Function New-GitLabGroup
{
	[cmdletbinding(DefaultParameterSetName = 'Groups')]
	[OutputType("GitLab.Group")]
	param(
		[Parameter(Mandatory = $true)]
		$Name,

		[Parameter(Mandatory = $true)]
		$Path,

		[Parameter(Mandatory = $false)]
		$Description,

		[Parameter(Mandatory = $false)]
		[ValidateSet("public", "internal", "private")]
		$Visibility = 'private',

		[Parameter(Mandatory = $false)]
		$Parent_Id
	)

	
	$Body = @{
		name = $Name
		path = $Path
		visibility = $Visibility
	}
		
    if($Description -ne $null ) { $Body.Add('description',$Description) }
    if($Parent_Id -ne $null ) { $Body.Add('parent_id',$Parent_Id) }

	$Request = @{
		URI = '/groups'
		Method = 'POST'
		Body = $Body
	}

	QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'
}
