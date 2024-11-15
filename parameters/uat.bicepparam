using '../main.bicep'

param environmentType = 'nonprod'
param postgreSQLServerName = 'safebank-dbsrv-uat'
param postgreSQLDatabaseName = 'safebank-db-uat'
param appServicePlanName = 'safebank-asp-uat'
param appServiceAPIAppName = 'safebank-be-uat'
param appServiceAppName = 'safebank-fe-uat'
param location = 'North Europe'
param appServiceAPIDBHostFLASK_APP =  'iebank_api\\__init__.py'
param appServiceAPIDBHostFLASK_DEBUG =  '1'
param appServiceAPIDBHostDBUSER = 'github-secret-replaced-in-workflow'
param appServiceAPIEnvVarDBPASS =  'github-secret-replaced-in-workflow'
param appServiceAPIEnvVarDBHOST =  'safebank-dbsrv-uat.postgres.database.azure.com'
param appServiceAPIEnvVarDBNAME =  'safebank-db-uat'
param appServiceAPIEnvVarENV =  'uat'

param staticWebAppName = 'safebank-swa-uat'
param staticWebAppLocation = 'westeurope'

param registryName = 'safebankcruat'
