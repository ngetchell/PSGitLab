$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\$ModuleName\$ModuleName.psd1"

Import-Module $ModuleManifest

Get-Command -Module $ModuleName | ForEach-Object {
    Describe "Checking Help for $_" -Tags 'Help' {
        It "Synopsis" {
            Get-Help $_ | Select-Object -ExpandProperty synopsis | should not benullorempty
        }
        It "Description" {
            Get-Help $_ | Select-Object -ExpandProperty Description | should not benullorempty
        }
        It "Examples" {
            
            $Examples = Get-Help $_ | Select-Object -ExpandProperty Examples | Measure-Object 
            $Examples.Count -gt 0 | Should be $true
        }
    }
}

Describe "Module Information" -Tags 'Command'{
    It "Valid Module Manifest" {
        {
            $Script:Manifest = Test-ModuleManifest -Path $ModuleManifest -ErrorAction Stop -WarningAction SilentlyContinue
        } | Should Not Throw
    }
    It 'Valid Manifest Name' {
        $Script:Manifest.Name | Should be $ModuleName
    }
    It "Generic Version Check" {
        $Script:Manifest.Version -as [Version] | Should Not BeNullOrEmpty
    }
    It 'Valid Manifest Description' {
        $Script:Manifest.Description | Should Not BeNullOrEmpty
    }
    It 'Valid Manifest Root Module' {
        $Script:Manifest.RootModule | Should Be "$ModuleName.psm1"
    }
}    

Remove-Module $ModuleName