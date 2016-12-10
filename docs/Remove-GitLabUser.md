---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Remove-GitLabUser

## SYNOPSIS
User to get rid of users.

## SYNTAX

```
Remove-GitLabUser [-Username] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Used to get rid of users.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Search-GitLabUser -User 'fake' | Remove-GitLabUser
```

## PARAMETERS

### -Username
The username of the user being removed.

```yaml
Type: String[]
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

