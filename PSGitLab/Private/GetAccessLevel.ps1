Function GetAccessLevel {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Guest', 'Reporter', 'Developer', 'Master', 'Owner')]
        $Level,

        [ValidateSet('Project', 'Group')]
        $Type = 'Project'
    )

    switch ($Level) {
        Guest { return 10; break; }
        Reporter { return 20; break; }
        Developer { return 30; break; }
        Master { return 40; break; }
        Owner { 
            if ( $Type -eq 'Group' ) {
                return 50; break;
            }
            else {
                Write-Error 'Projects do not have owner permission set. See https://docs.gitlab.com/ce/api/members.html' 
            }
        }
    }
}