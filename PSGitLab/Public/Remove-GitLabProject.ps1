Function Remove-GitLabProject {
[cmdletbinding(SupportsShouldProcess=$True,ConfirmImpact="High")]
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

    $Project = Get-GitlabSingleProject -Id $Id

    if ($PSCmdlet.ShouldProcess($Project.Name, "Delete Project")) {
        $Worked = QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project"
    }



}
