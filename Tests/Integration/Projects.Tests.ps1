. $PSScriptRoot\Authentication.ps1

Describe "Project" -Tag "Integration" {

    ## Clean Out Previous Integration_Test Projects
    try {
        Get-GitlabProject -Search 'Integration_test' | Remove-GitlabProject -Confirm:$false
    } catch {

    }

    Context "New-GitLabProject" {

        $ProjectParams = @{
            Name = 'Integration_Test2'
            Description = 'Example Description'
            Visibility_level = 'Internal'
            Namespace = 'root'
        }

        $Project = New-GitLabProject @ProjectParams

        It 'Name' {
            $Project.Name | Should be $ProjectParams.Name
        }

        It 'Description' {
            $Project.Description | Should be $projectParams.Description
        }

        It 'Visibility_level' {
            $Project.Visibility_level | Should be '10'
        }

        It 'Namespace' {
            $Project.Namespace.Path | Should be $ProjectParams.Namespace
        }

        Remove-GitLabProject -Id $Project.ID -Confirm:$false

    }

}
