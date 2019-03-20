$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\PSGitLab\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest


Describe 'Initial Test' -Tag 'Integration' {
    It 'Test' {
        $Result = Test-GitLabAPI
        $Result.StatusCode | Should -Be 200 -Because 'a 200 status code means things are OK'
    }

    It 'Get User' {
        $Result = Get-GitLabUser -Id 1 
        $Result.Name | Should -be Administrator -Because 'the default user has a name of administrator'
        $Result.username | Should -be root -Because 'the default user has a username of root'
        $Result.id | Should -be 12
        $Result.is_admin | Should -be $true
    }
}

Remove-Module $ModuleName