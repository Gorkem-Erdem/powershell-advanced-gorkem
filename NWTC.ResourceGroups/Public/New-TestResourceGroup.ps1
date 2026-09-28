function New-TestResourceGroup {

<#
.SYNOPSIS
Creates a new Azure resource group.

.DESCRIPTION
Creates an Azure resource group in Central US using either a custom name or a numeric Project ID. The function supports pipeline input, tags, WhatIf, Confirm, and timestamped logging.

.PARAMETER ResourceGroupName
Specifies a custom resource group name.

.PARAMETER ProjectID
Specifies a numeric Project ID. The function creates a name such as RG-1001.

.PARAMETER Tags
Specifies the tags assigned to the resource group.

.EXAMPLE
New-TestResourceGroup -ResourceGroupName "Dev1"

.EXAMPLE
New-TestResourceGroup -ProjectID "1001"

.EXAMPLE
"1001", "1002" | New-TestResourceGroup
#>

#Allows the script to run verbose and debug
[CmdletBinding(
    DefaultParameterSetName = "ResourceGroupName",
    SupportsShouldProcess = $true
)]
param (
    [Parameter(
        Mandatory,
        ParameterSetName = "ResourceGroupName"
    )]
    [ValidateLength(3, 10)]
    [string]$ResourceGroupName,

    [Parameter(
        Mandatory,
        ParameterSetName = "ProjectID",
        ValueFromPipeline
    )]
    [ValidatePattern("^\d+$")]
    [string]$ProjectID,

    [Parameter()]
    [hashtable]$Tags = @{
        Department  = "IT"
        Environment = "Test"
    }
)
begin {
    $TotalCount = 0
    $CreatedCount = 0
    $SkippedCount = 0
    $ErrorCount = 0
    $ModuleRoot = Split-Path -Parent $PSScriptRoot

$LogFilePath = Join-Path `
    $ModuleRoot `
    "Logs\New-TestResourceGroup-Log-$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"

Write-ModuleLog `
    -Message "Starting the resource group creation process." `
    -Level INFO `
    -LogFile $LogFilePath
    Write-Verbose "Starting the resource group creation process."
}

process {
    $TotalCount++
    if ($PSCmdlet.ParameterSetName -eq "ProjectID") {
        $ResourceGroupName = "RG-$ProjectID"
        Write-Verbose "Validation completed successfully for $ResourceGroupName."
    }

    $result = [PSCustomObject]@{
        ResourceGroupName = $ResourceGroupName
        Location          = "centralus"
        Status            = "Not Created"
        Tags              = $Tags
        Timestamp         = Get-Date
    }

    Write-Debug "Resource group name: $ResourceGroupName"

    try {
        if ($PSCmdlet.ShouldProcess(
            "Resource Group '$ResourceGroupName'",
            "Create"
        )) {
            Write-Verbose "Creating resource group $ResourceGroupName."

            New-AzResourceGroup `
                -Name $ResourceGroupName `
                -Location "centralus" `
                -Tags $Tags `
                -ErrorAction Stop

            Write-ModuleLog `
    -Message "Created resource group '$ResourceGroupName' in centralus." `
    -Level INFO `
    -LogFile $LogFilePath

            $CreatedCount++
            Write-Host "Resource group created successfully."
        }
         else {
        $SkippedCount++
        Write-Verbose "Skipped $ResourceGroupName."
         }
    }
   catch {
    $ErrorCount++

    Write-ModuleLog `
        -Message $_.Exception.Message `
        -Level ERROR `
        -LogFile $LogFilePath

    Write-Host "The resource group could not be created."
    Write-Host $_.Exception.Message
    $result.Status = "Error"
}
   finally {
    Write-ModuleLog `
        -Message "Finished processing the resource group." `
        -Level INFO `
        -LogFile $LogFilePath

    Write-Host "Script execution finished."
}

    $result
}

end {
    Write-Host "`nProcessing Summary"
    Write-Host "Total processed: $TotalCount"
    Write-Host "Created: $CreatedCount"
    Write-Host "Skipped: $SkippedCount"
    Write-Host "Errors: $ErrorCount"

    Write-Verbose "Resource group processing completed."
    
}
}
