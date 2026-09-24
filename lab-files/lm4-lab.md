# Task 1: Function Evaluation

### Strengths

1. The function validates the resource group name before running.
2. It uses error handling and creates a transcript for troubleshooting.
3. It supports tags, pipeline input, WhatIf, and structured output.

### Areas for Improvement

1. It only allows one method for naming resource groups.
2. It needs better support for processing multiple resource groups.
3. It does not provide a final summary showing successes, skips, and errors.


# Task 2: Parameter Sets

I added two parameter sets named ResourcegroupName and ProjectID, ResourceGroupName allows a custom name, while ProjectID automatically creates a name like RG-1001. This gives administrators more than one way to use the function.

# Task 3: Begin, Process, and End

I added Begin, Process, and End blocks to the function. Begin runs once to start the transcript and initialize the function. Process runs once for each pipeline value and creates the resource groups. End runs once after all items are processed and stops the transcript.

Pipeline test:

"1001", "1002", "1003" | New-TestResourceGroup -Verbose

# Task 4: Verbose Feedback

I added verbose messages to show when the function starts, when validation succeeds, when resource group creation begins, and when processing finishes. This gives administrators more information when troubleshooting without displaying extra messages during normal use.

Test command:

New-TestResourceGroup -ResourceGroupName "Verbose1" -Verbose

# Task 5: Bulk Processing

I created a ResourceGroups.txt file containing three Project IDs. I used Get-Content to send each ID through the pipeline to New-TestResourceGroup.

Test command:

Get-Content .\ResourceGroups.txt | New-TestResourceGroup -Verbose

Results:

- Items processed: 3
- Resource groups created: 3
- Errors or warnings: 0