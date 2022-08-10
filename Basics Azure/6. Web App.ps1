# Create variables
$webappname = "webappname1"
$rgname = 'ps-rg'
$location = 'UK South'

# Create a resource group
New-AzResourceGroup -Name $rgname -Location $location


# Create an App Service plan in S1 tier
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName $rgname -Tier S1


# Create a web app
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $rgname