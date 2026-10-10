## Task 1: Examine a DSC Configuration

- Configuration name: CompanyBaseline
- Node: localhost
- Resource 1: File AutomationFolder
  - Creates the C:\Automation directory and makes sure it is present.
- Resource 2: File ConfigFile
  - Creates C:\Automation\Config.txt with the text "NWTC Standard Configuration."
  - It depends on the AutomationFolder resource, so the folder is created first.

  ## Task 3: Generate and Review the MOF File

- File location: C:\powershell-advanced-gorkem\DSC\GorkemBaseline\localhost.mof
- File purpose: The MOF file contains the compiled DSC instructions that the Local Configuration Manager uses.
- Information observed: The file targets localhost and includes a WindowsFeature resource for Telnet-Client. The desired state is Absent, which means Telnet Client should not be installed.

## Task 4: Apply the Configuration

The GorkemBaseline configuration applied successfully. DSC checked the Telnet Client feature and found that it was already absent, so no changes were needed.