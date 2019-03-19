---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# New-GitLabGroup

## SYNOPSIS
Creates a new GitLab group.

## SYNTAX

```
New-GitLabGroup [-Name] <Object> [-Path] <Object> [[-Description] <Object>] [[-Visibility] <Object>]
 [[-Parent_Id] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new GitLab group.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```powershell
PS C:\> New-GitLabGroup -Name 'TestGroup1' -Path 'TestGroup1' -Description 'This is a description.'
```

### -------------------------- EXAMPLE 2 --------------------------
```powershell
PS C:\> New-GitLabGroup -Name 'TestGroup2' -Path 'ITDept-TestGroup2' -Description 'This is a description.'
```

### -------------------------- EXAMPLE 3 --------------------------
```powershell
PS C:\> New-GitLabGroup -Name 'testGroup6' -Path 'nestedgroup' -Description 'something' -Parent_Id 34
```

## PARAMETERS

### -Description
A description for the group.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the group.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parent_Id
The ID for the parent group (if specified this will create a subgroup).

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path you wish the group to exist at.

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

### -Visibility
Visibility of the group. Defaults to private.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: public, internal, private

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### GitLab.Group

## NOTES

## RELATED LINKS
