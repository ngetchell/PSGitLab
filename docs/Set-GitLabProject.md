---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Set-GitLabProject

## SYNOPSIS
Modify your GitLab projects.

## SYNTAX

```
Set-GitLabProject -ID <String[]> [-Name <String>] [-Path <String>] [-Description <String>]
 [-VisabilityLevel <Object>] [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Modify your GitLab projects.
Useful for changing the names or changing the visibility of your project.

## EXAMPLES

### EXAMPLE 1
```
Set-GitLabProject -Id 32 -Name "NewName"
```

### EXAMPLE 2
```
Get-GitLabProject  | Set-GitLabProject -Description 'Fake Description'
```

## PARAMETERS

### -ID
The project ID.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
The name of the new project.

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

### -Path
Custom repository name for new project.
By default generated based on name.

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

### -Description
The description of the project.

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

### -VisabilityLevel
\[Alias('issues_enabled')\]
\[switch\]$IssuesEnabled = $false,
$merge_requests_enabled,
$wiki_enabled,
$snippets_enabled,
$public,

```yaml
Type: Object
Parameter Sets: (All)
Aliases: visibility_level

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru
Whether to return the project to the pipeline.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
