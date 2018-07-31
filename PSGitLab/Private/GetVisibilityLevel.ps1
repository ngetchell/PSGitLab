function GetVisibilityLevel {
    param(
        [ValidateSet("Public", "Internal", "Private")]
        $String
    )

    switch ($String)
    {
        'Public' { 20; break; }
        'Internal' { 10; break; }
        'Private' { 0; break; }
    }

}
