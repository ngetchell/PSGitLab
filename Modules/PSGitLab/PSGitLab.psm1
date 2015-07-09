$ConfigurationPath = $Env:AppData
$CommandPath = split-path $PSCommandPath -Parent

Function Save-GitLabAPIConfiguration {
    <#
    .Synopsis
       Used to store information about your GitLab instance. 
    .DESCRIPTION
       Used to store information about your GitLab instance. The domain and api token are given. 
    .EXAMPLE
       Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "Token"
    .NOTES
       Implemented using Export-CLIXML saving the configurations. Stores .xml in $env:appdata\GitLabAPI\
    #>
    [cmdletbinding()]
    param(
        [Parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        $Token,

        [Parameter(mandatory=$true,
                   HelpMessage="Please provide a URI to the GitLab installation")]
        [ValidateNotNullOrEmpty()]  
        [ValidatePattern("^(?:http|https):\/\/(?:[\w\.\-\+]+:{0,1}[\w\.\-\+]*@)?(?:[a-z0-9\-\.]+)(?::[0-9]+)?(?:\/|\/(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+)|\?(?:[\w#!:\.\?\+=&%@!\-\/\(\)]+))?$")]  
        $Domain 
    )

        $Parameters = @{
            Token=$Token;
            Domain=$Domain;
        }
        $ConfigPath = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
        if (-not (Test-Path (Split-Path $ConfigPath))) {
            New-Item -ItemType Directory -Path (Split-Path $ConfigPath) | Out-Null
        
        }
        $Parameters | Export-Clixml -Path $ConfigPath
}

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
    $Request,
    $ObjectType
)

    $GitLabConfig = ImportConfig
    $Domain = $GitLabConfig.Domain
    $Token = $GitLabConfig.Token
    
    try  {
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

Function Get-GitlabProjects {
[cmdletbinding()]
param(
    
    [switch]$archived = $false,

    [ValidateSet("id","name","path","created_at","updated_at","last_activity_at")]
    [string]$order_by = 'created_at',

    [ValidateSet("asc","desc")]    
    [string]$sort = 'desc',
    
    [string]$search = $null
)

    $GitlabAPI = ImportConfig

    $Headers = @{
        'PRIVATE-TOKEN'=$GitlabAPI.Token;
    }
    
    
    $Request = @{
        URI="$($GitlabAPI.Domain)/api/v3/projects";
        Method='Get';
        Headers=$Headers;
    }

    ## GET Method Paramters
    $GetUrlParameters = @()
    if ($archived) {
        $GetUrlParameters += @{archived='true'}
    }

    if ($search -ne $null) {
        $GetUrlParameters += @{search=$search}
    }
    $GetUrlParameters += @{order_by=$order_by}
    $GetUrlParameters += @{sort=$sort}
    $URLParamters = GetMethodParameters -GetURLParameters $GetUrlParameters
    $Request.URI = "$($Request.URI)" + "$URLParamters"

    QueryGitLabAPI -Request $Request -ObjectType "GitLab.Project" -Verbose
    

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