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

Describe 'Testing User Commands' -Tag 'Integration' {

    Context "Test Initial State" {
        It 'Tests-Connection' {
            $Result = Test-GitLabAPI
            $Result.StatusCode | Should -Be 200 -Because 'a 200 status code means things are OK'
        }

        It 'Get Default User' {
            $Result = Get-GitLabUser -Id 1 
            $Result.Name | Should -be Administrator -Because 'the default user has a name of administrator'
            $Result.username | Should -be root -Because 'the default user has a username of root'
            $Result.id | Should -be 1
            $Result.is_admin | Should -be $true
        }
    }

    Context "New-GitLabUser with default params" {
        $params = @{
            Email = 'test1@testing.com'
            Password = 'password'
            Username = 'user1'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.Username | Select *

        It 'Should have email of' {
            $Result.email | Should -be $params.Email
        }

        It 'Should have username of' {
            $Result.username | Should -be $params.Username
        }

        It 'Should have name of' {
            $Result.name | Should -be $params.Name
        }

        It 'Should have state of' {
            $Result.state | Should -be 'active'
        }

        It 'Should have SkypeId of' {
            $Result.skype | Should -BeNullOrEmpty
        }

        It 'Should have Linkedin of' {
            $Result.linkedin | Should -BeNullOrEmpty
        }

        It 'Should have twitter of' {
            $Result.linkedin | Should -BeNullOrEmpty
        }

        It 'Should have websiteURL of' {
            $Result.linkedin | Should -BeNullOrEmpty
        }

        It 'Should have Projects limit of' {
            $Result.projects_limit | Should -be 0
        }

        It 'Should have admin permissions of' {
            $Result.is_admin | Should -be $false
        }

        It 'Should have group create permissions of' {
            $Result.can_create_group | Should -be $false
        }

        It 'Should be an external account' {
            $Result.external | Should -be $false
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "New-GitLabUser with optional params (except external)" {
        $params = @{
            Email = 'test2@testing.com'
            Password = 'password'
            Username = 'user2'
            Name = 'Delete Me'
            SkypeID = 'testskypeid'
            LinkedIn = 'testlinkedin'
            Twitter = 'testtwitter'
            WebsiteURL = 'http://test.com'
            ProjectsLimit = 1
            Admin = $true
            CanCreateGroup = $true
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.Username | Select *

        It 'Should have email of' {
            $Result.email | Should -Be $params.Email
        }

        It 'Should have username of' {
            $Result.username | Should -Be $params.Username
        }

        It 'Should have name of' {
            $Result.name | Should -Be $params.Name
        }

        It 'Should have state of' {
            $Result.state | Should -Be 'active'
        }

        It 'Should have SkypeId of' {
            $Result.skype | Should -Be $params.SkypeID
        }

        It 'Should have Linkedin of' {
            $Result.linkedin | Should -Be $params.LinkedIn
        }

        It 'Should have twitter of' {
            $Result.twitter | Should -Be $params.Twitter
        }

        It 'Should have websiteURL of' {
            $Result.website_url | Should -Be $params.WebsiteURL
        }

        It 'Should have Projects limit of' {
            $Result.projects_limit | Should -Be 1
        }

        It 'Should have admin permissions of' {
            $Result.is_admin | Should -Be $true
        }

        It 'Should have group create permissions of' {
            $Result.can_create_group | Should -be $true
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "Get-GitLabUser using ID" {
        $Result = Get-GitLabUser -Id 1

        It "Should have name of" {
            $Result.name | Should -Be 'Administrator'
        }

        It "Should have username of" {
            $Result.username | Should -Be 'root'
        }

        It "Should have admin permissions" {
            $Result.is_admin | Should -Be $true
        }

        It "Should have email of" {
            $Result.email | Should -Be 'admin@example.com'
        }
    }

    Context "Get-GitLabUser using username" {
        $Result = Get-GitLabUser -username root

        It "Should have name of" {
            $Result.name | Should -Be 'Administrator'
        }

        It "Should have username of" {
            $Result.username | Should -Be 'root'
        }

        It "Should have admin permissions" {
            $Result.is_admin | Should -Be $true
        }

        It "Should have email of" {
            $Result.email | Should -Be 'admin@example.com'
        }
    }

    Context "Get-GitLabUser using email" {
        $Result = Get-GitLabUser -email 'admin@example.com'

        It "Should have name of" {
            $Result.name | Should -Be 'Administrator'
        }

        It "Should have username of" {
            $Result.username | Should -Be 'root'
        }

        It "Should have admin permissions" {
            $Result.is_admin | Should -Be $true
        }

        It "Should have email of" {
            $Result.email | Should -Be 'admin@example.com'
        }
    }

    Context "Get-GitLabUser using CurrentUser" {
        $Result = Get-GitLabUser -CurrentUser

        It "Should have name of" {
            $Result.name | Should -Be 'Administrator'
        }

        It "Should have username of" {
            $Result.username | Should -Be 'root'
        }

        It "Should have admin permissions" {
            $Result.is_admin | Should -Be $true
        }

        It "Should have email of" {
            $Result.email | Should -Be 'admin@example.com'
        }
    }

    Context "Get-GitLabUser using -All" {
        $Result = Get-GitLabUser -All

        It "Should return all users" {
            $Result.count | Should -Be 2
        }
    }

    Context "Remove-GitLabUser using one user" {
        $params = @{
            Email = 'test3@testing.com'
            Password = 'password'
            Username = 'user3'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        Remove-GitLabUser -Username $params.username -Confirm:$false
        Start-Sleep 2
        $Result = Get-GitLabUser -Username $params.Username

        It "User should not exist" {
            $Result.count | Should -Be 0
        }
    }

    Context "Remove-GitLabUser using multiple user" {
        $params1 = @{
            Email = 'test4@testing.com'
            Password = 'password'
            Username = 'user4'
            Name = 'Delete Me'
        }
        New-GitLabUser @params1
        $params2 = @{
            Email = 'test5@testing.com'
            Password = 'password'
            Username = 'user5'
            Name = 'Delete Me'
        }
        New-GitLabUser @params2
        $users = Get-GitLabUser -All | where {$_.Name -eq 'Delete Me'}
        $users | Remove-GitLabUser -Confirm:$false
        Start-Sleep 2
        $Result = Get-GitLabUser -All | where {$_.Name -eq 'Delete Me'}

        It "Users should not exist" {
            $Result.count | Should -Be 0
        }
    }

    Context "Block-GitLabUser and Unblock-GitLabUser by pipe" {
        $params = @{
            Email = 'test6@testing.com'
            Password = 'password'
            Username = 'user6'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.Username | Select *

        It "User should not be blocked" {
            $Result.state | Should -Be 'active'
        }

        $blockResult = Get-GitLabUser -Username $params.Username | Block-GitLabUser -PassThru

        It "User should be blocked" {
            $blockResult.state | Should -Be 'blocked'
        }

        $unblockResult = Get-GitLabUser -Username $params.Username | Unblock-GitLabUser -PassThru

        It "User should be unblocked" {
            $unblockResult.state | Should -Be 'active'
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "Block-GitLabUser and Unblock-GitLabUser by Id" {
        $params = @{
            Email = 'test7@testing.com'
            Password = 'password'
            Username = 'user7'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.Username | Select *

        It "User should not be blocked" {
            $Result.state | Should -Be 'active'
        }

        $blockResult = Block-GitLabUser -ID $Result.id -PassThru

        It "User should be blocked" {
            $blockResult.state | Should -Be 'blocked'
        }

        $unblockResult = Unblock-GitLabUser -ID $Result.id -PassThru

        It "User should be unblocked" {
            $unblockResult.state | Should -Be 'active'
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "Block-GitLabUser and Unblock-GitLabUser by Username" {
        $params = @{
            Email = 'test8@testing.com'
            Password = 'password'
            Username = 'user8'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.Username | Select *

        It "User should not be blocked" {
            $Result.state | Should -Be 'active'
        }

        $blockResult = Block-GitLabUser -Username $params.Username -PassThru

        It "User should be blocked" {
            $blockResult.state | Should -Be 'blocked'
        }

        $unblockResult = Unblock-GitLabUser -Username $params.Username -PassThru
        
        It "User should be unblocked" {
            $unblockResult.state | Should -Be 'active'
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "Block-GitLabUser and Unblock-GitLabUser by Email" {
        $params = @{
            Email = 'test9@testing.com'
            Password = 'password'
            Username = 'user9'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Email $params.email | Select *

        It "User should not be blocked" {
            $Result.state | Should -Be 'active'
        }

        $blockResult = Block-GitLabUser -Email $params.email -PassThru

        It "User should be blocked" {
            $blockResult.state | Should -Be 'blocked'
        }

        $unblockResult = Unblock-GitLabUser -Email $params.email -PassThru
        
        It "User should be unblocked" {
            $unblockResult.state | Should -Be 'active'
        }

        Remove-GitLabUser -Username $params.Username -Confirm:$false
    }

    Context "Search-GitLabUser" {
        $Result = Search-GitLabUser -User 'ghost'

        It "Should return a user" {
            $Result.count | Should -Be 1
        }
    }

    Context "Set-GitLabUser by ID" {
        $params = @{
            Email = 'test10@testing.com'
            Password = 'password'
            Username = 'user10'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.username | Select *

        $setParams = @{
            ID = $Result.id
            Password = 'newPassword'
            NewUserName = 'user11'
            Name = 'Delete Me 2'
            SkypeId = 'testskypeid'
            LinkedIn = 'linkedinid'
            Twitter = 'twitterid'
            WebsiteURL = 'http://test'
            ProjectsLimit = 1
            Admin = $true
            CanCreateGroup = $true
        }
        Set-GitLabUser @setParams
        $setResults  = Get-GitLabUser -Username $setParams.NewUserName | Select *
        It "Should have username of" {
            $setResults.username | Should -Be $setParams.NewUserName
        }

        It "Should have name of" {
            $setResults.name | Should -Be $setParams.name
        }

        It 'Should have SkypeId of' {
            $setResults.skype | Should -Be $setParams.SkypeID
        }

        It 'Should have Linkedin of' {
            $setResults.linkedin | Should -Be $setParams.LinkedIn
        }

        It 'Should have twitter of' {
            $setResults.twitter | Should -Be $setParams.Twitter
        }

        It 'Should have websiteURL of' {
            $setResults.website_url | Should -Be $setParams.WebsiteURL
        }

        It 'Should have Projects limit of' {
            $setResults.projects_limit | Should -Be 1
        }

        It 'Should have admin permissions of' {
            $setResults.is_admin | Should -Be $true
        }

        It 'Should have group create permissions of' {
            $setResults.can_create_group | Should -be $true
        }

        Remove-GitLabUser -Username $setParams.NewUserName -Confirm:$false
    }

    Context "Set-GitLabUser by Email" {
        $params = @{
            Email = 'test12@testing.com'
            Password = 'password'
            Username = 'user12'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.username | Select *

        $setParams = @{
            Email = $params.Email
            Password = 'newPassword'
            NewUserName = 'user13'
            Name = 'Delete Me 2'
            SkypeId = 'testskypeid'
            LinkedIn = 'linkedinid'
            Twitter = 'twitterid'
            WebsiteURL = 'http://test'
            ProjectsLimit = 1
            Admin = $true
            CanCreateGroup = $true
        }
        Set-GitLabUser @setParams
        $setResults = Get-GitLabUser -Username $setParams.NewUserName | Select *

        It "Should have username of" {
            $setResults.username | Should -Be $setParams.NewUserName
        }

        It "Should have name of" {
            $setResults.name | Should -Be $setParams.name
        }

        It 'Should have SkypeId of' {
            $setResults.skype | Should -Be $setParams.SkypeID
        }

        It 'Should have Linkedin of' {
            $setResults.linkedin | Should -Be $setParams.LinkedIn
        }

        It 'Should have twitter of' {
            $setResults.twitter | Should -Be $setParams.Twitter
        }

        It 'Should have websiteURL of' {
            $setResults.website_url | Should -Be $setParams.WebsiteURL
        }

        It 'Should have Projects limit of' {
            $setResults.projects_limit | Should -Be 1
        }

        It 'Should have admin permissions of' {
            $setResults.is_admin | Should -Be $true
        }

        It 'Should have group create permissions of' {
            $setResults.can_create_group | Should -be $true
        }

        Remove-GitLabUser -Username $setParams.NewUserName -Confirm:$false
    }

    Context "Set-GitLabUser by Username" {
        $params = @{
            Email = 'test14@testing.com'
            Password = 'password'
            Username = 'user14'
            Name = 'Delete Me'
        }
        New-GitLabUser @params
        $Result = Get-GitLabUser -Username $params.username | Select *

        $setParams = @{
            Username = $params.Username
            Password = 'newPassword'
            NewUserName = 'user15'
            Name = 'Delete Me 2'
            SkypeId = 'testskypeid'
            LinkedIn = 'linkedinid'
            Twitter = 'twitterid'
            WebsiteURL = 'http://test'
            ProjectsLimit = 1
            Admin = $true
            CanCreateGroup = $true
        }
        Set-GitLabUser @setParams
        $setResults = Get-GitLabUser -Username $setParams.NewUserName | Select *

        It "Should have username of" {
            $setResults.username | Should -Be $setParams.NewUserName
        }

        It "Should have name of" {
            $setResults.name | Should -Be $setParams.name
        }

        It 'Should have SkypeId of' {
            $setResults.skype | Should -Be $setParams.SkypeID
        }

        It 'Should have Linkedin of' {
            $setResults.linkedin | Should -Be $setParams.LinkedIn
        }

        It 'Should have twitter of' {
            $setResults.twitter | Should -Be $setParams.Twitter
        }

        It 'Should have websiteURL of' {
            $setResults.website_url | Should -Be $setParams.WebsiteURL
        }

        It 'Should have Projects limit of' {
            $setResults.projects_limit | Should -Be 1
        }

        It 'Should have admin permissions of' {
            $setResults.is_admin | Should -Be $true
        }

        It 'Should have group create permissions of' {
            $setResults.can_create_group | Should -be $true
        }

        Remove-GitLabUser -Username $setParams.NewUserName -Confirm:$false
    }
}

Remove-Module $ModuleName