$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\Release\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

InModuleScope $ModuleName -ScriptBlock {

    Describe 'Get-GitLabGroup' {
        
        Context 'Request' {
            Mock -CommandName QueryGitLabAPI -MockWith {
                $Request
            }   

            It 'Get All Groups' {
                $Result = Get-GitlabGroup 
                $Result.URI | Should be '/groups'
                $Result.Method | Should be 'GET'
            }

            It 'Specific Group' {
                $Result = Get-GitlabGroup -GroupID 4
                $Result.URI | Should be '/groups/4'
                $Result.Method | Should be 'GET'
            }

            It 'Search for a Group' {
                $Result = Get-GitlabGroup -Search 'Example'
                $Result.URI | Should be '/groups?search=Example'
                $Result.Method | Should be 'GET'
            }
        }
        Context 'ObjectType' {
            Mock -CommandName 'QueryGitLabAPI' -MockWith {
                $ObjectType
            }

            It 'All Groups' {
                $Result = Get-GitlabGroup
                $Result | Should be 'GitLab.Group'
            }

            It 'Specific Group' {
                $Result = Get-GitlabGroup -GroupID 3
                $Result | Should be 'GitLab.Group'
            }

            It 'Search for a group' {
                $Result = Get-GitlabGroup -Search 'Example'
                $Result | Should be 'Gitlab.Group'
            }
        }

    }
}

Remove-Module $ModuleName