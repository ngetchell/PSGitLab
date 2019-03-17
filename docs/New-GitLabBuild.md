---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# New-GitLabBuild

## SYNOPSIS
Triggers a build

## SYNTAX

### Variable
```
New-GitLabBuild -ProjectId <Int32> -Reference <String> -token <String> -Variable <String> -Value <String>
 [<CommonParameters>]
```

### Default
```
New-GitLabBuild -ProjectId <Int32> -Reference <String> -token <String> [<CommonParameters>]
```

## DESCRIPTION
Triggers a build

## EXAMPLES

### EXAMPLE 1
```
New-GitLabBuild -Id 18 -Reference 'master' -Variable "GENERATE_SCRIPTS" -Value "true"
```

id variables               
-- ---------               
 6 @{GENERATE_SCRIPTS=true}

## PARAMETERS

### -ProjectId
The ID of a project

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reference
Which branch branch to run the build against.

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

### -token
The user token.

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

### -Variable
The build variable for this build.

```yaml
Type: String
Parameter Sets: Variable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
The value of the build variable.

```yaml
Type: String
Parameter Sets: Variable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
