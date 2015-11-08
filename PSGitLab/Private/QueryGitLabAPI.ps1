Function QueryGitLabAPI {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true,
               HelpMessage='A hash table used for splatting against invoke-restmethod.',
               Position=0)]
    [ValidateNotNullOrEmpty()]
    $Request,

    [Parameter(Mandatory=$false,
               HelpMessage='Provide a datatype for the returing objects.',
               Position=1)]
    [ValidateNotNullOrEmpty()]
    [string]$ObjectType
)

$GitLabConfig = ImportConfig
$Domain = $GitLabConfig.Domain
$Token = $GitLabConfig.Token

$Headers = @{
    'PRIVATE-TOKEN'=$Token;
}

$Request.Add('Headers',$Headers)
$Request.URI = "$Domain/api/v3" + $Request.URI

try  {
    Write-Verbose "URL: $($Request.URI)"
    $Results = Invoke-RestMethod @Request
} catch {
    $ErrorMessage = $_.exception.response.statusDescription
    Write-Warning  -Message "$ErrorMessage. See $Domain/help/api/README.md#status-codes for more information."
}

foreach ($Result in $Results) {
    $Result.pstypenames.insert(0,$ObjectType)
    Write-Output $Result
}
}
