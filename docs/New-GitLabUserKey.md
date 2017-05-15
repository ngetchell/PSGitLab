---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# New-GitLabUserKey

## SYNOPSIS
Creates new SSH Key for the current or another user. 

## SYNTAX

### Explicit (Default)
```
New-GitLabUserKey [-Title <String>] -Key <String>
```

### File
```
New-GitLabUserKey -KeyFile <String>
```

## DESCRIPTION
Creates new SSH Key for the current or another user. For another user, admin rights are required. 

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

## INPUTS

### None


## OUTPUTS

### GitLab.User.Key


## NOTES

## RELATED LINKS

