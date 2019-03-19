---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabUserKey

## SYNOPSIS
Retrieves SSH keys from the current user. It can also get the keys of other users if run as admin. 

## SYNTAX

### All (Default)
```
Get-GitLabUserKey [-All] [<CommonParameters>]
```

### Key
```
Get-GitLabUserKey [-Key <Int32>] [<CommonParameters>]
```

### Username
```
Get-GitLabUserKey [-Username <String>] [<CommonParameters>]
```

### UserID
```
Get-GitLabUserKey [-UserId <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves SSH keys from the current user. It can also get the keys of other users if run as admin. 

## EXAMPLES

### Example 1
```
PS C:\> Get-GitLabUserKey
```

Get a list of currently authenticated user's SSH keys.

### Example 2
```
PS C:\> Get-GitLabUserKey -Key 1
```

Get one key.

### Example 3
```
PS C:\> Get-GitLabUserKey -Username root
```

Get all of the keys associated with the user root.

## PARAMETERS

### -All
Get a list of currently authenticated user's SSH keys.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
Get the one key you're looking for. 

```yaml
Type: Int32
Parameter Sets: Key
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
Get a list of a specified user's SSH keys. Available only for admin.

```yaml
Type: Int32
Parameter Sets: UserID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Get a list of a specified user's SSH keys. Available only for admin.

```yaml
Type: String
Parameter Sets: Username
Aliases:

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
