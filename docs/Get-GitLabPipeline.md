---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabPipeline

## SYNOPSIS
Retrieves all pipelines for a provided GitLab project.

## SYNTAX

### Pipelines (Default)
```
Get-GitLabPipeline -ProjectID <Int32> [-Scope <Object>] [-Status <Object>] [-Order_by <Object>]
 [-Sort <Object>] [<CommonParameters>]
```

### Single
```
Get-GitLabPipeline -ProjectID <Int32> -Id <Int32> [<CommonParameters>]
```

### ByTag
```
Get-GitLabPipeline -ProjectID <Int32> [-Scope <Object>] [-Status <Object>] -Tag <String> [-Order_by <Object>]
 [-Sort <Object>] [<CommonParameters>]
```

### ByBranch
```
Get-GitLabPipeline -ProjectID <Int32> [-Scope <Object>] [-Status <Object>] -Branch <String>
 [-Order_by <Object>] [-Sort <Object>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve all pipeline for a provided GitLab project.
Queries over HTTP and gets back GitLab.Project.Pipeline type.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-GitLabPipeline -ProjectId 63
```

It returns all pipelines created previously for the project with the Id 63.

## PARAMETERS

### -Branch
A branch name for which pipelines has to be returned.

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

### -Id
The unique pipeline Id. If will be provided only the one project will be returned.

```yaml
Type: Int32
Parameter Sets: Single
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order_by
Return projects ordered by id, status, ref or user_id.

```yaml
Type: Object
Parameter Sets: Pipelines, ByTag, ByBranch
Aliases:
Accepted values: id, status, ref, user_id

Required: False
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

### -Scope
Scope of returned pipelines.

```yaml
Type: Object
Parameter Sets: Pipelines, ByTag, ByBranch
Aliases:
Accepted values: running, pending, finished, branches, tags, all

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sort
Return pipelines sorted in asc or desc order.
Default is desc.

```yaml
Type: Object
Parameter Sets: Pipelines, ByTag, ByBranch
Aliases:
Accepted values: asc, desc

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Returns of pipelines only with a status.

```yaml
Type: Object
Parameter Sets: Pipelines, ByTag, ByBranch
Aliases:
Accepted values: running, pending, success, failed, canceled, skipped, all

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
A tag for which pipelines has to be returned.

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
