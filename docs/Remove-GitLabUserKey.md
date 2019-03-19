---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Remove-GitLabUserKey

## SYNOPSIS
Gets rid of an SSH key for the current user or another user. 

## SYNTAX

### User
```
Remove-GitLabUserKey -Id <String> -Username <String> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Id
```
Remove-GitLabUserKey -Id <String> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Gets rid of an SSH key for the current user or another user. For another user you must have admin rights. 

## EXAMPLES

### Example 1
```
PS C:\> Remove-GitLabUserKey -Id 2
```

Removes the second user key.

### Example 1
```
PS C:\> Remove-GitLabUserKey -Id 2 -User root
```

Removes the second user key that belongs to root.

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

### -Id
The id of the key. 

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru
Whether to return the key information or not. 

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
The username you would like to delete the key for. 

```yaml
Type: String
Parameter Sets: User
Aliases:

Required: True
Position: Named
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### GitLab.User.Key

## NOTES

## RELATED LINKS
