---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabRunner

## SYNOPSIS
Retrieve all runner in a GitLab instance.

## SYNTAX

### Single (Default)
```
Get-GitLabRunner -Id <Int32> [<CommonParameters>]
```

### Project
```
Get-GitLabRunner -ProjectId <Int32> [<CommonParameters>]
```

### Owned
```
Get-GitLabRunner [-Owned] [-Scope <Object>] [<CommonParameters>]
```

### All
```
Get-GitLabRunner [-All] [-Scope <Object>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve all runners in a GitLab instance.
Queries over HTTP and gets back GitLab.Project type.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabRunner -All
```

### EXAMPLE 2
```
Get-GitLabRunner -Owned
```

### EXAMPLE 3
```
Get-GitLabRunner -Id 4
```

## PARAMETERS

### -Id
The ID of the runner.

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

### -ProjectId
The ID of the project for which to list all runners.

```yaml
Type: Int32
Parameter Sets: Project
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Owned
Return all owned runners.

```yaml
Type: SwitchParameter
Parameter Sets: Owned
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return all available runners.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Limits the scope of runners to return.

```yaml
Type: Object
Parameter Sets: Owned, All
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

### GitLab.Runner

## NOTES

## RELATED LINKS

[Get runner details](https://docs.gitlab.com/ce/api/runners.html#get-runner-s-details)
[List owned runners](https://docs.gitlab.com/ce/api/runners.html#list-owned-runners)
[List all runners](https://docs.gitlab.com/ce/api/runners.html#list-all-runners)