. $PSScriptRoot\Authentication.ps1

Describe "Project" -Tag "Integration" {

    Context "New-GitLabProject" {

        $ProjectParams = @{
            Name = 'Integration_Test'
            Description = 'Example Description'
            Visibility_level = 'Internal'
        }

        $Project = New-GitLabProject @ProjectParams

        $projectParams.GetEnumerator() | ForEach-Object {
            It $_.Key {
                $Project."$($_.Key)" | Should be $_.Value
            }
        }

    }

}
