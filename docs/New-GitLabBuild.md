---
external help file: PSGitLab-help.xml
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
```

### Default
```
New-GitLabBuild -ProjectId <Int32> -Reference <String> -token <String>
```

## DESCRIPTION
Triggers a build

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

