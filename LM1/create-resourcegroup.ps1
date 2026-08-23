<#
.SYNOPSIS
Creates a new Azure resource group.

.DESCRIPTION
Creates an Azure resource group in the Central US region.

.PARAMETER ResourceGroupName
Specifies the name of the resource group.

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "PA-Gorkem"
#>

param (
    [Parameter(Mandatory)]
    [ValidateLength(3, 10)]
    [string]$ResourceGroupName
)
# Store the transcript in the same folder as the script
$TranscriptPath = "$PSScriptRoot\resourcegroup-transcript.txt"
Start-Transcript -Path $TranscriptPath -Append
try {
    #Create the Azurere resource group
    New-AzResourceGroup `
        -Name $ResourceGroupName `
        -Location "centralus" `
        -ErrorAction Stop

    Write-Host "Resource group created successfully."
}
catch {
    Write-Host "The resource group could not be created."
    Write-Host $_.Exception.Message
}
finally {
    Write-Host "Script execution finished."

    Stop-Transcript

}