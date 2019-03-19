$ModuleName = 'PSGitLab'
Get-Module $ModuleName | Remove-Module
if ($env:APPVEYOR -eq 'True') {
    $ModulePath = "$PSScriptRoot\..\Release\$ModuleName.psd1"
}
else {
    $ModulePath = "$PSScriptRoot\..\PSGitLab\"
}

Import-Module $ModulePath

Get-Command -Module $ModuleName | Where-Object { $_.CommandType -ne 'Alias' } | ForEach-Object {
    Describe "$_" -Tags "$_","Help" {
        Context "Function Help" {
            It 'Synopsis not empty' {
                Get-Help $_ | Select-Object -ExpandProperty synopsis | should not benullorempty
            }
            It "Synopsis should not be auto-generated" -Skip:$( $isLinux ){
                Get-Help $_ | Select-Object -ExpandProperty synopsis | Should Not BeLike '*`[`<CommonParameters`>`]*'
            }

            It 'Description not empty' -Skip:$( $isLinux ) {
                Get-Help $_ | Select-Object -ExpandProperty Description | should not benullorempty
            }
            It 'Examples Count greater than 0' -Skip:$( $isLinux ) {

                $Examples = Get-Help $_ | Select-Object -ExpandProperty Examples | Measure-Object
                $Examples.Count -gt 0 | Should be $true
            }
        }

        Context "PlatyPS Default Help" {
            It "Synopsis should not be auto-generated - Platyps default"  {
                Get-Help $_ | Select-Object -ExpandProperty synopsis | Should Not BeLike '*{{Fill in the Synopsis}}*'
            }
            It "Description should not be auto-generated - Platyps default" {
                Get-Help $_ | Select-Object -ExpandProperty Description | Should Not BeLike '*{{Fill in the Description}}*'
            }
            It "Example should not be auto-generated - Platyps default" {
                Get-Help $_ | Select-Object -ExpandProperty Examples | Should Not BeLike '*{{ Add example code here }}*'
            }
        }

        Context "Parameter Help" {
            # Parameter Help
            $HelpObjects = Get-Help $_ | Select-Object -ExpandProperty Parameters
            if ( $HelpObjects -ne $null) {
                $Parameters = $HelpObjects.Parameter
                foreach ($Parameter in $Parameters.Name) {
                    $ParameterHelp = $Parameters | Where-Object { $_.name -eq $Parameter }

                    It "Parameter Help for $Parameter" -Skip:$( $isLinux ) {
                        $ParameterHelp.description.text | Should not benullorempty
                    }
                }
            }

        }

        # Output Type if Verb is 'Get'
        if ( $_.Verb -eq "Get") {
            Context "OutputType - $_" {
                It "OutputType Present on verb Get" {
                    (Get-Command $_).OutputType | Should not benullorempty
                }
            }
        }

    }
}

Describe 'Module Information' -Tags 'Command'{
    $ModuleManifest = Resolve-Path "$PSScriptRoot\..\Release\$ModuleName.psd1"
    Context 'Manifest Testing' { 
        It 'Valid Module Manifest' {
            {
                $Script:Manifest = Test-ModuleManifest -Path $ModuleManifest -ErrorAction Stop -WarningAction SilentlyContinue
            } | Should Not Throw
        }

        It 'Test-ModuleManifest' {
          Test-ModuleManifest -Path $ModuleManifest
          $? | Should Be $true
        }

        It 'Valid Manifest Name' {
            $Script:Manifest.Name | Should be $ModuleName
        }
        It 'Generic Version Check' {
            $Script:Manifest.Version -as [Version] | Should Not BeNullOrEmpty
        }
        It 'Valid Manifest Description' {
            $Script:Manifest.Description | Should Not BeNullOrEmpty
        }
        It 'Valid Manifest Root Module' {
            $Script:Manifest.RootModule | Should Be "$ModuleName.psm1"
        }
        It 'Valid Manifest GUID' {
            ($Script:Manifest.guid).gettype().name | Should be 'Guid'
        }
        It 'No Format File' {
            $Script:Manifest.ExportedFormatFiles | Should not BeNullOrEmpty
        }

        It 'Required Modules' {
            $Script:Manifest.RequiredModules | Should BeNullOrEmpty
        }
    }

    Context 'Exported Functions' {
        It 'Proper Number of Functions Exported' {
            $ExportedCount = Get-Command -Module $ModuleName | Where-Object { $_.CommandType -ne 'Alias' } | Measure-Object | Select-Object -ExpandProperty Count
            $FileCount = Get-ChildItem -Path "$PSScriptRoot\..\$ModuleName\Public" -Filter *.ps1 -Recurse | Measure-Object | Select-Object -ExpandProperty Count

            $ExportedCount | Should be $FileCount

        }
    }

}

Remove-Module $ModuleName
