---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitlabProjectSubmodule

## SYNOPSIS
Get the Submodules for a project

## SYNTAX

```
Get-GitlabProjectSubmodule [-ProjectID] <Int32> [[-CommitID] <String>] [<CommonParameters>]
```

## DESCRIPTION
Reads the submodules files and outputs the data

## EXAMPLES

### EXAMPLE 1
```
Get-GitlabProjectSubmodule -ProjectID 64
```

Get the submodules for project 64

## PARAMETERS

### -ProjectID
Project ID.

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
Commit ID for the project

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
requires .gitmodules to exist in the root of the project

## RELATED LINKS
