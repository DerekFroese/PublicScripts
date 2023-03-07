<#
#may not catch containers, but who uses those on Windows anyways
#>

$machine = get-wmiobject -computer LocalHost win32_computersystem

$VirtualStrings = 
    "Virtual Machine",
    "VMware",
    "QEMU", #proxmox, KVM
    "Virtual",
    "VirtualBox",
    "HVM domU" #Xen

$isVirtual = $FALSE
foreach ($VirtualString in $VirtualStrings) {
    if (($Machine.Model -contains $VirtualString) -OR
        ($Machine.Manufacturer -contains $VirtualString))
        {$isVirtual = $TRUE}
}
if ($isVirtual) {Write-Output "It's virtual"}
else {Write-Output "It's bare-metal"}
