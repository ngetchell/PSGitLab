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
$Token = DecryptString -Token $GitLabConfig.Token

$Headers = @{
    'PRIVATE-TOKEN'=$Token;
}

$Request.Add('Headers',$Headers)
$Request.URI = "$Domain/api/v3" + $Request.URI

try  {
    Write-Verbose "URL: $($Request.URI)"
    $webContent = Invoke-WebRequest @Request
    $totalPages = ($webContent).Headers['X-Total-Pages']
    $Results = $webContent.Content | ConvertFrom-Json
    for ($i=1; $i -lt $totalPages; $i++) {
        $newRequest = $Request
        $newRequest.URI = $newRequest.URI + "&page=$($i+1)"
        $Results += (Invoke-WebRequest @newRequest).Content | ConvertFrom-Json
    }
    Remove-Variable Token
    Remove-Variable Headers
    Remove-Variable Request
} catch {
    $ErrorMessage = $_.exception.response.statusDescription
    Write-Warning  -Message "$ErrorMessage. See $Domain/help/api/README.md#status-codes for more information."
}

foreach ($Result in $Results) {
    $Result.pstypenames.insert(0,$ObjectType)
    Write-Output $Result
}
}