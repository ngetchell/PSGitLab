---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabIssue

## SYNOPSIS
Get issues from the GitLab instance.

## SYNTAX

### User (Default)
```
Get-GitLabIssue [-Scope <String>] [-State <String>] [<CommonParameters>]
```

### GroupID
```
Get-GitLabIssue [-GroupID <Int32>] [-Scope <String>] [-State <String>] [<CommonParameters>]
```

## DESCRIPTION
Get issues from the GitLab instance.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabIssue
```

Returns all issues created by the current user.

### EXAMPLE 2
```
Get-GitLabIssue -Scope all
```

Returns all issues the current user has access to.

### EXAMPLE 3
```
Get-GitLabIssue -State closed
```

Returns all issues created by the current user that are closed.

### EXAMPLE 4
```
Get-GitLabIssue -GroupID 2
```

Returns all issues in the group with an ID of 2.

### EXAMPLE 5
```
Get-GitLabIssue -GroupID 2 -Scope AssignedToMe
```

Returns all issues in the group with an ID of 2, that are assigned to me.

## PARAMETERS

### -GroupID
A group ID.

```yaml
Type: Int32
Parameter Sets: GroupID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Scope for the request. All returns all issues the current user can access. CreatedByMe are issues created by the current user, and AssignedToMe are issues that have been assigned to the current user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: All, CreatedByMe, AssignedToMe

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
Filter by issues that are closed or opened only.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: opened, closed

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Issue

## NOTES

## RELATED LINKS
