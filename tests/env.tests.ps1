BeforeAll {
    (Get-ChildItem env:).Name | foreach-object {write-verbose $_}
}

Describe "Get Environment Configuration" {
    It "All Enviroment variables carried across" {

        (Get-ChildItem env:).count | Should -Be 1
    }

    It "verbose Preference is set to Continue " {
        $VerbosePreference | Should -Be 'Continue'
    }
}