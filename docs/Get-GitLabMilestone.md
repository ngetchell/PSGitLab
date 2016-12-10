---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitLabMilestone

## SYNOPSIS
Retrieves all of the different milestones for a project in a GitLab instance.

## SYNTAX

### MergeRequests (Default)
```
Get-GitLabMilestone -ProjectId <String> [-Iid <String>] [-State <String>]
```

### Single
```
Get-GitLabMilestone -ProjectId <String> -Id <String>
```

## DESCRIPTION
Retrieves all of the different milestones for a project in a GitLab instance.
Queries over HTTP and returns GitLab.MergeRequest type.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitLabMilestone -ProjectId 1
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-GitLabMilestone -ProjectId 1 -Id 20
```

## PARAMETERS

### -ProjectId
The project ID.

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

### -Id
The ID of the milestone.

```yaml
Type: String
Parameter Sets: Single
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Iid
The exacty milestone Id.

```yaml
Type: String
Parameter Sets: MergeRequests
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
Return only active or closed milestones.

```yaml
Type: String
Parameter Sets: MergeRequests
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### GitLab.Milestone

## NOTES

## RELATED LINKS

