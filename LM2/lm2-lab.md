

# Task 1:

- Original command: `Get-Process -Name explore`
- Error: No process named `explore` was found.
- Cause: The process name was typed incorrectly.
- Corrected command: `Get-Process -Name explorer`

# Task 2:

- Verbose example:`VERBOSE: Step 2: Creating the resource group.`
- Debug example `DEBUG: Location: centralus`
- Difference: Verbose showed the progress of the script. Debug showed more specific values and paused the script so I could review them.

## Task 3:

- Test name: Creates the expected Azure resource group
- Expected result: The resource group should be created in Azure.
- Actual result:The test passed and confirmed that the resource group existed.