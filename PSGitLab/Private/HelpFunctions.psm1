Function ImportConfig {
    <#
    .Synopsis
       Check for configuration and output the information.
    .DESCRIPTION
       Check for configuration and output the information. Goes into the $env:appdata for the configuration file. 
    .EXAMPLE
        ImportConfig
    #>
    $ConfigFile = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
    if (Test-Path $ConfigFile) {
        Import-Clixml $ConfigFile
        
    } else {
        Write-Warning "No Saved Configration Information. Run Save-GitLabAPIConfiguration."
        break;
    }
    
}

Function QueryGitLabAPI {
[cmdletbinding()]
param(
    [Parameter(Mandatory=$true,
               HelpMessage="A hash table used for splatting against invoke-restmethod.",
               Position=0)]
    [ValidateNotNullOrEmpty()]   
    $Request,

    [Parameter(Mandatory=$false,
               HelpMessage="Provide a datatype for the returing objects.",
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

    $Request.Add("Headers",$Headers)
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

Function GetMethodParameters {
    [cmdletbinding()]
    param(
        $GetURLParameters
    )

    $string = '?'
    foreach ($Param in $GetUrlParameters) {
        $Param.Keys | ForEach-Object {
            $key = $_
            $value = $Param[$_]
        }
        $string += "&$key=$value"
    }
    $string = $string -replace '\?&',"?"
    Write-Output $string
}
