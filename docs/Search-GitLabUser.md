---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Search-GitLabUser

## SYNOPSIS
Retrives a GitLab user.

## SYNTAX

```
Search-GitLabUser [-User] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrives a GitLab user.

## EXAMPLES

### EXAMPLE 1
```
Search-GitLabUser ngetchell
```

name               : Nicholas Getchell
username           : ngetchell
id                 : 2
state              : active
is_admin           : true

## PARAMETERS

### -User
The search criteria for the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
