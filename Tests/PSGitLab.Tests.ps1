$ModuleName = 'PSGitLab'
Get-Module $ModuleName | Remove-Module
if ($env:APPVEYOR -eq 'True') {
    $ModulePath = "$PSScriptRoot\..\Release\$ModuleName.psd1"
}
else {
    $ModulePath = "$PSScriptRoot\..\PSGitLab\"
}

Import-Module $ModulePath

#region Save-GitLabAPIConfiguration

#Describe 'Save-GitLabAPIConfigruation' {
#    It 'Proper Format' {
#        { Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token 'TestInformation' } | Should not throw
#    }
#
#    It 'Malformed URI' {
#        { Save-GitlabAPIConfiguration -Domain httpffsdf -Token 'TestInformation' } | Should throw
#    }
#
#    It 'No Domain' {
#        { Save-GitLabAPIConfiguration -Token 'Test' -Domain $null } | Should Throw
#    }
#
#    It 'No Token' {
#        { Save-GitLabAPIConfiguration -Domain 'http://gitlab.com' -Token $null } | Should Throw
#    }
#}

#Describe 'ImportConfig' {
#    $Token = (Get-date -Format yy-mm-dd-HH)
#    Save-GitLabAPIConfiguration -Domain 'http://gitlab.com' -Token $Token
#
#    InModuleScope PSGitLab {
#        it 'Domain Test' {
#            $Config = ImportConfig
#            $Config.Domain | SHould be 'http://gitlab.com'
#        }
#
#        It 'Token Test' {
#            $Config = ImportConfig
#            $Config.Token | Should be (Get-date -Format yy-mm-dd-HH)
#        }
#
#    }
#}

Describe 'Module Information' {
    
    $ModuleManifest = Resolve-Path "$PSScriptRoot\..\Release\$ModuleName.psd1"
    
    Context 'Module Manifest' {
        $Script:Manifest = $null
        It 'Valid Manifest File' {
            {
                $Script:Manifest = Test-ModuleManifest -Path $ModuleManifest -ErrorAction Stop -WarningAction SilentlyContinue
            } | Should Not Throw
        }

        It 'Valid Manifest Root Module' {
            $Script:Manifest.RootModule | Should Be 'PSGitLab.psm1'
        }

        It 'Valid Manifest Name' {
            $Script:Manifest.Name | Should be PSGitLab
        }

        It 'Valid Manifest GUID' {
            $Script:Manifest.Guid | SHould be 'f844db87-fda8-403b-a7da-bdc00a3f5a58'
        }

        It 'Valid Manifest Version' {
            $Script:Manifest.Version -as [Version] | Should Not BeNullOrEmpty
        }

        It 'Valid Manifest Description' {
            $Script:Manifest.Description | Should Not BeNullOrEmpty
        }

        It 'Valid Format File' {
            $ValidPath = Test-Path -Path $Script:Manifest.ExportedFormatFiles
            $ValidPath | Should be $true
        }

        It 'Required Modules' {
            $Script:Manifest.RequiredModules | Should BeNullOrEmpty
        }

        It 'Non blank description' {
            $Script:Manifest.Description | Should not Benullorempty
        }

    }
}


#endregion Save-GitLabAPIConfiguration
Remove-Module $ModuleName
