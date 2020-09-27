write-host ('Number of Environment Variables:{0}' -f (Get-ChildItem env:).count)
write-host ('VerbosePreference set to: {0}' -f $VerbosePreference)
write-host ('System Debug set to :{0}' -f $env:system_debug)

Import-Module pester -Verbose

write-host ('Pester Version: {0}' -f (Get-Module 'Pester').Version.ToString())

# cast from empty hashtable to get default
$configuration = [PesterConfiguration]@{}
$configuration.Run.Path = 'tests'
$configuration.TestResult.OutputPath = 'TEST-Environment.nunit.xml'
$configuration.TestResult.OutputFormat = 'NUnitXml'
$configuration.TestResult.Enabled = $False
$configuration.Run.PassThru = $True
$configuration.Run.Exit = $True

Invoke-Pester -Configuration $configuration