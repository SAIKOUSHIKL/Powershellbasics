Get-Host
cd  ..
Get-Command
New-Item -Path E:\ -Name Powershell -ItemType directory
New-Item -Path E:\Powershell -Name folder1 -ItemType directory
New-Item -Path E:\Powershell -Name folder2 -ItemType directory
pwd
New-Item -Path E:\Powershell\folder1 -Name 1.txt -ItemType file -Value "welcome"
New-Item -Path E:\Powershell\folder2 -Name 1.txt -ItemType file -Value "welcome"
New-Item -Path E:\Powershell\folder1, E:\Powershell\folder2 -Name 2.txt -Value "welcome to powershell"

Copy-Item -Path E:\Powershell\folder1\* -Destination E:\Powershell\folder2
Remove-Item -Path E:\Powershell\folder2\folder1

Move-Item -Path E:\Powershell\folder1 -Destination E:\Powershell\folder2

$files = Rename-Item -Path E:\Powershell\folder2\folder1\2.txt -NewName two.txt
$files
