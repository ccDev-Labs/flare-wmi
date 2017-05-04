﻿$scope = New-Object System.Management.ManagementScope             
$scope.Path = "\\.\root\CIMv2"             

$newClass = New-Object System.Management.ManagementClass($scope, [String]::Empty, $null);
$newClass["__CLASS"] = "testClass"; 
$newClass.Qualifiers.Add("Static", $true)

$newClass.Properties.Add("TestProp", [System.Management.CimType]::String, $false)
$newClass.Properties["TestProp"].Qualifiers.Add("Key", $true)
$newClass.Properties["TestProp"].Value = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

$newClass.Put() | Out-Null
Start-Sleep 5

$newClass.Properties["TestProp"].Value = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

$newClass.Put() | Out-Null

Start-Sleep 5

$newClass.Properties["TestProp"].Value = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"

$newClass.Put() | Out-Null