---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: https://docs.gitlab.com/ce/api/projects.html#hooks
schema: 2.0.0
---

# New-GitLabUserKey

## SYNOPSIS
Creates new SSH Key for the current or another user.

## SYNTAX

### Explicit (Default)
```
New-GitLabUserKey [-Title <String>] -Key <String> [-Username <Object>] [<CommonParameters>]
```

### File
```
New-GitLabUserKey -KeyFile <String> [-Username <Object>] [<CommonParameters>]
```

## DESCRIPTION
Creates new SSH Key for the current or another user.
For another user, admin rights are required.

## EXAMPLES

### Example 1
```
PS C:\> New-GitLabUserKey -Title "Fake" -Key "ssh-rsa lkasjflkjasdf...."
```

Create a new key from the command prompt.

### Example 2
```
PS C:\> New-GitLabUserKey -KeyFile ~/.ssh/id_rsa.pub
```

Add a key from a keyfile.

## PARAMETERS

### -Key
A string representation of the SSH key.

```yaml
Type: String
Parameter Sets: Explicit
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyFile
The public key you wish to upload.

```yaml
Type: String
Parameter Sets: File
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
The title of the SSH key.

```yaml
Type: String
Parameter Sets: Explicit
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
The username of the user you would like to add the SSH key for. 

```yaml
Type: Object
Parameter Sets: (All)
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
