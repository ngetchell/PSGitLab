---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Save-GitLabAPIConfiguration

## SYNOPSIS
Used to store information about your GitLab instance.

## SYNTAX

```
Save-GitLabAPIConfiguration [-Token] <Object> [-Domain] <Object>
```

## DESCRIPTION
Used to store information about your GitLab instance.
The domain and api token are given.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "Token"
```

## PARAMETERS

### -Token
Your private token that can be found under the profile settings.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
The domain your GitLab instance runs under.
Example: http://gitlab.com.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Implemented using Export-CLIXML saving the configurations.
Stores .xml in $env:appdata\GitLabAPI\

## RELATED LINKS

