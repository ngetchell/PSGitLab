---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Restart-GitLabPipeline

## SYNOPSIS
Restarts a pipeline.

## SYNTAX

```
Restart-GitLabPipeline [-ProjectID] <Int32> [-Id] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Restart a pipeline what is not currently running or pending.

## EXAMPLES

### Example 1
```powershell
PS C:\> Restart-GitLabPipeline -ProjectID 1 -Id 17
```

Restart the pipeline 17 for the project identified by Id 1

## PARAMETERS

### -Id
{{Fill Id Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectID
{{Fill ProjectID Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### GitLab.Project.Pipeline

## NOTES

## RELATED LINKS

[GitLab pipelines API](https://docs.gitlab.com/ee/api/pipelines.html)
