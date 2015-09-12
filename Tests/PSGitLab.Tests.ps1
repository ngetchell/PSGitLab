$CommandPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$ModulePath = "$CommandPath\..\PSGitLab\PSGitLab.psd1"
Import-Module $ModulePath

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

Describe "ImportConfig" {
    $Token = (Get-date -Format yy-mm-dd-HH)
    Save-GitLabAPIConfiguration -Domain 'http://gitlab.com' -Token $Token

    InModuleScope PSGitLab {
        it "Domain Test" {
            $Config = ImportConfig
            $Config.Domain | SHould be 'http://gitlab.com'
        }

        It "Token Test" {
            $Config = ImportConfig
            $Config.Token | Should be (Get-date -Format yy-mm-dd-HH)
        }

    }
}



#endregion Save-GitLabAPIConfiguration
Remove-Module [P]SGitLab
