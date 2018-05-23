Function QueryGitLabAPI {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory=$true,
                   HelpMessage='A hash table used for splatting against Invoke-WebRequest.',
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
        [string]$Version = 'v4'
    )
    
    $GitLabConfig = ImportConfig
    
    if ($GitLabConfig.APIVersion) { $Version = "v$($GitLabConfig.APIVersion)" }
    
    $Domain = $GitLabConfig.Domain
    if ( $IsWindows -or ( [version]$PSVersionTable.PSVersion -lt [version]"5.99.0" ) ) {
        $Token = DecryptString -Token $GitLabConfig.Token
    } elseif ( $IsLinux -or $IsMacOS ) {
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
        $totalPages = if ($webContent.Headers.ContainsKey('X-Total-Pages')) {
            ($webContent).Headers['X-Total-Pages'][0] -as [int]
        } else { 0 }        
        $bytes = $webContent.Content.ToCharArray() | Foreach-Object{ [byte]$_ }
        $Results = [Text.Encoding]::UTF8.GetString($bytes) | ConvertFrom-Json
        for ($i=1; $i -lt $totalPages; $i++) {
            $newRequest = $Request.PSObject.Copy()
            if ( $newRequest['URI'] -match '`?') {
                $newRequest.URI = $newRequest.URI + "&page=$($i+1)"
            }
            else {
                $newRequest.URI = $newRequest.URI + "?page=$($i+1)"
            }
            $Results += (Invoke-WebRequest @newRequest).Content | ConvertFrom-Json
        }
        Remove-Variable -Name Token
        Remove-Variable -Name Headers
        Remove-Variable -Name Request
    } catch {
        $ErrorMessage = $_.exception.response.statusDescription
        Write-Warning  -Message "$ErrorMessage. See $Domain/help/api/README.md#status-codes for more information."
    }
    finally {
        Remove-Variable -Name newRequest -ErrorAction SilentlyContinue
    }
    
    foreach ($Result in $Results) {
        $Result.pstypenames.insert(0,$ObjectType)
        Write-Output $Result
    }

}
