Function GetGitLabStatusCode {
    param(
        [Parameter(Mandatory=$true)]
        [int]$StatusCode
    )

    switch ($StatusCode) {
        '200' { $Text = 'OK - The GET, PUT or DELETE request was successful, the resource(s) itself is returned as JSON' }
        '201' { $Text = 'Created - The POST request was successful and the resource is returned as JSON' }
        '400' { $Text = 'Bad Request - A required attribute of the API request is missing, e.g. the title of an issue is not given' }
        '401' { $Text = 'Unauthorized - The user is not authenticated, a valid user token is necessary, see above' }
        '403' { $Text = 'Forbidden - The request is not allowed, e.g. the user is not allowed to delete a project' }
        '404' { $Text = 'Not Found - A resource could not be accessed, e.g. an ID for a resource could not be found' }
        '405' { $Text = 'Method Not Allowed - The request is not supported' }
        '409' { $Text = 'Conflict - A conflicting resource already exists, e.g. creating a project with a name that already exists' }
        '422' { $Text = 'Unprocessable - The entity could not be processed' }
        '500' { $Text = 'Server Error - While handling the request something went wrong on the server side' }
    }

    $Return = [pscustomobject]@{
        StatusCode = $StatusCode;
        StatusText = $Text;
    }
    $Return.pstypenames.insert(0,'PSGitLab.Configuration.StatusCode')
    Write-Output $Return
}
