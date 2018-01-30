---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Remove-GitLabProjectRunner

## SYNOPSIS
Disable a specific runner from the project. 

## SYNTAX

```
Remove-GitLabProjectRunner -RunnerId <int> -ProjectId <int>
```

## DESCRIPTION
Disable a specific runner from the project.
Works only if the project isn't the only project associated with the specified runner.
If so, an error is returned. Use the Remove-GitLabRunner instead.


## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-GitLabProjectRunner -RunnerId 400 -ProjectId 500
```

## PARAMETERS

### -RunnerId
The ID of the GitLab runner to disable on the project.

### -ProjectId
The ID of the project on which to disable the runner.

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
[Disable a runner in a project](https://docs.gitlab.com/ce/api/runners.html#disable-a-runner-from-project)