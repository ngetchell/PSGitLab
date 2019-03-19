---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: https://docs.gitlab.com/ce/api/projects.html#hooks
schema: 2.0.0
---

# New-GitLabProjectWebhook

## SYNOPSIS
Add a New webhook for a Project

## SYNTAX

```
New-GitLabProjectWebhook [-Id <String>] [-Namespace <String>] -URL <String> [-push_events] [-issues_events]
 [-merge_requests_events] [-tag_push_events] [-note_events] [-pipeline_events] [-wiki_events]
 [-enable_ssl_verification] [-Token <String>] [<CommonParameters>]
```

## DESCRIPTION
Add a new webhook for a project

## EXAMPLES

### EXAMPLE 1
```
New-GitLabProjectWebhook -Id 1 -URL 'https:\webhook'
```

Setup a webhook on project id 1

### EXAMPLE 2
```
New-GitLabProjectWebhook -Namespace Value -URL 'https:\webhook'
```

Setup and Webhook on namespace Value

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

### -URL
Webhook URL.

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

### -push_events
Send on push_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -issues_events
Send on issues_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -merge_requests_events
Send on merge_requests_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -tag_push_events
Send on tag_push_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -note_events
Send on note_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -pipeline_events
Send on pipeline_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -wiki_events
Send on wiki_events.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -enable_ssl_verification
enable_ssl_verification.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Security Token fro webhook

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
Place additional notes here.

## RELATED LINKS

[https://docs.gitlab.com/ce/api/projects.html#hooks](https://docs.gitlab.com/ce/api/projects.html#hooks)

