---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Set-GitLabMilestone

## SYNOPSIS
Modify your GitLab milestone.

## SYNTAX

```
Set-GitLabMilestone [-ProjectId] <String> [-ID] <String[]> [[-Title] <String>] [[-Description] <String>]
 [[-DueDate] <DateTime>] [[-StateEvent] <String>] [<CommonParameters>]
```

## DESCRIPTION
Modify your GitLab milestone.
Useful for changing the names or other parameter of your milestone.

## EXAMPLES

### EXAMPLE 1
```
Set-GitLabMilestone -ProjectId 8 -Id 32 -Name "NewName"
```

### EXAMPLE 2
```
Get-GitLabMilestone -ProjectId 8 | Set-GitLabMilestone -Description 'Fake Description'
```

## PARAMETERS

### -ProjectId
The ID of a project.

```yaml
Type: String
Parameter Sets: (All)
Aliases: project_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ID
Milestone Id.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Title
The title of an milestone.

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

### -Description
The description of an milestone

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StateEvent
Whether closed or open.

```yaml
Type: String
Parameter Sets: (All)
Aliases: state_event

Required: False
Position: 6
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
