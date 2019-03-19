---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabProjectArchive

## SYNOPSIS
Download the archive of a project

## SYNTAX

```
Get-GitLabProjectArchive [-ProjectID] <Int32> [[-CommitID] <String>] [[-OutFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
Download the archive of a project

## EXAMPLES

### EXAMPLE 1
```
Get-GitLabProjectZipArchive -ProjectID 1 -OutFile C:\test.zip
```

Get Zip archive for project 1 and save to test.zip

## PARAMETERS

### -ProjectID
ProjectID.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CommitID
CommitID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
Outputfile path and name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: "$PWD\test.zip"
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
