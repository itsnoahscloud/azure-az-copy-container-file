#######################################################################################################################

# create Resource Group 1
az group create `
--name RG1 `
--location eastus2

# create Storage Account 1
az storage account create `
--resource-group RG1 `
--name itsnoahscloudsa1 `
--location eastus2 `
--sku standard_lrs

# create Container 1
az storage container create `
--account-name itsnoahscloudsa1 `
--name container1 `
--auth-mode login

#######################################################################################################################

# create Resource Group 2
az group create `
--name RG2 `
--location eastus2

# create Storage Account 2
az storage account create `
--resource-group RG2 `
--name itsnoahscloudsa2 `
--location eastus2 `
--sku standard_lrs

# create Container 2
az storage container create `
--account-name itsnoahscloudsa2 `
--name container2 `
--auth-mode login

#######################################################################################################################

# Copy file
$SourceAccountKey = 'zOQAFKHrL0/YibftCm4bDFe3ESl523AvB1yyuNRxiUdDg6Upn51cx7FFj/U7tamY7twpJ0RmXdwq3Mbe9oUaIQ==' # Sample only #
$DestinationAccountKey = 'g2+95stXfVqRA90KvINsZnq88Vv4WU6ThqozawbUirOwG+XQpad800z282Hr9N8dzkw8lHnHrS2vh1KaTTl2pw==' # Sample only #
$SourceContainer = 'container1'
$DestinationContainer = 'container2'
$SourceBlob ='file.txt'
$DestinationBlob = 'file.txt'
az storage blob copy start `
--source-account-name itsnoahscloudsa1 `
--source-account-key $SourceAccountKey `
--source-container $SourceContainer `
--source-blob $SourceBlob `
--account-name itsnoahscloudsa2 `
--account-key $DestinationAccountKey `
--destination-container $DestinationContainer `
--destination-blob $DestinationBlob

#######################################################################################################################

# Verification

# Access-key
$key='g2+95stXfVqRA90KvINsZnq88Vv4WU6ThqozawbUirOwG+XQpad800z282Hr9N8dzkw8lHnHrS2vh1KaTTl2pw==' # Sample Only #

# List containers
az storage container list --account-name itsnoahscloudsa2 --account-key $key -o table

# List blobs contents
az storage blob list -c container2 --account-name itsnoahscloudsa2 --account-key $key -o table
