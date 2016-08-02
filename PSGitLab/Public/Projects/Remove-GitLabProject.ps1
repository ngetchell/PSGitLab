Function Remove-GitLabProject {
<#
.SYNOPSIS
Deletes a GitLab project.
.DESCRIPTION
Deletes a GitLab project. Can only be done by ID. Supports should process.
.EXAMPLE
Remove-GitLabProject -Id 99
#>
[cmdletbinding(SupportsShouldProcess=$True,ConfirmImpact='High')]
param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory=$true,
               ValueFromPipelineByPropertyName=$true)]
    [string]$Id
)

    $Request = @{
        URI="/projects/$ID";
        Method='Delete';
    }

    $Project = Get-GitLabProject -Id $Id

    if ($PSCmdlet.ShouldProcess($Project.Name, 'Delete Project')) {
        $Worked = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project'
    }



}
