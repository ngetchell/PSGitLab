---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Add-GitLabProjectRunner

## SYNOPSIS
Enable an available specific runner in the project.

## SYNTAX

```
Add-GitLabProjectRunner -RunnerId <Int32> -ProjectId <Int32> [<CommonParameters>]
```

## DESCRIPTION
Enable an available specific runner in the project.

## EXAMPLES

### EXAMPLE 1
```
Add-GitLabProjectRunner -RunnerId 400 -ProjectId 500
```

## PARAMETERS

### -RunnerId
The ID of the GitLab runner to enable on the project.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectId
The ID of the project on which to enable the runner.

```yaml
Type: Int32
Parameter Sets: (All)
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

## NOTES

## RELATED LINKS

[Enable a runner in a project](https://docs.gitlab.com/ce/api/runners.html#enable-a-runner-in-project)