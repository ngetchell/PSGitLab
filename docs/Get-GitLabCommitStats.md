---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitLabCommitStats

## SYNOPSIS
Retrieves information about commits to projects

## SYNTAX

### IdBothDate
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] -beforeDate <DateTime> -afterDate <DateTime>
```

### IdADate
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] -afterDate <DateTime>
```

### IdBDate
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] -beforeDate <DateTime>
```

### IdLastYear
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] [-lastYear]
```

### IdAuth
```
Get-GitLabCommitStats -Id <Int32> -author <String[]>
```

### Id
```
Get-GitLabCommitStats -Id <Int32>
```

### AllBothDate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -beforeDate <DateTime> -afterDate <DateTime>
```

### AllADate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -afterDate <DateTime>
```

### AllBDate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -beforeDate <DateTime>
```

### AllLastYear
```
Get-GitLabCommitStats [-All] [-author <String[]>] [-lastYear]
```

### AllAuth
```
Get-GitLabCommitStats [-All] -author <String[]>
```

### All
```
Get-GitLabCommitStats [-All]
```

## DESCRIPTION
Retrieves information about commits to projects

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitLabCommitStats -Id 52 -afterDate "2016-07-01" -author "Test User" | ft
```

Week Sun Mon Tue Wed Thu Fri Sat WeeklyTotal RunningTotal
---- --- --- --- --- --- --- --- ----------- ------------
30     1   0   0   0   1   0   0           2            2
31     0   0   0   0   0   2   0           2            4

## PARAMETERS

### -Id
The ID of the commit.

```yaml
Type: Int32
Parameter Sets: IdBothDate, IdADate, IdBDate, IdLastYear, IdAuth, Id
Aliases: 

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Show all commits.

```yaml
Type: SwitchParameter
Parameter Sets: AllBothDate, AllADate, AllBDate, AllLastYear, AllAuth, All
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -author
The user making the commits.

```yaml
Type: String[]
Parameter Sets: IdBothDate, IdADate, IdBDate, IdLastYear, AllBothDate, AllADate, AllBDate, AllLastYear
Aliases: 

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String[]
Parameter Sets: IdAuth, AllAuth
Aliases: 

Required: True
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -beforeDate
Only show commit stats before a certain date.

```yaml
Type: DateTime
Parameter Sets: IdBothDate, IdBDate, AllBothDate, AllBDate
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -afterDate
Only show commit stats after a certain date.

```yaml
Type: DateTime
Parameter Sets: IdBothDate, IdADate, AllBothDate, AllADate
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -lastYear
Only show in the last year.

```yaml
Type: SwitchParameter
Parameter Sets: IdLastYear, AllLastYear
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### GitLab.Commit

## NOTES

## RELATED LINKS

