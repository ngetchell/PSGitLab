---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabProjectEvent

## SYNOPSIS
Gets all of the project events.

## SYNTAX

### Id
```
Get-GitLabProjectEvent [-Id <String>] [<CommonParameters>]
```

### Namespace
```
Get-GitLabProjectEvent [-Namespace <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets all of the project events.
This uses the v3 GitLab API.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabProjectEvent
```

title           : 
project_id      : 62
action_name     : pushed to
target_id       : 
target_type     : 
author_id       : 2

## PARAMETERS

### -Id
The ID or NAMESPACE/PROJECT_NAME of the project.

```yaml
Type: String
Parameter Sets: Id
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Namespace
The namespace of the project.

```yaml
Type: String
Parameter Sets: Namespace
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Project.Event

## NOTES

## RELATED LINKS
