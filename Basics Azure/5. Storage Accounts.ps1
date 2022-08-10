Remove-AzResourceGroup -Name ps-rg

Write-Host "VM Removed"

Start-Sleep -Seconds 10 


#Creating storage account

New-AzStorageAccount -ResourceGroupName ps-rg -Name storageaccountnameany -Location westus -SkuName Standard_GRS


#Creating 5 storage account's using foreach- loop

#Create variables

$storageaccount = "storageaccountnameany"

$num= 5
foreach ($i in 0..$num){

New-AzStorageAccount -ResourceGroupName ps-rg -Name $storageaccount$i -Location westus -SkuName Standard_GRS
}



#We can give number for creating


$storageaccount = "storageaccountnameany"

$num= Read-Host "Please enter value maximum 50 storage accounts"

foreach ($i in 0..$num){

New-AzStorageAccount -ResourceGroupName ps-rg -Name $storageaccount$i -Location westus -SkuName Standard_GRS
}


#Creating storage account in different RG

$storageaccount = "storageaccountnameany"

$num= 10
foreach ($i in 0..$num){
if ($num%2 -eq 0){

New-AzStorageAccount -ResourceGroupName ps-rg -Name $storageaccount$i -Location westus -SkuName Standard_GRS
}
else{
New-AzStorageAccount -ResourceGroupName ps-rg1 -Name $storageaccount$i -Location UK South -SkuName Standard_LRS 
}



#Creating storage account in Same RG

$storageaccount1 = "storageaccountnameeven"
$storageaccount2 = "storageaccountnameodd"

$num= 10
foreach ($i in 0..$num){
if ($num%2 -eq 0){

New-AzStorageAccount -ResourceGroupName ps-rg -Name $storageaccount1$i -Location UK South -SkuName Standard_GRS
}

else{
New-AzStorageAccount -ResourceGroupName ps-rg -Name $storageaccount2$i -Location UK South -SkuName Standard_LRS 
}