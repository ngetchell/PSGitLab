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

Describe 'User' -Tag 'Integration' {
    It 'Test' {
        $Result = Test-GitLabAPI
        $Result.StatusCode | Should -Be 200 -Because 'a 200 status code means things are OK'
    }

    It 'Get a User' {
        $Result = Get-GitLabUser -Id 1 
        $Result.Name | Should -be 'Administrator'
        $Result.username | Should -be 'root'
        $Result.id | Should -be 1
        $Result.is_admin | Should -be $true
    }

    It 'Create a User' {
        $body = @{
            Email = 'user1@test.com'
            Password = 'mypassword'
            Username = 'user1'
            Name = 'User 1'
            PassThru = $true
        }
        $Result = New-GitLabUser @body

        $Result.name | Should -be 'User 1'
        $Result.username | Should -be 'user1'
        $Result.is_admin | Should -be 'False'
        $Result.email | Should -be 'user1@test.com'
    }

    It 'Updates a User'{
        $body = @{
            Username = 'user1'
            Name = 'User One'
            Admin = $true
            PassThru = $True
        }
        $Result = Set-GitLabUser @body

        $Result.name | Should -be 'User One'
        $Result.username | Should -be 'user1'
        $Result.is_admin | Should -be 'True'
        $Result.email | Should -be 'user1@test.com'
    }

    It 'Block a User' {
        $body = @{
            Username = 'user1'
            PassThru = $True
        }
        $Result = Block-GitLabUser @body

        $Result.name | Should -be 'User One'
        $Result.username | Should -be 'user1'
        $Result.is_admin | Should -be 'True'
        $Result.email | Should -be 'user1@test.com'
        $Result.state | Should -be 'blocked'
    }

    It 'UnBlock a User' {
        $body = @{
            Username = 'user1'
            PassThru = $True
        }
        $Result = Unblock-GitLabUser @body

        $Result.name | Should -be 'User One'
        $Result.username | Should -be 'user1'
        $Result.is_admin | Should -be 'True'
        $Result.email | Should -be 'user1@test.com'
        $Result.state | Should -be 'active'
    }

    It 'Search for a User' {
        $body = @{
            User = 'User One'
        }
        $Result = Search-GitLabUser @body

        $Result.name | Should -be 'User One'
        $Result.username | Should -be 'user1'
        $Result.is_admin | Should -be 'True'
        $Result.email | Should -be 'user1@test.com'
        $Result.state | Should -be 'active'
    }

    It 'Deletes a User' {
        $body = @{
            Username = 'user1'
            Confirm = $False
        }
        { Remove-GitLabUser @body } | Should -Not -Throw
    }
}

Remove-Module $ModuleName