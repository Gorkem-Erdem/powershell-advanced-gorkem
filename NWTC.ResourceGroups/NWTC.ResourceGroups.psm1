$privateFunctions = Get-ChildItem `
    -Path "$PSScriptRoot\Private\*.ps1" `
    -ErrorAction SilentlyContinue

foreach ($function in $privateFunctions) {
    . $function.FullName
}

$publicFunctions = Get-ChildItem `
    -Path "$PSScriptRoot\Public\*.ps1" `
    -ErrorAction SilentlyContinue

foreach ($function in $publicFunctions) {
    . $function.FullName
}

Export-ModuleMember -Function $publicFunctions.BaseName