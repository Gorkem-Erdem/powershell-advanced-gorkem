# Task 1: Module Structure

Created the NWTC.ResourceGroups module folder with Public, Private, Tests, Logs, and Docs folders. I also copied the existing New-TestResourceGroup function into the Public folder.

# Task 2: Script Module

Updated NWTC.ResourceGroups.psm1 to find and load all PowerShell files from the Public folder. I imported the module successfully using Import-Module.

# Task 3: Module Manifest

Created NWTC.ResourceGroups.psd1 with version 1.0.0, author information, and a description of the module.

# Task 4: Export Module Members

Added Export-ModuleMember to export only the functions stored in the Public folder. I reimported the module and verified that New-TestResourceGroup appeared with Get-Command.

# Task 5: Private Helper Function

Created the private Write-ModuleLog function and updated the module to load private functions without exporting them. I replaced transcript logging with timestamped log messages and verified that the helper created a log file successfully.

# Task 6: Module Testing

I tested the module using ResourceGroupName, ProjectID, pipeline input, and multiple values. The module created the expected Azure resource groups and saved timestamped messages in the Logs folder.