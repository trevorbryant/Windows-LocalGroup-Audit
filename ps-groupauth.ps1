$Server = hostname
$Configuration = ""
$AuthList = "Administrator", "Trevor", "Test" #GC "C:\temp\authlist"

If (Get-Command -Name Get-LocalGroupMember -ComputerName $server -Eq $True)
     {
         $Configuration = Get-LocalGroupMember Administrators
     } Else {
         $Configuration = "Module LocalAccount is not installed"
}

$Configuration | ForEach { If ($_ -In $AuthList)
    {
        Write-Host "$_ : authorized user"
    } Else {
        Write-Host "$_ : not authorized user"
    }
}