# NWTC.ResourceGroups Version 1.1.0 Release Notes

## New Features

- Added Get-ResourceGroupSummary.
- The new function displays resource group names, locations, and tags.

## Bug Fixes

- Updated the module manifest to correctly load the root module.
- Updated the list of exported public functions.

## Upgrade Instructions

1. Download or pull the latest repository changes.
2. Replace the older NWTC.ResourceGroups module folder.
3. Remove and reimport the module.
4. Use Get-Module to confirm version 1.1.0 is loaded.

## Known Issues

- The Az.Resources module is required.
- The user must be connected to an Azure account.
- Resource groups without tags will display an empty Tags value.