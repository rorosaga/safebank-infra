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

output containerRegistryName string = containerRegistry.name
#disable-next-line outputs-should-not-contain-secrets
output containerRegistryUsername string = containerRegistry.listCredentials().username
#disable-next-line outputs-should-not-contain-secrets
output containerRegistryPassword0 string = containerRegistry.listCredentials().passwords[0].value
#disable-next-line outputs-should-not-contain-secrets
output containerRegistryPassword1 string = containerRegistry.listCredentials().passwords[1].value
