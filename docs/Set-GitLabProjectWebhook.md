---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: https://docs.gitlab.com/ce/api/projects.html#hooks
schema: 2.0.0
---

# Set-GitLabProjectWebhook

## SYNOPSIS
Set a setting on the Project webhook

## SYNTAX

```
Set-GitLabProjectWebhook [-Id <String>] [-Namespace <String>] -URL <String> -hook_id <String> [-push_events]
 [-issues_events] [-merge_requests_events] [-tag_push_events] [-note_events] [-pipeline_events] [-wiki_events]
 [-enable_ssl_verification] [-Token <String>] [<CommonParameters>]
```

## DESCRIPTION
Set a setting on the Project webhook

## EXAMPLES

### EXAMPLE 1
```
Set-GitLabProjectWebhook -Id 1 -URL http123 -hook_id 1
```

Set a URL on Project ID 1 webhook id 1

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

### -hook_id
Webhook hook_id.

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
Webhook Secure Token.

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

