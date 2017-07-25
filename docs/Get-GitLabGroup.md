---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitLabGroup

## SYNOPSIS
Get a list of groups from your GitLab instance.

## SYNTAX

### All (Default)
```
Get-GitLabGroup [-All]
```

### ID
```
Get-GitLabGroup [-GroupID <Object>]
```

### Search
```
Get-GitLabGroup [-Search <Object>]
```

## DESCRIPTION
Get a list of groups from your GitLab instance. Search parameter allows you to find by name or description.

## EXAMPLES

### Example 1
```
PS C:\> Get-GitlabGroup -All
```

Get a list of all groups in the GitLab instance.

### Example 2
```
PS C:\> Get-GitlabGroup -GroupID 3
```

Get a specific group from the GitLab instance.

### Example 3
```
PS C:\> Get-GitlabGroup -Search 'Example'
```

Find a specific group via the search function of the API.

## PARAMETERS

### -All
Get all of the groups.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupID
Get a certain group.

```yaml
Type: Object
Parameter Sets: ID
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Find a group by name or description.

```yaml
Type: Object
Parameter Sets: Search
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None


## OUTPUTS

### GitLab.Group


## NOTES

## RELATED LINKS

