---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabMergeRequest

## SYNOPSIS
Retrieves all of the different merge requests for a project in a GitLab instance.

## SYNTAX

### MergeRequests (Default)
```
Get-GitLabMergeRequest -ProjectId <String> [-Iid <String>] [-State <String>] [-OrderBy <String>]
 [-Sort <String>] [<CommonParameters>]
```

### Single
```
Get-GitLabMergeRequest -ProjectId <String> -Id <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieves all of the different merge requests for a project in a GitLab instance.
Queries over HTTP and returns GitLab.MergeRequest type.

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabMergeRequest -ProjectId 1
```

### EXAMPLE 1
```
Get-GitLabMergeRequest -ProjectId 1 -Id 20
```

## PARAMETERS

### -ProjectId
The ID of a project

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
The ID of the merge request your retrieving.

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
Return the request having the given iid.

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
Return all requests or just those that are merged, opened or closed.

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

### -OrderBy
Return requests ordered by created_at or updated_at fields.
Default is created_at.

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

### -Sort
Return requests sorted in asc or desc order.
Default is desc.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.MergeRequest

## NOTES

## RELATED LINKS
