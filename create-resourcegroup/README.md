# New-TestResourceGroup

New-TestResourceGroup is an advanced PowerShell function that creates Azure resource groups in the Central US region.

## Features

- Supports custom resource group names
- Supports numeric Project IDs
- Accepts Project IDs through the pipeline
- Automatically creates names such as RG-1001
- Supports custom tags
- Supports WhatIf and Confirm
- Provides verbose and debug messages
- Returns PowerShell objects
- Displays a processing summary

## Examples

Create a resource group using a custom name:

New-TestResourceGroup -ResourceGroupName "Dev1"

Create one using a Project ID:
New-TestResourceGroup -ProjectID "1001"

Process multiple Project IDs:
"1001", "1002", "1003" | New-TestResourceGroup -Verbose

Process IDs from a file:
Get-Content .\ResourceGroups.txt | New-TestResourceGroup -Verbose