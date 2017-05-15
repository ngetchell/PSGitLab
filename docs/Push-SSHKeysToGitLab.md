---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Push-SSHKeysToGitLab

## SYNOPSIS
Push all of your public keys to GitLab. 

## SYNTAX

```
Push-SSHKeysToGitLab [[-SSHDirectory] <Object>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Push all of your public keys to GitLab. Confirmation level of High. 

## EXAMPLES

### Example 1
```
PS C:\> Push-SSHKeysToGitLab
```

Push all keys located in ~/.ssh to your GitLab instance. 

### Example 2
```
PS C:\> Push-SSHKeysToGitLab -SSHDirectory "c:\ssh\"
```

Overwrite the default directory and push to GitLab instance. 

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

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

### -SSHDirectory
A folder with SSH public keys. 

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

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

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

