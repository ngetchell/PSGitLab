---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitLabUser

## SYNOPSIS
Get users from the GitLab instance.

## SYNTAX

### All (Default)
```
Get-GitLabUser [-All]
```

### ID
```
Get-GitLabUser [-ID <String>]
```

### Username
```
Get-GitLabUser [-Username <String>]
```

### Email
```
Get-GitLabUser [-Email <String>]
```

### CurrentUser
```
Get-GitLabUser [-CurrentUser]
```

## DESCRIPTION
Get users from the GitLab instance.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitLabUser -ID 4
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-GitLabUser -All
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-GitLabUser -Username 'fakeuser'
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-GitLabUser -Email 'fake@domain.com'
```

## PARAMETERS

### -ID
The user ID.

```yaml
Type: String
Parameter Sets: ID
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return back all users.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Return user by username.

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

### -Email
Return user by email.

```yaml
Type: String
Parameter Sets: Email
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CurrentUser
Return back the current user.

```yaml
Type: SwitchParameter
Parameter Sets: CurrentUser
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### GitLab.User

## NOTES

## RELATED LINKS

