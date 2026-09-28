## PowerShell Advanced Project

This repository contains my PowerShell lab work. It includes an advanced function that creates Azure resource groups using validation, tags, pipeline input, structured output, error handling, logging, and WhatIf support.

## Learning Module 4: Enterprise-Ready Functions

In LM4, I improved the New-TestResourceGroup function for larger automation projects.

### Improvements

- Added multiple parameter sets
- Added pipeline support
- Added Begin, Process, and End blocks
- Added verbose feedback
- Added bulk processing from a text file
- Added processing counters and a final summary
- Updated the function documentation and examples

## Learning Module 5: PowerShell Modules

In LM5, I converted the New-TestResourceGroup function into a reusable PowerShell module.

### Improvements

- Created the NWTC.ResourceGroups module
- Added a module manifest with version 1.0.0
- Separated public and private functions
- Added a private logging function
- Exported only New-TestResourceGroup
- Tested names, Project IDs, pipeline input, and multiple values
- Added module documentation and usage examples

The completed module is located in the `NWTC.ResourceGroups` folder.
