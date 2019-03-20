$testResults = Invoke-Pester -Path "$PSScriptRoot\Tests" -Tags Integration -PassThru
if ($testResults.FailedCount -gt 0) {
    Write-Error -Message 'One or more tests failed. Exiting with error/stopping deployment.'
    exit 1
}

if ($testResults.TotalCount -le 0) {
    Write-Error -Message 'no tests were run. Exiting with error/stopping deployment.'
    exit 1
}