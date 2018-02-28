---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: 
schema: 2.0.0
---

# Remove-GitLabProjectServiceMSTeams

## SYNOPSIS
Get rid of the service.

## SYNTAX

```
Remove-GitLabProjectServiceMSTeams [-Id <String>] [-Namespace <String>]
```

## DESCRIPTION
Get rid of the service. The configurations can be found at Admin > Service Templates > Microsoft Teams Notification. 

## EXAMPLES

### Example 1
```
PS C:\> Remove-GitLabProjectServiceMSTeams -Id 12
```

Removes the service from project 12. 

## PARAMETERS

### -Id
ProjectID

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Namespace
The name of the project in namespace format. 

```yaml
Type: String
Parameter Sets: (All)
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

### GitLab.Project.Service.MSTeams


## NOTES

## RELATED LINKS

