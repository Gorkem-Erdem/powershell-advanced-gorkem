Describe "Create Resource Group Script" {
    It "Creates the expected Azure resource group" {
        $ResourceGroupName = "PA-Pester"

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\LM1\create-resourcegroup.ps1"

        & $ScriptPath -ResourceGroupName $ResourceGroupName

        $Result = Get-AzResourceGroup `
            -Name $ResourceGroupName `
            -ErrorAction Stop

        $Result.ResourceGroupName |
            Should -Be $ResourceGroupName
    }
}