---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Set-GitLabUser

## SYNOPSIS
Modify users already created in your GitLab instance.

## SYNTAX

### ID
```
Set-GitLabUser -ID <String> [-Password <String>] [-NewUsername <String>] [-Name <String>] [-SkypeID <String>]
 [-LinkedIn <String>] [-Twitter <String>] [-WebsiteURL <String>] [-ProjectsLimit <Int32>] [-Admin]
 [-CanCreateGroup] [-External] [-Passthru] [<CommonParameters>]
```

### Email
```
Set-GitLabUser -Email <String> [-Password <String>] [-NewUsername <String>] [-Name <String>]
 [-SkypeID <String>] [-LinkedIn <String>] [-Twitter <String>] [-WebsiteURL <String>] [-ProjectsLimit <Int32>]
 [-Admin] [-CanCreateGroup] [-External] [-Passthru] [<CommonParameters>]
```

### Username
```
Set-GitLabUser -Username <String> [-Password <String>] [-NewUsername <String>] [-Name <String>]
 [-SkypeID <String>] [-LinkedIn <String>] [-Twitter <String>] [-WebsiteURL <String>] [-ProjectsLimit <Int32>]
 [-Admin] [-CanCreateGroup] [-External] [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Modify users already created in your GitLab instance.
Useful for making someone an admin from the command line.

## EXAMPLES

### EXAMPLE 1
```
Set-GitLabUser -Email FakeEmail@example.com -Twitter 'newtwitterID'
```

### EXAMPLE 2
```
Set-GitLabUser -Username FakeUserName -Admin
```

## PARAMETERS

### -ID
The ID of the user.

```yaml
Type: String
Parameter Sets: ID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The email of the user.

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

### -Username
The username for the user.

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

### -Password
The password for the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewUsername
The new username for the given user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The full name of the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkypeID
The SkypeID of the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkedIn
The URL for the LinkedIn user profile.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Twitter
The twitter handle of the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebsiteURL
The URL for the user's website.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectsLimit
To limit how many projects a user can have open.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Admin
Make a user an admin.

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

### -CanCreateGroup
Whether a user can create a group.

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

### -External
External UID.

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

### -Passthru
To return the user to the pipeline.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
