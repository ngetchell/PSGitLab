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
    [string]$ObjectType,

    [Parameter(Mandatory=$false,
               HelpMessage='Provide API version to use',
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [string]$Version = 'v3'
)

$GitLabConfig = ImportConfig
$Domain = $GitLabConfig.Domain
if ( $IsWindows -or ( [version]$PSVersionTable.PSVersion -lt [version]"5.99.0" ) ) {
    $Token = DecryptString -Token $GitLabConfig.Token
} elseif ( $IsLinux ) {
    $Token = $GitLabConfig.Token
}
$Headers = @{
    'PRIVATE-TOKEN'=$Token;
}

$Request.Add('Headers',$Headers)
$Request.URI = "$Domain/api/$Version" + $Request.URI
$Request.UseBasicParsing = $true

try  {
    Write-Verbose "URL: $($Request.URI)"
    $webContent = Invoke-WebRequest @Request
    $totalPages = ($webContent).Headers['X-Total-Pages'] -as [int]
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