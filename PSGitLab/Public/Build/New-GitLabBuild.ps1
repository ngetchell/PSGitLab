Function New-GitLabBuild {
<#
.SYNOPSIS
Triggers a build
.DESCRIPTION
Triggers a build
.EXAMPLE
PS U:\> New-GitLabBuild -Id 18 -Reference 'master' -Variable "GENERATE_SCRIPTS" -Value "true"

id variables               
-- ---------               
 6 @{GENERATE_SCRIPTS=true}
.PARAMETER ProjectID
The ID of a project
.PARAMETER Reference
Which branch branch to run the build against. 
.PARAMETER Token
The user token.
.PARAMETER Variable
The build variable for this build.
.PARAMETER Value
The value of the build variable.
#>

[cmdletbinding()]
param(
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName="Default",Mandatory=$true)]
    [Parameter(ParameterSetName="Variable",Mandatory=$true)]
    [int]$ProjectId,
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName="Default",Mandatory=$true)]
    [Parameter(ParameterSetName="Variable",Mandatory=$true)]
    [string]$Reference,
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName="Default",Mandatory=$true)]
    [Parameter(ParameterSetName="Variable",Mandatory=$true)]
    [string]$token,
    [Parameter(ParameterSetName="Variable",Mandatory=$true)]
    [string]$Variable,
    [Parameter(ParameterSetName="Variable",Mandatory=$true)]
    [string]$Value
)
    $LF = "`r`n"
    $uri = "http://gitlab.columbia.csc/api/v3/projects/$ProjectId/trigger/builds"
    $boundary = [System.Guid]::NewGuid().ToString()

    $bodyLines =
        "--$boundary$LF" +
        "Content-Disposition: form-data; name=`"token`"$LF" +
        "Content-Type: 'multipart/form-data'$LF$LF" +
        "$token$LF" +
        "--$boundary$LF" +
        "Content-Disposition: form-data; name=`"ref`"$LF" +
        "Content-Type: 'multipart/form-data'$LF$LF" +
        "$Reference$LF"

    if ($Variable) {
        $Variable = "variables[$Variable]"
        $bodyLines +=
            ("--$boundary$LF" +
            "Content-Disposition: form-data; name=`"$Variable`"$LF" +
            "Content-Type: multipart/form-data$LF$LF" +
            "$Value$LF")
    }
    $bodyLines += "--$boundary--$LF"
    
    try {
        $result = Invoke-RestMethod -Uri $uri -Method Post -ContentType "multipart/form-data; boundary=`"$boundary`"" -Body $bodyLines
        Write-Debug $result
        Write-Output "Build trigger sent successfully"
    }
    catch {
        Write-Output ($x.ErrorDetails.Message | convertfrom-json).message
    }
}