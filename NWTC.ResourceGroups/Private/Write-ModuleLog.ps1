function Write-ModuleLog {
    <#
.SYNOPSIS
Writes timestamped messages to a module log file.

.DESCRIPTION
This private helper function records INFO, WARN, and ERROR messages for the NWTC.ResourceGroups module.

.PARAMETER Message
Specifies the message written to the log.

.PARAMETER Level
Specifies the message level: INFO, WARN, or ERROR.

.PARAMETER LogFile
Specifies the full path of the log file.

.EXAMPLE
Write-ModuleLog `
    -Message "Starting resource group creation." `
    -Level INFO `
    -LogFile $LogFilePath
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter()]
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO",

        [Parameter(Mandatory)]
        [string]$LogFile
    )

    $LogDirectory = Split-Path -Path $LogFile -Parent

    if (-not (Test-Path $LogDirectory)) {
        New-Item `
            -ItemType Directory `
            -Path $LogDirectory `
            -Force | Out-Null
    }

    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Timestamp [$Level] $Message" |
        Out-File -FilePath $LogFile -Append -Encoding utf8
}