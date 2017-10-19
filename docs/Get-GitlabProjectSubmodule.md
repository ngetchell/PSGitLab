---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitlabProjectSubmodule

## SYNOPSIS
Get the Submodules for a project

## SYNTAX

```
Get-GitlabProjectSubmodule [-ProjectID] <Int32> [[-CommitID] <AllowNullAttribute>]
```

## DESCRIPTION
Reads the submodules files and outputs the data

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
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
Type: AllowNullAttribute
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
requires .gitmodules to exist in the root of the project

## RELATED LINKS

