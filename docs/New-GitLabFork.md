---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# New-GitLabFork

## SYNOPSIS
Creates a new fork from a project.
Uses the user namespace.

## SYNTAX

```
New-GitLabFork [-Id <String>] [-Namespace <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new fork from a project.
Uses the user namespace.
This uses the v3 GitLab API.

## EXAMPLES

### EXAMPLE 1
```
New-GitLabFork -Id 39
```

id                  : 99
name                : Chef
name_with_namespace : ngetchell / Chef
web_url             : http://example.com/HomeLab/Chef
created_at          : 2016-02-01T23:55:26.696Z
last_activity_at    : 2016-04-24T18:42:58.529Z

## PARAMETERS

### -Id
The ID or NAMESPACE/PROJECT_NAME of the project.

```yaml
Type: String
Parameter Sets: (All)
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
Parameter Sets: (All)
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

## NOTES

## RELATED LINKS
