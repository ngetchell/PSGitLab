---
external help file: PSGitLab-help.xml
online version: https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings
schema: 2.0.0
---

# Set-GitLabProjectServiceSlack

## SYNOPSIS
Set the Slack Webhook

## SYNTAX

```
Set-GitLabProjectServiceSlack [-Id <String>] [-Namespace <String>] -webhook <String>
```

## DESCRIPTION
Enables Slack notification from gitlab

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-GitLabProjectServiceSlack -Webhook https://hooks.slack.com/asfdss -Id 1
```

Sets the webhook on project id 1

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

### -webhook
Slack webhook.

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

### GitLab.Project.Service.Slack

## NOTES

## RELATED LINKS

[https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings](https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings)

