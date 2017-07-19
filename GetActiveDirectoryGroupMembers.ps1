cls
#Import AD module
Add-PSSnapin Quest.ActiveRoles.ADManagement
Import-Module activedirectory
#create empty collection of PS objects
$col=@()
#Read txt files with group names
#create txt document called "groups.txt" in the same folder where you placed this script and list groups in this txt file
gc ./groups.txt |% {
    [string]$groupname = $_
    #for each group get info about it's members
    $info=Get-ADGroupMember $groupname | %{
        #create new custom object
        $obj = New-Object psobject
        $obj |Add-Member NoteProperty GroupName $groupname
        $obj |Add-Member NoteProperty UserName $_.samaccountname
        $obj |Add-Member NoteProperty FullName $_.name
        #add custome object to collection
        $col+=$obj
        }
    }
#Export custob objects collection to CSV file in the same folder where you placed this script
$col |Export-Csv ./AD-Export.csv -NoTypeInformation
