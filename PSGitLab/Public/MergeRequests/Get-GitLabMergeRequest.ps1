Function Get-GitLabMergeRequest {
[cmdletbinding(DefaultParameterSetName='MergeRequests')]
[OutputType('GitLab.MergeRequest')]
param (
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName='Single',Mandatory)]
    [Parameter(ParameterSetName='MergeRequests',Mandatory)]
    [string]$ProjectId,

    [Parameter(ParameterSetName='Single',Mandatory)]
    [string]$Id,

    [Parameter(ParameterSetName='MergeRequests')]
    # merge request iid
    [string]$Iid,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: all, merged, opened, closed
    [string]$State,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: created_at (default) and updated_at
    [string]$OrderBy,

    [Parameter(ParameterSetName='MergeRequests')]
    # possible values: asc and desc (default)
    [string]$Sort

)
    $Project = Get-GitlabProject -Id $ProjectId;

    if($PSCmdlet.ParameterSetName -ne 'Single') {
        $GetUrlParameters = @()

        if ($Iid) {
            $GetUrlParameters += @{iid=$Id}
        }
        if ($State) {
            $GetUrlParameters += @{state=$State}
        }
        if ($OrderBy) {
            $GetUrlParameters += @{order_by=$OrderBy}
        }
        if ($Sort) {
            $GetUrlParameters += @{sort=$Sort}
        }

        $URLParameters = GetMethodParameters -GetURLParameters $GetUrlParameters
    }


    $Request = @{
        URI = ''
        Method = 'GET'
    }

    Write-Verbose "Parameter Set Name: $($PSCmdlet.ParameterSetName)"

    switch ($PSCmdlet.ParameterSetName) {
        MergeRequests { $Request.URI="/projects/$($Project.id)/merge_requests$URLParameters"; break; }
        Single { $Request.URI="/projects/$($Project.id)/merge_requests/$Id"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.MergeRequest'
}
