
# Public 

## Save-GitLabAPIConfiguration 

### Synopsis 

 Used to store information about your GitLab instance.
 

### Examples 

Example 1 

``` powershell 

 Save-GitLabAPIConfiguration -Domain http://gitlab.com -Token "Token" 

 ``` 

## Test-GitLabAPI 

### Synopsis 

 
Test-GitLabAPI 

 

### Examples 

## Get-GitLabAllProject 

### Synopsis 

 
Get-GitLabAllProject [-order_by] <string> [-sort] <string> [-search] <string> [-archived] [`<CommonParameters>`]

 

### Examples 

## Get-GitLabOwnedProject 

### Synopsis 

 
Get-GitLabOwnedProject [-order_by] <string> [-sort] <string>] [-search] <string> [-archived] [`<CommonParameters>`]

 

### Examples 

## Get-GitLabProject 

### Synopsis 

 
Get-GitLabProject [-order_by] <string> [-sort] <string> [-search] <string>] [-archived] [`<CommonParameters>`]

 

### Examples 

## Get-GitLabProjectEvent 

### Synopsis 

 
Get-GitLabProjectEvent [-Id <string>] [`<CommonParameters>`]

Get-GitLabProjectEvent [-Namespace <string>] [`<CommonParameters>`]

 

### Examples 

## Get-GitLabSingleProject 

### Synopsis 

 
Get-GitlabSingleProject [-Id <string>] [`<CommonParameters>`]

Get-GitlabSingleProject [-Namespace <string>] [`<CommonParameters>`]

 

### Examples 

## New-GitLabFork 

### Synopsis 

 
New-GitLabFork [-Id <string>] [`<CommonParameters>`]

New-GitLabFork [-Namespace <string>] [`<CommonParameters>`]

 

### Examples 

## New-GitLabProject 

### Synopsis 
 
New-GitLabProject [-Name] <string> [-Path] <string>] [-Namespace] <string>] [-Description] <string>] [-Issues_Enabled] [-Merge_Requests_Enabled] [-Builds_Enabled] [-Wiki_Enabled] [-Snippets_Enabled] [-public] [-Visibility_Level][`<CommonParameters>`]

#### Parameter Definitions:  
name (required) - new project name  
path (optional) - custom repository name for new project. By default generated based on name  
namespace (optional) - namespace for the new project (defaults to user); if specified, must return a unique value from the search, or the script will throw an error.  
description (optional) - short project description  
issues_enabled (optional) - if true option is disabled  
merge_requests_enabled (optional) - if true option is disabled  
builds_enabled (optional) - if true option is disabled  
wiki_enabled (optional) - if true option is disabled  
snippets_enabled (optional) - if true option is disabled  
container_registry_enabled (optional) - if true option is disabled  
public (optional) - if true same as setting visibility_level = 20  
visibility_level (optional) - takes 3 values; 'Private', 'Internal', or 'Public'  
 
### Examples 
``` powershell
 New-GitLabProject -Name Hadouken -Path 'Hadouken-123' -Namespace SF2 -Description 'Repo for specials' -Builds_Enabled -Visibility_Level 'Internal'
``` 
This creates a new project named Hadouken with a path of http://gitlab.com/SF2/Hadouken-123.git. The project will be for internal use only with builds disabled.


## Remove-GitLabProject 

### Synopsis 

 Remove-GitLabProject [-Id] <string> [-WhatIf] [-Confirm] [`<CommonParameters>`]

### Examples 



## Search-GitLabProject 

### Synopsis 
 
Search-GitLabNamespace [-NameSpace] <string> [`<CommonParameters>`]

### Examples 
``` powershell
 Search-GitLabNamespace -Namespace SMB
``` 
This gets all of the Namespaces (users or groups) that have 'SMB' in their name in the format seen below:

id  | path | kind  
--- | ---- | ----  
3   | SMB  | group  


## Search-GitLabUser

### Synopsis

Search-GitLabUser [-User] <string> [`<CommonParameters>`]

### Examples
``` powershell
 Search-GitLabUser -User Mario
``` 
This gets all of the users that have 'Mario' in their name in the format seen below:  

name               : Mario Brothers  
username           : mbrothers  
id                 : 3  
state              : active  
avatar_url         : http://gitlab.com/uploads/user/avatar/3/avatar.png  
web_url            : http://gitlab.com/u/mbrothers  
created_at         : 2016-05-24T23:58:56.895Z  
is_admin           : True  
bio                :  
location           :  
skype              :  
linkedin           :  
twitter            :  
website_url        :  
last_sign_in_at    : 2016-06-29T04:19:00.039Z  
confirmed_at       : 2016-05-24T23:58:56.716Z  
email              : mbrothers@smb.com  
theme_id           : 2  
color_scheme_id    : 1  
projects_limit     : 10  
current_sign_in_at : 2016-06-29T04:50:02.851Z  
identities         : {}  
can_create_group   : True  
can_create_project : True  
two_factor_enabled : False  
external           : False  