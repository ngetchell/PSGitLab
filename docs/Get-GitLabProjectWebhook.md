---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: https://docs.gitlab.com/ce/api/projects.html#hooks
schema: 2.0.0
---

# Get-GitLabProjectWebhook

## SYNOPSIS
Get the webhooks assigned to a project

## SYNTAX

```
Get-GitLabProjectWebhook [-Id <String>] [-Namespace <String>] [<CommonParameters>]
```

## DESCRIPTION
Get the web hooks assigned to aproject

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabProjectWebhook -Id 1
```

Get all thw webhooks for project id 1

### EXAMPLE 2
```
Get-GitLabProjectWebhook -Namespace Test
```

Get all thw webhooks for namespace Test

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### GitLab.Project.Webhook

## NOTES

## RELATED LINKS

[https://docs.gitlab.com/ce/api/projects.html#hooks](https://docs.gitlab.com/ce/api/projects.html#hooks)

