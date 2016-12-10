---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Remove-GitLabProject

## SYNOPSIS
Deletes a GitLab project.

## SYNTAX

```
Remove-GitLabProject [-Id] <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Deletes a GitLab project.
Can only be done by ID.
Supports should process.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-GitLabProject -Id 99
```

## PARAMETERS

### -Id
The project Id.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Run without making modifications.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Whether to continue or not.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

