---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# New-GitLabMilestone

## SYNOPSIS
Creates a new milestone.
Uses the user namespace.

## SYNTAX

```
New-GitLabMilestone [-ProjectId] <String> [-Title] <String> [[-Description] <String>] [[-DueDate] <DateTime>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new milestone.
Uses the user namespace.
This uses the v3 GitLab API.

## EXAMPLES

### EXAMPLE 1
```
New-GitLabMilestone -ProjectId 8 -Title "2016-KW30" -Description "MyDescription" -DueDate (Get-Date).AddDays(10)
```

## PARAMETERS

### -ProjectId
The ID of a project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
The title of an milestone.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
The description of an milestone

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
The due date of the milestone.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
