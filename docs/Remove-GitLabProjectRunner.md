---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Remove-GitLabProjectRunner

## SYNOPSIS
Disable a specific runner from the project. 

## SYNTAX

```
Remove-GitLabProjectRunner -RunnerId <Int32> -ProjectId <Int32> [<CommonParameters>]
```

## DESCRIPTION
Disable a specific runner from the project.
Works only if the project isn't the only project associated with the specified runner.
If so, an error is returned. Use the Remove-GitLabRunner instead.

## EXAMPLES

### EXAMPLE 1
```
Remove-GitLabProjectRunner -RunnerId 400 -ProjectId 500
```

## PARAMETERS

### -RunnerId
The ID of the GitLab runner to disable on the project.

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
The ID of the project on which to disable the runner.

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

[Disable a runner in a project](https://docs.gitlab.com/ce/api/runners.html#disable-a-runner-from-project)