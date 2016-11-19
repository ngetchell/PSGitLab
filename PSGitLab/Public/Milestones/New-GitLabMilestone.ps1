Function New-GitLabMilestone {
    <#
    .SYNOPSIS
    Creates a new milestone. Uses the user namespace. 
    .DESCRIPTION
    Creates a new milestone. Uses the user namespace. This uses the v3 GitLab API.  
    .EXAMPLE
    New-GitLabMilestone -ProjectId 8 -Title "2016-KW30" -Description "MyDescription" -DueDate (Get-Date).AddDays(10)
    #>
    [cmdletbinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$ProjectId,

        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string]$Title,

        [string]$Description,
        
        [datetime]$DueDate
    )

    $Project = $Project = Get-GitlabProject -Id $ProjectId;

    $GetUrlParameters = @()
    $GetUrlParameters += @{title=$Title}

    if ($Description) {
        $GetUrlParameters += @{description=$Description}
    }
    if ($DueDate) {
        $GetUrlParameters += @{due_date=($DueDate).ToString("yyyy-MM-dd")}
    }

    $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters

    $Request = @{
        URI="/projects/$($Project.id)/milestones$URLParameters";
        Method='POST';
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Milestone'
}
