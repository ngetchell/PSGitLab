---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabNamespace

## SYNOPSIS
Retrieves all of the different namespaces in a GitLab instance.

## SYNTAX

```
Get-GitLabNamespace [[-search] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves all of the different namespaces in a GitLab instance.
Queries over HTTP and returns GitLab.Namespace type.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabNamespace
```

## PARAMETERS

### -search
Returns a list of namespaces the user is authorized to see based on the search criteria.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Namespace

## NOTES

## RELATED LINKS
