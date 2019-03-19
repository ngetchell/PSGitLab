---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabProject

## SYNOPSIS
Retrieve all projects in a GitLab instance.

## SYNTAX

### Projects (Default)
```
Get-GitLabProject [-Archived] [-Visibility <Object>] [-Order_by <Object>] [-Sort <Object>] [-Search <Object>]
 [<CommonParameters>]
```

### Single
```
Get-GitLabProject -Id <Int32> [<CommonParameters>]
```

### PerGroup
```
Get-GitLabProject -GroupId <Int32> [-Archived] [-Visibility <Object>] [-Order_by <Object>] [-Sort <Object>]
 [-Search <Object>] [<CommonParameters>]
```

### Starred
```
Get-GitLabProject [-Archived] [-Visibility <Object>] [-Order_by <Object>] [-Sort <Object>] [-Search <Object>]
 [-Starred] [<CommonParameters>]
```

### All
```
Get-GitLabProject [-Archived] [-Visibility <Object>] [-Order_by <Object>] [-Sort <Object>] [-Search <Object>]
 [-All] [<CommonParameters>]
```

### Owned
```
Get-GitLabProject [-Archived] [-Visibility <Object>] [-Order_by <Object>] [-Sort <Object>] [-Search <Object>]
 [-Owned] [<CommonParameters>]
```

## DESCRIPTION
Retrieve all projects in a GitLab instance.
Queries over HTTP and gets back GitLab.Project type.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabProject
```

### EXAMPLE 2
```
Get-GitLabProject -All
```

### EXAMPLE 3
```
Get-GitLabProject -Owned
```

### EXAMPLE 4
```
Get-GitLabProject -Id 4
```

### EXAMPLE 5
```
Get-GitLabProject -Archived
```

### EXAMPLE 6
```
Get-GitLabProject -Starred
```

### EXAMPLE 7
```
Get-GitLabProject -Search 'ngetchell' -Archived
```

### EXAMPLE 8
```
Get-GitLabProject  -Id 59 -Sort asc
```

## PARAMETERS

### -Id
The ID or NAMESPACE/PROJECT_NAME of the project.

```yaml
Type: Int32
Parameter Sets: Single
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId
The ID of the group to list projects.

```yaml
Type: Int32
Parameter Sets: PerGroup
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Limit by archived status.

```yaml
Type: SwitchParameter
Parameter Sets: Projects, PerGroup, Starred, All, Owned
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Visibility
Limit by visibility public, internal, or private.

```yaml
Type: Object
Parameter Sets: Projects, PerGroup, Starred, All, Owned
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order_by
Return projects ordered by id, name, path, created_at, updated_at, or last_activity_at fields.
Default is created_at.

```yaml
Type: Object
Parameter Sets: Projects, PerGroup, Starred, All, Owned
Aliases:

Required: False
Position: Named
Default value: Created_at
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sort
Return projects sorted in asc or desc order.
Default is desc.

```yaml
Type: Object
Parameter Sets: Projects, PerGroup, Starred, All, Owned
Aliases:

Required: False
Position: Named
Default value: Desc
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Return list of authorized projects matching the search criteria.

```yaml
Type: Object
Parameter Sets: Projects, PerGroup, Starred, All, Owned
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Owned
Return all owned projects.

```yaml
Type: SwitchParameter
Parameter Sets: Owned
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return all projects.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Starred
Return all starred projects.

```yaml
Type: SwitchParameter
Parameter Sets: Starred
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Project

## NOTES

## RELATED LINKS
