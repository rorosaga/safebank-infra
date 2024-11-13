param location string = resourceGroup().location
param postgreSQLServerName string = 'ie-bank-db-server-dev'
param postgreSQLDatabaseName string = 'ie-bank-db'
param postgreSQLAdminLogin string = 'iebankdbadmin'
@secure()
param postgreSQLAdminPassword string

resource postgreSQLServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: postgreSQLServerName
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    administratorLogin: postgreSQLAdminLogin
    administratorLoginPassword: postgreSQLAdminPassword
    createMode: 'Default'
    highAvailability: {
      mode: 'Disabled'
      standbyAvailabilityZone: ''
    }
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    version: '15'
  }

  resource postgreSQLServerFirewallRules 'firewallRules@2022-12-01' = {
    name: 'AllowAllAzureServicesAndResourcesWithinAzureIps'
    properties: {
      endIpAddress: '0.0.0.0'
      startIpAddress: '0.0.0.0'
    }
  }
}

resource postgreSQLDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  name: postgreSQLDatabaseName
  parent: postgreSQLServer
  properties: {
    charset: 'UTF8'
    collation: 'en_US.UTF8'
  }
}

output postgreSQLServerName string = postgreSQLServer.name
output postgreSQLDatabaseName string = postgreSQLDatabase.name
