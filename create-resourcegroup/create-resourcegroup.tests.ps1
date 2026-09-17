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
}