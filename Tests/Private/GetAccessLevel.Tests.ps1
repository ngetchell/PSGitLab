$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\Release\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

InModuleScope -ModuleName $ModuleName {
    Describe 'GetAccessLevel' {

        Context 'Group Permissions' {
            $Type = 'Group'

            It 'Guest' {
                GetAccessLevel -Level Guest -Type $Type | Should be 10
            }

            It 'Reporter' {
                GetAccessLevel -Level Reporter -Type $Type | Should be 20
            }

            It 'Developer' {
                GetAccessLevel -Level Developer -Type $Type | Should be 30
            }

            It 'Master' {
                GetAccessLevel -Level Master -Type $Type | Should be 40
            }

            It 'Owner' {
                GetAccessLevel -Level Owner -Type $Type | Should be 50
            }

            It 'Owner do not throw' {
                { GetAccessLevel -Level Owner -Type 'Group' -ErrorAction Stop } | Should not throw
            }

        }

        Context 'Project Permissions' {
            $Type = 'Project'

            It 'Guest' {
                GetAccessLevel -Level Guest -Type $Type | Should be 10
            }

            It 'Reporter' {
                GetAccessLevel -Level Reporter -Type $Type | Should be 20
            }

            It 'Developer' {
                GetAccessLevel -Level Developer -Type $Type | Should be 30
            }

            It 'Master' {
                GetAccessLevel -Level Master -Type $Type | Should be 40
            }

            It 'Owner' {
                { GetAccessLevel -Level Owner -Type $Type -ErrorAction Stop } | Should throw 'Projects do not have owner permission set. See https://docs.gitlab.com/ce/api/members.html'
            }

        }    

    }
}
Remove-Module $ModuleName