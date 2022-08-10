$num=10
foreach ($i in 0..$num){
if ($i%2 -eq 0){
New-Item -Path E:\Powershell\folder2\$i.txt -ItemType file -Value "ok"
}
else{
New-Item -Path E:\Powershell\folder2\folder1\$i -ItemType file -Value "hello" 
}
}
