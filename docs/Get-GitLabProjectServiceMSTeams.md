---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabProjectServiceMSTeams

## SYNOPSIS
Get the Microsoft Teams Service from GitLab.

## SYNTAX

```
Get-GitLabProjectServiceMSTeams [-Id <String>] [-Namespace <String>] [<CommonParameters>]
```

## DESCRIPTION
Get the Microsoft Teams Service from GitLab. The configurations can be found at Admin > Service Templates > Microsoft Teams Notification. 

## EXAMPLES

### Example 1
```
PS C:\> Get-GitLabProjectServiceMSTeams -id 12
```

Get the MS Team configuration for the Project 12

## PARAMETERS

### -Id
Project ID

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
The name of the project.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### GitLab.Project.Service.MSTeams

## NOTES

## RELATED LINKS
