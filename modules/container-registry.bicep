param registryName string
param registryLocation string = 'westeurope'
@allowed([
  'enabled'
  'disabled'
])
param zoneRedundancy string = 'disabled'
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param registrySku string = 'Basic'
param tags object = {}
@allowed([
  'Enabled'
  'Disabled'
])
param publicNetworkAccess string = 'Enabled'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: registryName
  location: registryLocation
  sku: {
    name: registrySku
  }
  properties: {
    publicNetworkAccess: publicNetworkAccess
    zoneRedundancy: zoneRedundancy
  }
  tags: tags
}
