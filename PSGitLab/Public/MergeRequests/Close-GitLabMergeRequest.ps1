Function Close-GitLabMergeRequest {
    [cmdletbinding()]
    param(
        [Alias('project_id')]
        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string]$ProjectId,

        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
        [string[]]$ID,

        [switch]$Passthru
    )

BEGIN {}

PROCESS {

    foreach ( $MergeRequestID in $ID ) {
        $Results = Set-GitLabMergeRequest -Project $ProjectId -Id $ID -StateEvent close

        if ( $Passthru.isPresent ) {
            $Results
        }
    }
}

END {}

}
