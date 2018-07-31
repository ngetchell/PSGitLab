# Source: https://github.com/devblackops/POSHOrigin/blob/master/build.ps1

[cmdletbinding()]
param(
    [string[]]$Task = 'Pre-Commit'
)
if ($IsWindows) {
    if ( -not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator") ) {
        Write-Error "Build Script Requires Admin Rights"
        break;
    }
}

function Resolve-Module {
    [Cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$Name
    )

    Process {
        foreach ($ModuleName in $Name) {
            $Module = Get-Module -Name $ModuleName -ListAvailable
            Write-Verbose -Message "Resolving Module [$($ModuleName)]"

            if ($Module) {
                $Version = $Module | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum
                $GalleryVersion = Find-Module -Name $ModuleName -Repository PSGallery -Verbose:$false |
                    Measure-Object -Property Version -Maximum |
                    Select-Object -ExpandProperty Maximum

                if ($Version -lt $GalleryVersion) {
                    Write-Verbose -Message "$($ModuleName) Installed Version [$($Version.tostring())] is outdated. Installing Gallery Version [$($GalleryVersion.tostring())]"

                    Install-Module -Name $ModuleName -Verbose:$false -Force -Repository PSGallery
                    Import-Module -Name $ModuleName -Verbose:$false -Force -RequiredVersion $GalleryVersion
                }
                else {
                    Write-Verbose -Message "Module Installed, Importing [$($ModuleName)]"
                    Import-Module -Name $ModuleName -Verbose:$false -Force -RequiredVersion $Version
                }
            }
            else {
                Write-Verbose -Message "[$($ModuleName)] Missing, installing Module"
                Install-Module -Name $ModuleName -Verbose:$false -Force -Repository PSGallery
                Import-Module -Name $ModuleName -Verbose:$false -Force -RequiredVersion $Version
            }
        }
    }
}

Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

'BuildHelpers', 'InvokeBuild', 'Pester', 'PSDeploy', 'PSScriptAnalyzer', 'PlatyPS' | Resolve-Module

Invoke-Build $Task
