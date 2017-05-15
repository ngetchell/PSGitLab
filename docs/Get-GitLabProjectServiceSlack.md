---
external help file: PSGitLab-help.xml
online version: https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings
schema: 2.0.0
---

# Get-GitLabProjectServiceSlack

## SYNOPSIS
Get the Slack Webhook

## SYNTAX

```
Get-GitLabProjectServiceSlack [-Id <String>] [-Namespace <String>]
```

## DESCRIPTION
Gets Slack notification settings from gitlab

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitLabProjectServiceSlack -Webhook https://hooks.slack.com/asfdss -Id 1
```

Gets the Slack Settings on project id 1

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

