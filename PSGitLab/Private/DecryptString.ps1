# https://blogs.msdn.microsoft.com/besidethepoint/2010/09/21/decrypt-secure-strings-in-powershell/
function DecryptString {
param(
    [Parameter(ValueFromPipeline=$true,Mandatory=$true,Position=0)]
    [System.Security.SecureString]
    $Token
)

$marshal = [System.Runtime.InteropServices.Marshal]
$ptr = $marshal::SecureStringToBSTR( $token )
$key = $marshal::PtrToStringBSTR( $ptr )
$marshal::ZeroFreeBSTR( $ptr )
$key
Remove-Variable key
}
