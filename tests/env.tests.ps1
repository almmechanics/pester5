BeforeAll {
    (Get-ChildItem env:).Name | foreach-object {Write-Verbose $_}
}

Describe "Get Environment Configuration" {
    It "All Environment variables carried across" {
        (Get-ChildItem env:).count | Should -Be 193
    }

    It "System Debug enabled" {
        $env:system.debug | should -be $True
    }

    It "Verbose Preference is set to Continue" {
        $VerbosePreference | Should -Be 'Continue'
    }
}