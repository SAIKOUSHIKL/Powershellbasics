Write-Host "Azure login using service prinicipal"

Start-Sleep -Seconds 10 

az login --service-principal -u "c9ed6a78-84a0-4432-afc6-862ce485ba1c" -p "UcF8Q~_VlKispK~VpETicbBgar96lUNTYq.t4b4Y" --tenant "6087e97c-96ca-4fc2-a403-b61de33d7cd0"

Write-Host "Create RG"

Start-Sleep -Seconds 10 

New-AzResourceGroup -Name ps-rg -Location "UK South"

Write-Host "Config Subnet"

Start-Sleep -Seconds 10 

$subnet01 = New-AzVirtualNetworkSubnetConfig -Name subnet01 -AddressPrefix 10.0.0.0/24
$subnet02 = New-AzVirtualNetworkSubnetConfig -Name subnet02 -AddressPrefix 10.0.1.0/24
$subnet03 = New-AzVirtualNetworkSubnetConfig -Name subnet03 -AddressPrefix 10.0.2.0/24

Write-Host "Create Vnet"

Start-Sleep -Seconds 10 

$vnet = NewAzVirtualNetwork -Name ps-vnet -ResourceGroupName ps-rg -Location "UK South" -AddressPrefix 10.0.0.0/16 -Subnet $subnet01,$subnet02, $subnet03

Write-Host "Create VM"

Start-Sleep -Seconds 10 

#https://isc.sans.edu/diary/Powershell+Payload+Stored+in+a+PSCredential+Object/26058 (link for username& pswd)

$user = "sai"
$password = ConvertTo-SecureString 'Koushik10161016' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $user, $password



New-AzVm `
    -ResourceGroupName 'ps-rg' `
    -Name 'myVM' `
    -Location 'UK South' `
    -VirtualNetworkName '$vnet' `
    -SubnetName '$subnet01' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389 -credential $credential

Write-Host "Created VM"