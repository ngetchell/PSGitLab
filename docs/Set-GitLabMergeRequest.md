---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Set-GitLabMergeRequest

## SYNOPSIS
Modify your GitLab merge requests.

## SYNTAX

```
Set-GitLabMergeRequest [-ProjectId] <String> [-ID] <String[]> [[-TargetBranch] <String>]
 [[-AssigneeId] <String>] [[-Title] <String>] [[-Description] <String>] [[-StateEvent] <String>]
 [[-Labels] <String>] [[-MilestoneId] <String>] [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Modify your GitLab merge requests.
Useful for changing the names or other parameter of your merge request.

## EXAMPLES

### EXAMPLE 1
```
Set-GitLabMergeRequest -ProjectId 8 -Id 32 -Name "NewName"
```

### EXAMPLE 2
```
Get-GitLabMergeReqeust -ProjectId 8 | Set-GitLabMergeReqeust -Description 'Fake Description'
```

## PARAMETERS

### -ProjectId
The project ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases: project_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ID
The ID of the merge request your modifying.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TargetBranch
The target branch.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssigneeId
The ID of the user assigned to the merge request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
The title of the merge request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
The description of the merge request.

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

### -StateEvent
New state.

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

### -Passthru
Whether to return the merge request to the pipeline.

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
