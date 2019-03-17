---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Remove-GitLabRunner

## SYNOPSIS
Removes a runner.

## SYNTAX

```
Remove-GitLabRunner -Id <Int32> [<CommonParameters>]
```

## DESCRIPTION
Removes a runner from GitLab.

## EXAMPLES

### EXAMPLE 1
```
Remove-GitLabRunner -Id 400
```

## PARAMETERS

### -Id
The ID of the GitLab runner to remove.

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

[Remove a runner](https://docs.gitlab.com/ce/api/runners.html#remove-a-runner)