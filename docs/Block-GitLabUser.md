---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Block-GitLabUser

## SYNOPSIS
Gives you the ability to block users in GitLab.

## SYNTAX

### ID (Default)
```
Block-GitLabUser -ID <String> [-Passthru]
```

### Username
```
Block-GitLabUser -Username <String> [-Passthru]
```

### Email
```
Block-GitLabUser -Email <String> [-Passthru]
```

## DESCRIPTION
Gives you the ability to block users in GitLab.
Can be done by parameter or by pipeline.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Block-GitLabUser -Username fake
```

### -------------------------- EXAMPLE 2 --------------------------
```
Block-GitLabUser -Email fake@email.com
```

### -------------------------- EXAMPLE 3 --------------------------
```
Block-GitLabUser -ID 22
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-GitLabUser -Username fake | Block-GitLabUser
```

## PARAMETERS

### -ID
The GitLab user ID.

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
The username of the user to be blocked.

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
The email of the user to be blocked.

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
Return the blocked user to the pipeline.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

