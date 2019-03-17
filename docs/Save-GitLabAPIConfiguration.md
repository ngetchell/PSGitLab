---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Save-GitLabAPIConfiguration

## SYNOPSIS
Used to store information about your GitLab instance.

## SYNTAX

```
Save-GitLabAPIConfiguration [-Token] <Object> [-Domain] <Object> [-APIVersion <Object>] [<CommonParameters>]
```

## DESCRIPTION
Used to store information about your GitLab instance.
The domain and api token are given.

## EXAMPLES

### EXAMPLE 1
```
Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "mPnTssWyBCMjxxxxxxxJQ"
```

## PARAMETERS

### -APIVersion
The version of API used to execute calls.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 4
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Implemented using Export-CLIXML saving the configurations.
Stores .xml in $env:appdata\GitLabAPI\

## RELATED LINKS

[GitLab API](https://docs.gitlab.com/ee/api/README.html)
[Personal access tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
