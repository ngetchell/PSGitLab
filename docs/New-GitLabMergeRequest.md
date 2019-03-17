---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# New-GitLabMergeRequest

## SYNOPSIS
Creates a new merge request.
Uses the user namespace.

## SYNTAX

```
New-GitLabMergeRequest [-ProjectId] <String> [-SourceBranch] <String> [-TargetBranch] <String>
 [[-AssigneeId] <Int32>] [-Title] <String> [[-Description] <String>] [[-TargetProjectId] <String>]
 [[-Labels] <String>] [[-MilestoneId] <String>] [-RemoveSourceBranch] [<CommonParameters>]
```

## DESCRIPTION
Creates a new merge request.
Uses the user namespace.
This uses the v3 GitLab API.

## EXAMPLES

### EXAMPLE 1
```
New-GitLabMergeRequest -ProjectId 8 -SourceBranch issue-1234 -TargetBranch master -Title "WIP: issue 1234"
```

## PARAMETERS

### -ProjectId
The ID of a project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceBranch
The source branch.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetBranch
The target branch.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssigneeId
Assignee user ID.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title of the merge request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Description of the merge request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetProjectId
The target project (numeric id).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Labels
Labels for MR as a comma-separated list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MilestoneId
Milestone ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveSourceBranch
{{Fill RemoveSourceBranch Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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

## NOTES

## RELATED LINKS
