---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Get-GitLabRunner

## SYNOPSIS
Retrieve all runner in a GitLab instance.

## SYNTAX

### Single (Default)
```
Get-GitLabRunner -Id <Int32>
```

### Project (Default)
```
Get-GitLabRunner -ProjectId <Int32>
```

### Owned
```
Get-GitLabRunner -Owned [-State <String>]
```

### All
```
Get-GitLabProject -All [-State <String>]
```

## DESCRIPTION
Retrieve all runners in a GitLab instance.
Queries over HTTP and gets back GitLab.Project type.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitLabRunner -All
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-GitLabRunner -Owned
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-GitLabRunner -Id 4
```

## PARAMETERS

### -Id
The ID of the runner.

### -ProjectId
The ID of the project for which to list all runners.

### -Owned
Return all owned runners.

### -All
Return all available runners.

### -Scope
Limits the scope of runners to return.

## INPUTS

## OUTPUTS

### GitLab.Runner

## NOTES

## RELATED LINKS
[Get runner details](https://docs.gitlab.com/ce/api/runners.html#get-runner-s-details)
[List owned runners](https://docs.gitlab.com/ce/api/runners.html#list-owned-runners)
[List all runners](https://docs.gitlab.com/ce/api/runners.html#list-all-runners)