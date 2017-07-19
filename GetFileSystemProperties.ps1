$Day = (Get-Date).AddDays(-1).ToString("dd")
$YearMonth = (Get-Date).AddDays(-1).ToString("yyyy-MM")
$SearchFolder = "\\ES-W12-FTP-3\fidelity\dataextracts\BDE\Archive" 
$ExportFolder = "C:\blah"
$FileName = "test_dir_listing_"+ $YearMonth +"-"+ $Day+".csv"
$SearchPath = $Folder +"\"+ $YearMonth +"\"+ $Day
$ExportPath  = $ExportFolder +"\"+ $FileName

Get-ChildItem -Path $SearchPath -Filter *.DONE  -Recurse | #-Filter *.DONE -Include "*mouse*" -Exclude "*.png" 
Select-Object * |#Name,Directory,Length,LastWriteTime | #* | #Name, Created, filePath, Extension, Folder, Directory, FullName, CreationTime, Length, Chosen, directoryname, basename, PSIsContainer, LastWriteTime | 
Export-Csv -Path $ExportPath -Encoding ascii -NoTypeInformation

#(get-childitem)[0].psobject.properties
#Get-ChildItem | Get-Member # this gets you everything
#Get-ChildItem | Get-Member -MemberType Property
