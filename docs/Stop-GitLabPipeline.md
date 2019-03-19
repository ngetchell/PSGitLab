---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Stop-GitLabPipeline

## SYNOPSIS
Stop/cancel a pipeline.

## SYNTAX

```
Stop-GitLabPipeline [-ProjectID] <Int32> [-Id] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Stops a currently running pipeline.

## EXAMPLES

### Example 1
```powershell
PS C:\> Stop-GitLabPipeline -ProjectID 1 -Id 17
```

Stops the pipeline 17 for the project with the ID 1.

## PARAMETERS

### -Id
The Id of pipeline.

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
The ID or NAMESPACE/PROJECT_NAME of the project.

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
