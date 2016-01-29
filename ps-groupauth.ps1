$Server = hostname
$AuthList = "Administrator", "Trevor", "Test" #GC "C:\temp\authlist"
$Configuration = ""

# If cmdlet exists, do work
If (Get-Command -Name Get-LocalGroupMember -Eq $True -ErrorAction SilentlyContinue)
     {
         $Configuration = Get-LocalGroupMember -ComputerName $Server Administrators
     } Else {
         $Configuration = "Module LocalAccount is not installed"
}

# For each User existing in $AuthList, output Authed/Not Authed
$Configuration | ForEach { If ($_ -In $AuthList)
    {
        Write-Host "$_ : authorized user"
    } Else {
        Write-Host "$_ : not authorized user"
    }
}
