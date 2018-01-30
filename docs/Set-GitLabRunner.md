---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Set-GitLabRunner

## SYNOPSIS
Updates a runner's details.

## SYNTAX

```
Set-GitLabRunner -Id <int> -Description <string> -Active <bool> -Tags <string> -RunUntagged <bool> -Locked <bool> -AccessLevel [not_protected|ref_protected]
```

## DESCRIPTION
Updates a runner's details.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-GitLabRunner -Id 400 -Active $true -Locked $false
```

## PARAMETERS

### -Id
The ID of the GitLab runner to update.

### -Description
The description of a runner.

### -Active
The state of a runner; can be set to true or false.

### -Tags
The comma-separated list of tags for a runner.

### -RunUntagged
Flag indicating the runner can execute untagged jobs.

### -Locked
Flag indicating the runner is locked to the current project.

### -AccessLevel
The access level of the runner; not_protected or ref_protected

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
[Update runner's details](https://docs.gitlab.com/ce/api/runners.html#update-runner-s-details)