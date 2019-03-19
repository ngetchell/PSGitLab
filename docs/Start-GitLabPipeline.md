---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Start-GitLabPipeline

## SYNOPSIS
Creates a pipeline.

## SYNTAX

### ByBranch
```
Start-GitLabPipeline -ProjectID <Int32> -Branch <String> [<CommonParameters>]
```

### ByTag
```
Start-GitLabPipeline -ProjectID <Int32> -Tag <String> [<CommonParameters>]
```

## DESCRIPTION
Creates a pipeline for a project and a reference (a branch or a tag).

## EXAMPLES

### Example 1
```powershell
PS C:\> Start-GitLabPipeline -ProjectID 1 -Tag v3.0.0
```

Creates a pipeline for the project with ID 1 and the tag 'v3.0.0

## PARAMETERS

### -Branch
Reference as a branch name.

```yaml
Type: String
Parameter Sets: ByBranch
Aliases:

Required: True
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
Reference as a tag name.

```yaml
Type: String
Parameter Sets: ByTag
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

### None

## OUTPUTS

### GitLab.Project.Pipeline

## NOTES

## RELATED LINKS

[GitLab pipelines API](https://docs.gitlab.com/ee/api/pipelines.html)
