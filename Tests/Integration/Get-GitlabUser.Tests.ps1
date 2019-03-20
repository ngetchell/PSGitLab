$ModuleName = 'PSGitLab'
Get-Module $ModuleName | Remove-Module
if ($env:APPVEYOR -eq 'True') {
    $ModulePath = "$PSScriptRoot\..\..\Release\$ModuleName.psd1"
}
else {
    $ModulePath = "$PSScriptRoot\..\..\PSGitLab\"
}

Import-Module $ModulePath

if ($env:TRAVIS -eq 'true') {
    $token = Get-Content /config/token | Select -Last 1
    $url = "http://gitlab"
    Save-GitLabAPIConfiguration -Token $token -Domain $url -APIVersion 4
}

Describe 'Initial Test' -Tag 'Integration' {
    It 'Test' {
        $Result = Test-GitLabAPI
        $Result.StatusCode | Should -Be 200 -Because 'a 200 status code means things are OK'
    }

    It 'Get User' {
        $Result = Get-GitLabUser -Id 1 
        $Result.Name | Should -be Administrator -Because 'the default user has a name of administrator'
        $Result.username | Should -be root -Because 'the default user has a username of root'
        $Result.id | Should -be 1
        $Result.is_admin | Should -be $true
    }
}

Remove-Module $ModuleName