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
    [Parameter(ParameterSetName="Id",Mandatory=$true)]
    [Parameter(ParameterSetName="IdAuth",Mandatory=$true)]
    [Parameter(ParameterSetName="IdLastYear",Mandatory=$true)]
    [Parameter(ParameterSetName="IdBDate",Mandatory=$true)]
    [Parameter(ParameterSetName="IdADate",Mandatory=$true)]
    [Parameter(ParameterSetName="IdBothDate",Mandatory=$true)]
    [int]$Id,
    [Parameter(ParameterSetName="All",Mandatory=$true)]
    [Parameter(ParameterSetName="AllAuth",Mandatory=$true)]
    [Parameter(ParameterSetName="AllLastYear",Mandatory=$true)]
    [Parameter(ParameterSetName="AllBDate",Mandatory=$true)]
    [Parameter(ParameterSetName="AllADate",Mandatory=$true)] 
    [Parameter(ParameterSetName="AllBothDate",Mandatory=$true)] 
    [switch]$All,
    [Parameter(ParameterSetName="IdAuth",Mandatory=$true)]
    [Parameter(ParameterSetName="IdLastYear",Mandatory=$false)]
    [Parameter(ParameterSetName="IdBDate",Mandatory=$false)]
    [Parameter(ParameterSetName="IdADate",Mandatory=$false)]
    [Parameter(ParameterSetName="AllAuth",Mandatory=$true)]
    [Parameter(ParameterSetName="AllLastYear",Mandatory=$false)]
    [Parameter(ParameterSetName="AllBDate",Mandatory=$false)]
    [Parameter(ParameterSetName="AllADate",Mandatory=$false)]
    [Parameter(ParameterSetName="IdBothDate",Mandatory=$false)]
    [Parameter(ParameterSetName="AllBothDate",Mandatory=$false)]
    [string]$author = "*",
    [Parameter(ParameterSetName="IdBDate",Mandatory=$true)]  
    [Parameter(ParameterSetName="AllBDate",Mandatory=$true)]
    [Parameter(ParameterSetName="IdBothDate",Mandatory=$true)]
    [Parameter(ParameterSetName="AllBothDate",Mandatory=$true)]
    [datetime]$beforeDate,
    [Parameter(ParameterSetName="IdADate",Mandatory=$true)]   
    [Parameter(ParameterSetName="AllADate",Mandatory=$true)]
    [Parameter(ParameterSetName="IdBothDate",Mandatory=$true)]    
    [Parameter(ParameterSetName="AllBothDate",Mandatory=$true)] 
    [datetime]$afterDate,
    [Parameter(ParameterSetName="IdLastYear",Mandatory=$true)]
    [Parameter(ParameterSetName="AllLastYear",Mandatory=$true)]
    [switch]$lastYear
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