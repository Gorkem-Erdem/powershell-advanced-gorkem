Describe "Create Resource Group Script" {
    It "Creates the expected Azure resource group" {
        $ResourceGroupName = "PA-Pester"

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "create-resourcegroup.ps1"

. $ScriptPath

        New-TestResourceGroup `
         -ResourceGroupName $ResourceGroupName

        $Result = Get-AzResourceGroup `
            -Name $ResourceGroupName `
            -ErrorAction Stop

        $Result.ResourceGroupName |
            Should -Be $ResourceGroupName
  
     }

     It "Creates a resource group using a Project ID" {
    $ProjectID = "4001"
    $ExpectedName = "RG-$ProjectID"

    $ScriptPath = Join-Path `
        $PSScriptRoot `
        "create-resourcegroup.ps1"

    . $ScriptPath

    New-TestResourceGroup -ProjectID $ProjectID

    $Result = Get-AzResourceGroup `
        -Name $ExpectedName `
        -ErrorAction Stop

    $Result.ResourceGroupName |
        Should -Be $ExpectedName
    }
}