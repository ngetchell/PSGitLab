Set-BuildEnvironment -VariableNamePrefix 'Build' -Force

$ModuleName = $env:BuildProjectName
$projectRoot = $ENV:BuildProjectPath
if(-not $projectRoot) {
	$projectRoot = $PSScriptRoot
}

#$sut = "$projectRoot\$ModuleName"
$tests = "$projectRoot\Tests"

$ReleaseDirectory = join-path $projectRoot 'Release'
$ResultsDirectory = Join-Path $projectRoot 'Results'
$PesterResultsFile = Join-Path $ResultsDirectory 'PesterResults.xml'
$PSScriptResultsFile = Join-Path $ResultsDirectory 'PSScriptAnalyzer.txt'

$psVersion = $PSVersionTable.PSVersion.ToString()

# Synopsis: Initalize the enviornment
task Init {
    "`nSTATUS: Testing with PowerShell {0}" -f $psVersion
    "Build System Details:"
    Get-Item ENV:Build* | Format-Table Name,Value -AutoSize

    $modules = 'Pester', 'PSDeploy', 'PSScriptAnalyzer', 'PlatyPS'
    Import-Module $modules -Verbose:$false -Force	

    if ( -not ( test-path -Path $ReleaseDirectory ) ) { New-Item -ItemType Directory -Path $projectRoot -Name Release | Out-Null }
    if ( -not ( test-path -Path $ResultsDirectory ) ) { New-Item -ItemType Directory -Path $projectRoot -Name Results | Out-Null}
}

# Synopsis: PSScriptAnalyzer 
task Analyze -inputs { Get-ChildItem -Path "$projectRoot\$ModuleName\" -Recurse | Where-Object { -not $_.PSIsContainer } } -outputs $PSScriptResultsFile   Build,{
    # Modify PSModulePath of the current PowerShell session.
    # We want to make sure we always test the development version of the resource
    # in the current build directory.
    $origModulePath = $env:PSModulePath
    $newModulePath = $origModulePath
    if (($newModulePath.Split(';') | Select-Object -First 1) -ne $projectRoot) {
        # Add the project root to the beginning if it is not already at the front.
        $env:PSModulePath = "$projectRoot;$env:PSModulePath"
    }

    $excludedRules = (
        'PSAvoidUsingConvertToSecureStringWithPlainText', # For private token information
        'PSAvoidUsingUserNameAndPassWordParams' # this refers to gitlab users and passwords
    )
    $saResults = Invoke-ScriptAnalyzer -Path $ModuleName -Severity Error -ExcludeRule $excludedRules -Recurse -Verbose:$false

    # Restore PSModulePath
    if ($origModulePath -ne $env:PSModulePath) {
        $env:PSModulePath = $origModulePath
    }

    $saResults | Select-Object SuggestedCorrections | Format-Custom | Out-File $PSScriptResultsFile -Force

    if ($saResults) {
        $saResults | Format-Table
        throw 'One or more Script Analyzer errors/warnings where found. Build cannot continue!'
    }    
}

# Synopsis: Pester Tests
Task Pester -inputs { Get-ChildItem -Path "$projectRoot\$ModuleName\","$projectRoot\Tests\" -Recurse | Where-Object { -not $_.PSisContainer } } -outputs $PesterResultsFile Build, {
    if(-not $ENV:BuildProjectPath) {
        Set-BuildEnvironment -Path $PSScriptRoot\..
    }
    Remove-Module $ENV:BuildProjectName -ErrorAction SilentlyContinue
    Import-Module (Join-Path $ENV:BuildProjectPath $ENV:BuildProjectName) -Force

    # AppVeyor NUnitXml Upload
    # Source: https://github.com/pester/Pester/wiki/Showing-Test-Results-in-CI-(TeamCity,-AppVeyor)

    $testResults = Invoke-Pester -Path $tests -PassThru -OutputFile $PesterResultsFile

    # Upload to AppVeyor 
    if ( $env:BuildBuildSystem -eq 'AppVeyor' ) {
        (New-Object 'System.Net.WebClient').UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $PesterResultsFile))
    }

    if ($testResults.FailedCount -gt 0) {
        $testResults | Format-List
        throw 'One or more Pester tests failed. Build cannot continue!'
    }    
}

$mergePSM1Parameters = @{
    inputs = { Get-ChildItem -Path "$projectRoot\$ModuleName\" -Recurse | Where-Object { -not $_.PSisContainer } }
    outputs = "$ReleaseDirectory\$ModuleName.psm1"
}

# Synopsis: Merge private and public functions into one .psm1 file
task mergePSM1 @mergePSM1Parameters {
    
    $ReleaseDirectory = join-path $projectRoot 'Release'
    if (Test-Path $ReleaseDirectory) {
        remove-item -Recurse -Force -Path $ReleaseDirectory
    }

    #Create Release Folder
    New-Item -Path $ReleaseDirectory -ItemType Directory -Force | Out-Null
    
    #Copy Module Manifest
    Copy-Item "$projectRoot\$ModuleName\$ModuleName.psd1" -Destination $ReleaseDirectory -Force

    #Copy Formats
    if (Test-Path "$projectRoot\$ModuleName\$ModuleName.Format.ps1xml") {
        Copy-Item "$projectRoot\$ModuleName\$ModuleName.Format.ps1xml" -Destination $ReleaseDirectory -Force
    }

    # Merge PSM1
    $PSM1Path = "$ReleaseDirectory\$ModuleName.psm1"

    foreach ($Folder in @('Public','Private') ) {

        "##########################" | Add-Content $PSM1Path
        "#    $Folder Functions    " | Add-Content $PSM1Path
        "##########################" | Add-Content $PSM1Path

        foreach ($Function in (Get-ChildItem $projectRoot\$ModuleName\$Folder -Recurse -Include *.ps1) ) {
            Get-Content $Function.Fullname | Add-Content $PSM1Path -Force
            "`r`n" | Add-Content $PSM1Path
        }

    }
    
}

$buildMamlParams = @{
    Inputs  = { Get-Item docs/*.md }
    Outputs = "Release/en-US/$ModuleName-help.xml"
}

# Synopsis: Generate MAML Help File
Task GenerateHelp @buildMamlParams  {
    New-ExternalHelp .\docs\ -OutputPath .\Release\en-us\ -Force | Out-Null
}

# Synopsis: Remove the Release directory
#Task Cleanup {
#    if (Test-Path $ReleaseDirectory) {
#        Remove-Item -Recurse -Force -Path $ReleaseDirectory
#    }
#}

# Synopsis: Run before commiting your code
task Pre-Commit Build,pester,analyze

# Synopsis: Build Tasks
task Build init,mergePSM1,GenerateHelp

# Synopsis: Default Task - Alias for Pre-Commit
task . Pre-Commit

task psdeploy {
    Import-Module "$ReleaseDirectory\$ModuleName.psd1"
    
    # Gate deployment
    if( $ENV:BuildBuildSystem -ne 'Unknown' -and
        $ENV:BuildBranchName -eq "master" -and
        $ENV:BuildCommitMessage -match '!deploy'
    ) {
        $params = @{
            Path = "$projectRoot\module.psdeploy.ps1"
            Force = $true
            Recurse = $false
        }
        
        Invoke-PSDeploy @Params
    } else {
        "Skipping deployment: To deploy, ensure that...`n" +
        "`t* You are in a known build system (Current: $ENV:BuildBuildSystem)`n" +
        "`t* You are committing to the master branch (Current: $ENV:BuildBranchName) `n" +
        "`t* Your commit message includes !deploy (Current: $ENV:BuildCommitMessage)"
    }    
}

# Synopsis: Deploy to Powershell Gallery
task Deploy build,pester,analyze,psdeploy 

# Synopsis: Clean all of the artifacts from the build process
task Clean {
    Remove-Item "$ReleaseDirectory" -Recurse -ErrorAction SilentlyContinue
    Remove-Item "$ResultsDirectory" -Recurse -ErrorAction SilentlyContinue
}