
# Task 1:

The first issue is the variable name "$a". It does not clearly explain what information the variable stores. In an enterprise environment, unclear variable names make scripts harder for other administrators to understand and maintain.

The second issue is the use of "Read-Host". This requires someone to manually enter the resource group name every time the script runs. That makes the script difficult to reuse in automated processes.

The third issue is that the script does not validate the resource group name. Incorrect or empty information could be passed to Azure and cause the command to fail.

# Task 2:

The script creates a new Azure resource group in Central US. The documented parameter is "ResourceGroupName", which stores the resource group name entered by the user. A sample execution is ".\create-resourcegroup.ps1".

# Task 3: 

I used "ValidateLength" to require the resource group name to be between 3 and 10 characters. "Test1" was accepted as valid input, while "T1" was rejected. The validation stopped the incorrect value before Azure processed it.

# Task 4:

I generated an error by using an invalid Azure location. The Catch block displayed the error instead of letting the script stop without an explanation. The Finally block ran after the error and confirmed that the script finished.
Error Message I received:
"The specified location 'Invalid-Location' is invalid. A location must consist of characters, whitespace, digit, or following symbols '(,)'.
StatusCode: 400
ReasonPhrase: Bad Request
OperationID : 2d949e9d-708e-4cc9-b4ca-14832d7aa0bd"

# Task 5:

The transcript was saved as "LM1\resourcegroup-transcript.txt". One entry showed that the resource group was created successfully. I improved readability by using clear variable names and organizing the code with indentation and comments.