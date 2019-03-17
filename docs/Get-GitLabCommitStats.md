---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
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
 [<CommonParameters>]
```

### IdADate
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] -afterDate <DateTime> [<CommonParameters>]
```

### IdBDate
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] -beforeDate <DateTime> [<CommonParameters>]
```

### IdByAuthor
```
Get-GitLabCommitStats [-Id <Int32>] [-author <String[]>] [-byAuthor] [<CommonParameters>]
```

### IdLastYear
```
Get-GitLabCommitStats -Id <Int32> [-author <String[]>] [-lastYear] [<CommonParameters>]
```

### IdAuth
```
Get-GitLabCommitStats -Id <Int32> -author <String[]> [<CommonParameters>]
```

### Id
```
Get-GitLabCommitStats -Id <Int32> [<CommonParameters>]
```

### AllBothDate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -beforeDate <DateTime> -afterDate <DateTime>
 [<CommonParameters>]
```

### AllADate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -afterDate <DateTime> [<CommonParameters>]
```

### AllBDate
```
Get-GitLabCommitStats [-All] [-author <String[]>] -beforeDate <DateTime> [<CommonParameters>]
```

### AllByAuthor
```
Get-GitLabCommitStats [-All] [-author <String[]>] [-byAuthor] [<CommonParameters>]
```

### AllLastYear
```
Get-GitLabCommitStats [-All] [-author <String[]>] [-lastYear] [<CommonParameters>]
```

### AllAuth
```
Get-GitLabCommitStats [-All] -author <String[]> [<CommonParameters>]
```

### All
```
Get-GitLabCommitStats [-All] [<CommonParameters>]
```

## DESCRIPTION
Retrieves information about commits to projects

## EXAMPLES

### EXAMPLE 1
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

```yaml
Type: Int32
Parameter Sets: IdByAuthor
Aliases:

Required: False
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

```yaml
Type: SwitchParameter
Parameter Sets: AllByAuthor
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -author
The user making the commits.

```yaml
Type: String[]
Parameter Sets: IdBothDate, IdADate, IdBDate, IdByAuthor, IdLastYear, AllBothDate, AllADate, AllBDate, AllByAuthor, AllLastYear
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

### -byAuthor
{{Fill byAuthor Description}}

```yaml
Type: SwitchParameter
Parameter Sets: IdByAuthor, AllByAuthor
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Commit

## NOTES

## RELATED LINKS
