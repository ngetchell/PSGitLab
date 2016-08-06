Function Get-GitLabCommitStats {
<#
.SYNOPSIS
Retrieves information about commits to projects
.DESCRIPTION
Retrieves information about commits to projects
.EXAMPLE
PS U:\> Get-GitLabCommitStats -Id 52 -afterDate "2016-07-01" -author "Test User"

Week         : 29
Sun          : 1
Mon          : 0
Tue          : 0
Wed          : 0
Thu          : 0
Fri          : 0
Sat          : 0
WeeklyTotal  : 1
RunningTotal : 1

Week         : 30
Sun          : 0
Mon          : 0
Tue          : 0
Wed          : 0
Thu          : 1
Fri          : 0
Sat          : 0
WeeklyTotal  : 1
RunningTotal : 2

Week         : 31
Sun          : 0
Mon          : 0
Tue          : 0
Wed          : 0
Thu          : 0
Fri          : 2
Sat          : 0
WeeklyTotal  : 2
RunningTotal : 4
#>
[cmdletbinding()]
param(
    [int]$Id,
    [string]$author = "*",
    [Parameter(ParameterSetName='lastYear')]
    [switch]$lastYear,
    [Parameter(ParameterSetName='beforeDate')]
    [datetime]$beforeDate,
    [Parameter(ParameterSetName='beforeDate')]
    [Parameter(ParameterSetName='afterDate')]
    [datetime]$afterDate
)
    try {
        if (!($Id)) {
            $allProjectsId = (Get-GitLabProject).Id
            foreach ($project in $allProjectsId) {
                $Request = @{
                    URI="/projects/$project/repository/commits";
                    Method='Get';
                }
            $commits += QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Commit'
            }
        } else {
            $Request = @{
                URI="/projects/$Id/repository/commits";
                Method='Get';
            }
            $commits = QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Commit'
        }

        if ($lastYear) {
            $dtCommits = $commits | Where-Object {[datetime]$_.created_at -ge ((Get-Date).AddDays(-365))} | Where-Object {$_.author_name -like $author}
        } elseif ($beforeDate) {
            if ($afterDate) {
                if ($beforeDate -le $afterDate) {
                    throw "beforeDate cannot be less than afterDate"
                } else {
                    $dtCommits = $commits | Where-Object {([datetime]$_.created_at -le (Get-Date $beforeDate)) -and ([datetime]$_.created_at -ge (Get-Date $afterDate))} | Where-Object {$_.author_name -like $author}
                }
            } else {
                $dtCommits = $commits | Where-Object {[datetime]$_.created_at -le (Get-Date $beforeDate)} | Where-Object {$_.author_name -like $author}
            }
        } elseif ($afterDate) {
            $dtCommits = $commits | Where-Object {[datetime]$_.created_at -ge (Get-Date $afterDate)} | Where-Object {$_.author_name -like $author}
        } else {
            $dtCommits = $commits | Where-Object {$_.author_name -like $author}
        }
        if ($dtCommits) {
            FormatCommits -dtCommits $dtCommits
        } else {
            Write-Output "No commits found"
        }
    } catch {
        Write-Error $_.Exception.Message
    }
}