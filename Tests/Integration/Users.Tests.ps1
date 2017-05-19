. $PSScriptRoot\Authentication.ps1

Describe "Get-GitLabUser" -Tag "Integration" {
    Context "Default User" {
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
}

Describe "New-GitLabUser"  -Tag "Integration" {

    Context "Create User" {

        BeforeAll {
            $Parameters = @{
                Email = 'newuser@gmail.com'
                Username = 'gitlab_user'
                Name = 'Test User'
                Twitter = 'fake_twitter'
                SkypeID = 'fake skype'
                LinkedIn = 'linkedINuser'
                WebsiteURL = 'http://example.com'
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
}
