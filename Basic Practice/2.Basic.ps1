$num =7
foreach ($i in 1..$num){
if ($i%2 -eq 0){
Write-Output "$i" even
}
else{
Write-Output "$i" odd}
}