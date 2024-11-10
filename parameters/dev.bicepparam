using '../main.bicep'

param environmentType = 'nonprod'
param postgreSQLServerName = 'safebank-dbsrv-dev'
param postgreSQLDatabaseName = 'safebank-db-dev'
param appServicePlanName = 'safebank-asp-dev'
param appServiceAPIAppName = 'safebank-be-dev'
param appServiceAppName = 'safebank-fe-dev'
param location = 'North Europe'
param appServiceAPIDBHostFLASK_APP =  'iebank_api\\__init__.py'
param appServiceAPIDBHostFLASK_DEBUG =  '1'
param appServiceAPIDBHostDBUSER = 'github-secret-replaced-in-workflow'
param appServiceAPIEnvVarDBPASS =  'github-secret-replaced-in-workflow'
param appServiceAPIEnvVarDBHOST =  'safebank-dbsrv-dev.postgres.database.azure.com'
param appServiceAPIEnvVarDBNAME =  'safebank-db-dev'
param appServiceAPIEnvVarENV =  'dev'

param staticWebAppName = 'safebank-swa-dev'
param staticWebAppLocation = 'westeurope'
