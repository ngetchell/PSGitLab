# Functions 

## Save-GitLabAPIConfiguration 

### Synopsis 

 Used to store information about your GitLab instance.
 

### Examples 

Example 1 

``` powershell 

 Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "Token" 

 ``` 

__ 

## Test-GitLabAPI 

### Synopsis 

 
Test-GitLabAPI 

 

### Examples 

## Get-GitLabAllProject 

### Synopsis 

 
Get-GitLabAllProject [[-order_by] <string>] [[-sort] <string>] [[-search] <string>] [-archived] [<CommonParameters>]

 

### Examples 

## Get-GitLabOwnedProject 

### Synopsis 

 
Get-GitLabOwnedProject [[-order_by] <string>] [[-sort] <string>] [[-search] <string>] [-archived] [<CommonParameters>]

 

### Examples 

## Get-GitLabProject 

### Synopsis 

 
Get-GitLabProject [[-order_by] <string>] [[-sort] <string>] [[-search] <string>] [-archived] [<CommonParameters>]

 

### Examples 

## Get-GitLabProjectEvent 

### Synopsis 

 
Get-GitLabProjectEvent [-Id <string>] [<CommonParameters>]

Get-GitLabProjectEvent [-Namespace <string>] [<CommonParameters>]

 

### Examples 

## Get-GitLabSingleProject 

### Synopsis 

 
Get-GitlabSingleProject [-Id <string>] [<CommonParameters>]

Get-GitlabSingleProject [-Namespace <string>] [<CommonParameters>]

 

### Examples 

## New-GitLabFork 

### Synopsis 

 
New-GitLabFork [-Id <string>] [<CommonParameters>]

New-GitLabFork [-Namespace <string>] [<CommonParameters>]

 

### Examples 

## New-GitLabProject 

### Synopsis 

 
New-GitLabProject [-Name] <string> [[-Path] <string>] [[-Namespace_ID] <string>] [[-Description] <string>] [-Issues_Enabled] [-Merge_Requests_Enabled] [-Wiki_Enabled] [-Snippets_Enabled] [-public] [<CommonParameters>]

 

### Examples 

## Remove-GitLabProject 

### Synopsis 

 
Remove-GitLabProject [-Id] <string> [-WhatIf] [-Confirm] [<CommonParameters>]

 

### Examples 

 _Auto Generated on 01/25/2016 22:01:33 by ngetchell_ 


