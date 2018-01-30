---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Add-GitLabProjectRunner

## SYNOPSIS
Enable an available specific runner in the project.

## SYNTAX

```
Add-GitLabProjectRunner -RunnerId <int> -ProjectId <int>
```

## DESCRIPTION
Enable an available specific runner in the project.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Add-GitLabProjectRunner -RunnerId 400 -ProjectId 500
```

## PARAMETERS

### -RunnerId
The ID of the GitLab runner to enable on the project.

### -ProjectId
The ID of the project on which to enable the runner.

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
[Enable a runner in a project](https://docs.gitlab.com/ce/api/runners.html#enable-a-runner-in-project)