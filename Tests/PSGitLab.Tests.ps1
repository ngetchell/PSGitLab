$CommandPath = Split-Path $MyInvocation.MyCommand.Path -Parent
Import-Module "C:\Users\ngetchell\Documents\Git\PSGitLab\Modules\PSGitLab\PSGitLab.psd1"

#region Save-GitLabAPIConfiguration

Describe "Save-GitLabAPIConfigruation" {
    It "Proper Format" {
        { Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "TestInformation" } | Should not throw
    }

    It "Malformed URI" {
        { Save-GitlabAPIConfiguration -Domain httpffsdf -Token "TestInformation" } | Should throw
    }

    It "No Domain" {
        { Save-GitLabAPIConfiguration -Token "Test" -Domain $null } | Should Throw
    }

    It "No Token" {
        { Save-GitLabAPIConfiguration -Domain "http://gitlab.com" -Token $null } | Should Throw
    }
}



#endregion Save-GitLabAPIConfiguration