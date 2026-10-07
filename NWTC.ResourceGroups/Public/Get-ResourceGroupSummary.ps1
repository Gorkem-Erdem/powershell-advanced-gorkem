function Get-ResourceGroupSummary {
    [CmdletBinding()]
    param()

    try {
        $ResourceGroups = Get-AzResourceGroup -ErrorAction Stop

        foreach ($ResourceGroup in $ResourceGroups) {
            [PSCustomObject]@{
                ResourceGroupName = $ResourceGroup.ResourceGroupName
                Location          = $ResourceGroup.Location
                Tags              = $ResourceGroup.Tags
            }
        }
    }
    catch {
        Write-Error "Could not retrieve resource groups: $($_.Exception.Message)"
    }
}