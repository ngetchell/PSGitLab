---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# New-GitLabRunner

## SYNOPSIS
Creates a new GitLab runner.

## SYNTAX

```
New-GitLabRunner -Token <string> -Description <string> -Tags <string> [-RunUntagged <bool>] [-Locked <bool>] [-Platform <string>] [-Architecture <string>] [-Executor <string>] [-Artifacts <bool>] [-Cache <bool>] [-Image <bool>] [-Services <bool>] [-Shared <bool>] [-Variables <bool>] -Name <string> -Revision <string> -Version <string>
```

## DESCRIPTION
Creates a new GitLab runner.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
New-GitLabRunner -Token T0k3n -Name "Quamotion" -Description "Quamotion" -Tags "quamotion" -Platform linux -Architecture amd64 -Executor shell -Revision c1ecf97f -Version "10.1.0"
```

## PARAMETERS

### -token
The runner registration token.

### -name
The name for the runner.

### -description
A description of the runner.

### -tags
A comma-delimited list of tags to assign to the runner.

### -platform
The platform which hosts this runner, such as Windows or Linux.

### -architecture
The CPU architecture of the platform which hosts this runner, such as AMD64.

### -executor
The executor which this runner uses.

### -artifacts
Whether this runner supports artifacts.

### -cache
Whether this runner supports caching.

### -image
Whether this runner support images.

### -shared
Whether this runner is shared.

### -variables
Whether this runner supports variables.

### -revision
The revision of the runner software.

### -version
The version of the runner software.

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

