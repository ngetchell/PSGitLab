---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Close-GitLabMilestone

## SYNOPSIS
Closes your GitLab milestone.

## SYNTAX

```
Close-GitLabMilestone [-ProjectId] <String> [-ID] <String[]> [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Closes your GitLab milestone.

## EXAMPLES

### EXAMPLE 1
```
Close-GitLabMilestone -ProjectId 8 -Id 32
```

## PARAMETERS

### -ProjectId
The project ID.

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
The ID of the milestone to be closed.

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

### -Passthru
Return the closed milestone.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
