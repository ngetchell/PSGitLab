---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitlabProjectRepositoryTree

## SYNOPSIS
Get the tree for a project

## SYNTAX

```
Get-GitlabProjectRepositoryTree [-ProjectID] <Int32> [[-CommitID] <String>] [<CommonParameters>]
```

## DESCRIPTION
Reads the Repository tree from a Project

## EXAMPLES

### EXAMPLE 1
```
Get-GitlabProjectRepositoryTree -ProjectID 1
```

GEt the Repository tree for project 1

## PARAMETERS

### -ProjectID
ProjectID.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CommitID
CommitID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
