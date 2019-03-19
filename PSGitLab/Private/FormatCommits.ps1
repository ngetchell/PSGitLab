Function FormatCommits {
    param(
        [Parameter(Mandatory=$true)]
        [psobject]$dtCommits,
        [switch]$byAuthor,
        [switch]$byWeek
    )

    $commits = @()
    $results = @()

    if ($byAuthor) {
        $authors = $dtCommits.author_email.ToLower() | sort | unique -AsString
        $commitHash = @{}
        foreach ($name in $authors.author_email) {
            $commitHash.Add($name, 0)
        }
        foreach ($c in $dtcommits) {
            $tempValue = $null
            $tempValue = $commitHash[$c.author_email] + 1
            $commitHash.Set_Item($c.author_email, $tempValue)
        }
        foreach ($k in $commitHash.keys) {
            $tempObj = new-object psobject
            Add-Member -InputObject $tempObj -MemberType NoteProperty -Name Author -Value $k
            Add-Member -InputObject $tempObj -MemberType NoteProperty -Name Commits -Value $commitHash[$k]
            $commits += $tempObj
        }
        $results = $commits
    }
    if ($byWeek) {
        foreach ($c in $dtCommits) {
            $tempObj = new-object psobject
            Add-Member -InputObject $tempObj -MemberType NoteProperty -Name Week -Value (GetWeek -DateTime $c.created_at)
            Add-Member -InputObject $tempObj -MemberType NoteProperty -Name Day -Value (Get-Date ([datetime]($c.created_at)) -UFormat %w)
            $commits += $tempObj
        }
        $weeks = $commits | Sort-Object -Property Week | Group-Object -Property Week
        foreach ($week in $weeks.Name) {
            $total = 0
            $getWeek = $commits | Where-Object {$_.Week -eq $week}
            $days = $getWeek | Sort-Object -Property Day | Group-Object -Property Day
            $output = new-object psobject
            Add-Member -InputObject $output -MemberType NoteProperty -Name Week -Value $week
            Add-Member -InputObject $output -MemberType NoteProperty -Name Sun -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Mon -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Tue -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Wed -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Thu -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Fri -Value 0
            Add-Member -InputObject $output -MemberType NoteProperty -Name Sat -Value 0
            foreach ($day in $days) {
                if ($day.Name -eq 0) {
                    $output.Sun = $day.Count
                } elseif ($day.Name -eq 1) {
                    $output.Mon = $day.Count
                } elseif ($day.Name -eq 2) {
                    $output.Tue = $day.Count
                } elseif ($day.Name -eq 3) {
                    $output.Wed = $day.Count
                } elseif ($day.Name -eq 4) {
                    $output.Thu = $day.Count
                } elseif ($day.Name -eq 5) {
                    $output.Fri = $day.Count
                } elseif ($day.Name -eq 6) {
                    $output.Sat = $day.Count
                }
                $total += $day.Count
            }
            Add-Member -InputObject $output -MemberType NoteProperty -Name WeeklyTotal -Value $total
            if ($weeks.Name.Count -gt 1)
            {
                $runningTotal += $total
                Add-Member -InputObject $output -MemberType NoteProperty -Name RunningTotal -Value $runningTotal
            }
            $results += $output
        }
    }
    Write-Output $results
}
