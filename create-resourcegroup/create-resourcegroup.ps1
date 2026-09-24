function New-TestResourceGroup {

<#
.SYNOPSIS
Creates one or more Azure resource groups.

.DESCRIPTION
Creates Azure resource groups in the Central US region. The function supports custom resource group names, Project IDs, pipeline input, tags, verbose feedback, WhatIf, and Confirm.

.PARAMETER ResourceGroupName
Specifies a custom resource group name.

.PARAMETER ProjectID
Specifies a numeric project ID. The function automatically creates a name such as RG-1001.

.PARAMETER Tags
Specifies tags to apply to the resource group.

.EXAMPLE
New-TestResourceGroup -ResourceGroupName "Dev1"

.EXAMPLE
New-TestResourceGroup -ProjectID "1001" -Verbose

.EXAMPLE
"1001", "1002", "1003" | New-TestResourceGroup
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
    $ProjectRoot = Split-Path -Parent $PSScriptRoot
    $TranscriptPath = Join-Path $ProjectRoot "output\resourcegroup-transcript.txt"
    Start-Transcript -Path $TranscriptPath -Append

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

            $result.Status = "Created"
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
        Write-Host "The resource group could not be created."
        Write-Host $_.Exception.Message
        $result.Status = "Error"
    }
    finally {
        Write-Verbose "Finished processing $ResourceGroupName."
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
    Stop-Transcript
}
}
