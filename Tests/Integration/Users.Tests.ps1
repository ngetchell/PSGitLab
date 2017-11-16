. $PSScriptRoot\Authentication.ps1

$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\Release\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

Describe "User" -Tag "Integration" {
    Context "Get-GitLabUser" {
        $User = Get-GitLabUser -ID 1
        It "Name" {
            $User.name | Should be 'Administrator'
        }
        
        It "Username" {
            $User.username | Should be 'root'
        }
        
        It "Id" {
            $User.id | Should be 1
        }
        
        It "is_admin" {
            $User.is_admin | Should be $true
        }
        
        It "Email" {
            $User.email | Should be 'admin@example.com'
        }
        
        It "state" {
            $User.State | Should be 'active'
        }
    }
    Context "New-GitLabUser" {
    
        BeforeAll {
            $Parameters = @{
                Email = 'newuser@gmail.com'
                Username = 'gitlab_user'
                Name = 'Test User'
                Twitter = 'fake_twitter'
                #SkypeID = 'fakeskype@test.com'
                LinkedIn = 'linkedINuser'
                #WebsiteURL = 'http://example.com'
            }
            $New = New-GitLabUser -Password 'Example1' -Passthru @Parameters 
            $User = Get-Gitlabuser -ID $new.id
        }
    
        AfterAll {
            $User | Remove-GitLabUser -Confirm:$false
        }
    
        $Parameters.GetEnumerator() | ForEach-Object {
            It $_.Key {
                $User."$($_.Key)" | Should be $_.Value
            }
        }
    
    }

    Context 'Remove-GitLabUser' {
        $Parameters = @{
            Email = 'newuser@gmail.com'
            Username = 'gitlab_user'
            Name = 'Test User'
            Twitter = 'fake_twitter'
            SkypeID = 'fakeskype@test.com'
            LinkedIn = 'linkedINuser'
            WebsiteURL = 'http://example.com'
        }        
        $User = Get-GitLabUser -Username gitlab_user
        It "User Doesn't exist" {
            $User.count | should benullorempty
        }

        $User = New-GitlabUser -Password 'Exmaple1' @Parameters -Passthru
        it 'should be created' {
            $User.username | Should be 'gitlab_user'
        }

        Remove-GitLabUser -Username $User.Username -Confirm:$false
        $User = Get-GitLabUser -Username gitlab_user

        it 'should be gone again' {
            $User.count | should benullorempty
        }
    }
}
