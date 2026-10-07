# Task 1 - Current Module Baseline

- **Current Version:** 1.0.0
- **Author:** Gorkem Erdem
- **Description:** Test resource group creation
- **Exported Commands:**
  - New-TestResourceGroup

The module manifest was also updated so it correctly loads the root module and exports the public function.

# Task 2 - New Feature

I added Get-ResourceGroupSummary to display the resource group name, location, and tags. I tested the function and confirmed that it is exported by the module.

# Task 3 - Module Version

The module version was updated from 1.0.0 to 1.1.0. This is a minor update because it adds a new feature while keeping the existing function working the same way.