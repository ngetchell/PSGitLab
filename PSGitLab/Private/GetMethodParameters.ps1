Function GetMethodParameters {
[cmdletbinding()]
param(
    $GetURLParameters
)

$string = '?'
foreach ($Param in $GetUrlParameters) {
    $Param.Keys | ForEach-Object {
        $key = $_
        $value = $Param[$_]
    }
    $string += "&$key=$value"
}
$string = $string -replace '\?&','?'
Write-Output $string
}
