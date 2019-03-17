An interface for administering GitLab from a Windows PC using PowerShell.

[![Build status](https://ci.appveyor.com/api/projects/status/t7wyv5xim2olu0r7/branch/master?svg=true)](https://ci.appveyor.com/project/ngetchell/psgitlab/branch/master)

## Installation
```PowerShell
Find-Module -Name PSGitLab | Install-Module
```

## Getting started
Before you start to use PSGitLab you need to
- obtain your your [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
- save your personal access token and the GitLab URL using Save-GitLabAPIConfiguration

```PowerShell
Save-GitLabAPIConfiguration -Domain https://my-gitlab.example.com -Token "mPnTssWyBCMjxxxxxxxJQ"
```

Your configuration data are saved to the file "$env:appdata\PSGitLab\PSGitLabConfiguration.xml".

## API Requests
If you think there is an [GitLab API](https://docs.gitlab.com/ce/api/README.html) I missed make sure to request it as an issue.
I added the API calls that I needed to get work done.
You might need others.
Let me know.

## Contributing
Before issuing a Pull Request make sure to run the following code to make sure your not additions don't get kicked back.

``` PowerShell
.\build.ps1 -Task Pre-Commit
```

This will run your code against the PSScriptAnalyzer and Pester tests.
If you're writing code against a specific function you can use Pester tags to check against just that one function.

``` PowerShell
Invoke-Pester -Tag get-gitlabproject
```

### Milestones
Milestones will be used for code coverage. Each API call has it's own issue and each group of API calls will be categorized by the corresponding milestone.

### Issues
If you find a bug, please let me know through the issue tracker. The more details you provide the better.

### Contributors
- [Nicholas M. Getchell](https://github.com/ngetchell) - [@getch3028](https://twitter.com/getch3028)
- [Leonhard Schick](https://github.com/lw-schick)
- [Brooks Collins](https://github.com/TerrapinStation)
- [Matthew Hilton](https://github.com/matt2005)
- [Wojciech Sciesinski](https://github.com/it-praktyk) - [ITpraktyk](https://twitter.com/ITpraktyk)
- [Robin Malik](https://github.com/robinmalik) - [@robinmalik](https://twitter.com/robinmalik)
