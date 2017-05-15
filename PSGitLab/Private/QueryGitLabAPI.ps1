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
               HelpMessage='Provide a switch if querying for commits.',
               Position=2)]
    [ValidateNotNullOrEmpty()]
    [switch]$isCommits
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
    # $totalPages = ($webContent).Headers['X-Total-Pages']
     $Results = $webContent.Content | ConvertFrom-Json
    # for ($i=1; $i -lt $totalPages; $i++) {
    #     $newRequest = $Request
    #     $newRequest.URI = $newRequest.URI + "&page=$($i+1)"
    #     $Results += (Invoke-WebRequest @newRequest).Content | ConvertFrom-Json
    # }
    if ($isCommits) {
        $i = 0
    } else {
        $i = 1
    }
    if ($Results -ne $null) {
        $more = $true
        do {
            $i++
            $newRequest = $Request
            $newRequest.Uri = $newRequest.URI + "&page=$i"
            $tempResults = (Invoke-WebRequest @newRequest).Content | ConvertFrom-Json
            if (!$tempResults) {
                $more = $false
                $Results += $tempResults
            } else {
                $Results += $tempResults
            }
        } while ($more)
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