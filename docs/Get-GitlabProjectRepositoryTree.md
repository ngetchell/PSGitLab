---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitlabProjectRepositoryTree

## SYNOPSIS
Get the tree for a project

## SYNTAX

```
Get-GitlabProjectRepositoryTree [-ProjectID] <Int32> [[-CommitID] <AllowNullAttribute>]
```

## DESCRIPTION
Reads the Repository tree from a Project

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
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

## RELATED LINKS

