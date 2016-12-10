Function Get-GitLabCommitStats {
[cmdletbinding()]
[OutputType('GitLab.Commit')]
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
    [string[]]$author = "*",
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
        $commits = @()
        $dtcommits = @()
        if (!($Id)) {
            $allProjectsId = (Get-GitLabProject -All).Id
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
        foreach ($name in $author) {
            if ($lastYear) {
                $dtCommits += $commits | Where-Object {[datetime]$_.created_at -ge ((Get-Date).AddDays(-365))} | Where-Object {$_.author_name -like $name}
            } elseif ($beforeDate) {
                if ($afterDate) {
                    if ($beforeDate -le $afterDate) {
                        throw "beforeDate cannot be less than afterDate"
                    } else {
                        $dtCommits += $commits | Where-Object {([datetime]$_.created_at -le (Get-Date $beforeDate)) -and ([datetime]$_.created_at -ge (Get-Date $afterDate))} | Where-Object {$_.author_name -like $name}
                    }
                } else {
                    $dtCommits += $commits | Where-Object {[datetime]$_.created_at -le (Get-Date $beforeDate)} | Where-Object {$_.author_name -like $name}
                }
            } elseif ($afterDate) {
                $dtCommits += $commits | Where-Object {[datetime]$_.created_at -ge (Get-Date $afterDate)} | Where-Object {$_.author_name -like $name}
            } else {
                $dtCommits += $commits | Where-Object {$_.author_name -like $name}
            }
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