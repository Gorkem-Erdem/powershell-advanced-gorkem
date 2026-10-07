# NWTC.ResourceGroups

## Purpose

NWTC.ResourceGroups is a PowerShell module used to create and review Azure resource groups.

## Features

- Creates resource groups using a custom name
- Creates names from numeric Project IDs
- Accepts pipeline input and multiple values
- Supports custom tags
- Supports WhatIf and Confirm
- Returns PowerShell objects
- Creates timestamped log files
- Keeps helper functions private
- Displays resource group names, locations, and tags

## Installation

Download or clone the repository, then import the module manifest:

```powershell
Import-Module .\NWTC.ResourceGroups\NWTC.ResourceGroups.psd1 -Force
```

## Usage Examples

Create a resource group with a custom name:

```powershell
New-TestResourceGroup -ResourceGroupName "Dev1"
```

Create one using a Project ID:

```powershell
New-TestResourceGroup -ProjectID "1001"
```

Process multiple Project IDs through the pipeline:

```powershell
"1001", "1002", "1003" | New-TestResourceGroup
```

Preview a change:

```powershell
New-TestResourceGroup -ResourceGroupName "Dev1" -WhatIf
```
View a summary of existing resource groups:

```powershell
Get-ResourceGroupSummary
```

## Documentation

- [Changelog](CHANGELOG.md)
- [Release Notes](RELEASENOTES.md)

## Version

Current version: **1.1.0**