$type = Read-Host '(D)atacenter or (C)luster?'

if ($type -eq "datacenter" -or $type -eq "d") {
	$datacenter = Read-Host 'Enter Datacenter Name'
	$typevar = Get-Datacenter $datacenter
}

elseif ($type -eq "cluster" -or $type -eq "c") {
	$cluster = Read-Host 'Enter Cluster name'
	$typevar = Get-Cluster $cluster
}

else{
}

$typevar | Get-VM | Get-View | ForEach-Object{

	if ($_.config.tools.toolsUpgradePolicy -ne “upgradeAtPowerCycle”){

		Write-Host $_.name

		$vm = Get-VM -Name $_.name

		$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
		$spec.changeVersion = $vm.ExtensionData.Config.ChangeVersion
		$spec.tools = New-Object VMware.Vim.ToolsConfigInfo
		$spec.tools.toolsUpgradePolicy = “upgradeAtPowerCycle”

		$_this = Get-View -Id $vm.Id
		$_this.ReconfigVM_Task($spec)

	}
}
Write-Host “Completed”


<#
$machines = Get-Cluster $cluster | Get-VM | Get-View | ForEach-Object{
Write-Output $_.name

if ($_.config.tools.toolsUpgradePolicy -ne “upgradeAtPowerCycle”){
Write-Host $_.name
$vm = Get-VM -Name $_.name

$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.changeVersion = $vm.ExtensionData.Config.ChangeVersion
$spec.tools = New-Object VMware.Vim.ToolsConfigInfo
$spec.tools.toolsUpgradePolicy = “upgradeAtPowerCycle”

$_this = Get-View -Id $vm.Id
$_this.ReconfigVM_Task($spec)

Write-Host “Completed”
}
}
}

else{
}
#>