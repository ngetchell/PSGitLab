---
external help file: PSGitLab-help.xml
online version: https://docs.gitlab.com/ce/api/projects.html#hooks
schema: 2.0.0
---

# Remove-GitLabProjectWebhook

## SYNOPSIS
Remove a webhook assigned to a project

## SYNTAX

```
Remove-GitLabProjectWebhook [-Id <String>] [-Namespace <String>] -hook_id <String>
```

## DESCRIPTION
Remove a webhook assigned to a project

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-GitLabProjectWebhooks -Id 1 -hook_id 1
```

Remove webhook ID 1 for project id 1

### -------------------------- EXAMPLE 2 --------------------------
```
Remove-GitLabProjectWebhooks -Namespace Test -hook_id 1
```

Remove webhook ID 1 for namespace Test

## PARAMETERS

### -Id
Project Id.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Namespace
Project Namespace.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -hook_id
Webhook ID

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

## INPUTS

## OUTPUTS

### GitLab.Project.Webhook

## NOTES

## RELATED LINKS

[https://docs.gitlab.com/ce/api/projects.html#hooks](https://docs.gitlab.com/ce/api/projects.html#hooks)

