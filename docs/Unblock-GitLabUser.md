---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Unblock-GitLabUser

## SYNOPSIS
Used to unblock gitlab users.

## SYNTAX

### ID (Default)
```
Unblock-GitLabUser -ID <String> [-Passthru] [<CommonParameters>]
```

### Username
```
Unblock-GitLabUser -Username <String> [-Passthru] [<CommonParameters>]
```

### Email
```
Unblock-GitLabUser -Email <String> [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Used to unblock gitlab users. 
Can be done form the parameters or from the pipeline.

## EXAMPLES

### EXAMPLE 1
```
Unlock-GitLabUser -ID 22
```

### EXAMPLE 2
```
Unlock-GitLabUser -Email fake@email.com
```

### EXAMPLE 3
```
Unlock-GitLabUser -Username fake
```

### EXAMPLE 4
```
Get-GitLabUser -Username fake | Unblock-GitLabUser
```

## PARAMETERS

### -ID
The user ID.

```yaml
Type: String
Parameter Sets: ID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Username
The username for the user.

```yaml
Type: String
Parameter Sets: Username
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The email address for the user.

```yaml
Type: String
Parameter Sets: Email
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru
To return the unblocked user to the pipeline.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
