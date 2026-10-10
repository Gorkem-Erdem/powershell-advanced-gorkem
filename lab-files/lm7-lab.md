## Task 1: Examine a DSC Configuration

- Configuration name: CompanyBaseline
- Node: localhost
- Resource 1: File AutomationFolder
  - Creates the C:\Automation directory and makes sure it is present.
- Resource 2: File ConfigFile
  - Creates C:\Automation\Config.txt with the text "NWTC Standard Configuration."
  - It depends on the AutomationFolder resource, so the folder is created first.