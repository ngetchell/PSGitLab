---
external help file: PSGitLab-help.xml
online version: https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings
schema: 2.0.0
---

# Remove-GitLabProjectServiceSlack

## SYNOPSIS
Remove Slack Webhook

## SYNTAX

```
Remove-GitLabProjectServiceSlack [-Id <String>] [-Namespace <String>]
```

## DESCRIPTION
Disables Slack notification from gitlab

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-GitLabProjectServiceSlack -Id 1
```

Disables Slack Notification on project id 1

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

## INPUTS

## OUTPUTS

### GitLab.Project.Service.Slack

## NOTES

## RELATED LINKS

[https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings](https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings)

