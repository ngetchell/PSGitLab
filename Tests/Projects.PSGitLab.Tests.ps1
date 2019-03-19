$ModuleName = 'PSGitLab'
Get-Module $ModuleName | Remove-Module
if ($env:APPVEYOR -eq 'True') {
    $ModulePath = "$PSScriptRoot\..\Release\$ModuleName.psd1"
}
else {
    $ModulePath = "$PSScriptRoot\..\PSGitLab\"
}

Import-Module $ModulePath

## Projects ##

#InModuleScope PSGitLab {
#    Describe 'Get-GitLabAllProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Get-GitLabAllProject
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#
#        It 'Correct Params' {
#            # Arrange
#            Mock QueryGitLabAPI { $Request}
#
#            # Act
#            $Results = Get-GitLabAllProject -archived -sort asc -order_by id -search 'Name'
#
#            # Assert
#            $Results.Method | Should be 'Get'
#            $Results.URi -match '&search=Name' | Should be $true
#        }
#
#        Context 'Parameter Checks - Archived'  {
#            BeforeAll {
#                $Parameters = Get-Command Get-GitLabAllProject |
#                    Select-Object -ExpandProperty Parameters
#            }
#
#            It 'SwitchParam' {
#                $Parameters['Archived'].SwitchParameter | Should be $true
#            }
#
#            It 'Name' {
#                $Parameters['Archived'].Name | Should be 'Archived'
#            }
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'Get-GitLabOwnedProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Get-GitLabOwnedProject
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'Get-GitLabProjectEvent'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Get-GitLabProjectEvent -id 12
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'Get-GitLabProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Get-GitLabProject
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'Get-GitlabSingleProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Get-GitlabSingleProject -ID 12
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'New-GitLabFork'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = New-GitLabFork -Id 12
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'New-GitLabProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = New-GitLabProject -Name 'Pester Test'
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#    }
#}
#
#InModuleScope PSGitLab {
#    Describe 'Remove-GitLabProject'  {
#        It 'QueryGitLabAPI Calls' {
#            # Arrange
#            Mock QueryGitLabAPI {}
#
#            # Act
#            $Results = Remove-GitLabProject -ID 12 -Confirm:$false
#
#            # Assert
#            Assert-MockCalled QueryGitLabAPI 1
#
#        }
#
#        Context 'Parameter Checks - Id' {
#            BeforeAll {
#                $Parameters = Get-command Remove-GitLabProject | Select-Object -ExpandProperty Parameters
#            }
#
#            It 'Mandatory' {
#                $parameters['id'].Attributes.Mandatory | Should be $true
#            }
#        }
#    }
#}
#
#
Remove-Module $ModuleName
