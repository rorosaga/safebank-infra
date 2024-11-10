param staticWebAppName string
param staticWebAppLocation string
@allowed([
  'Free'
  'Standard'
])
param staticWebAppSkuName string = 'Free'
param staticWebAppSkuCode string = 'Free'
param feRepositoryUrl string
param feBranch string = 'main'
@secure()
param feRepoToken string = ''
param feAppLocation string = '/'
param feApiLocation string = ''
param appArtifactLocation string = 'dist'

resource staticWebApp 'Microsoft.Web/staticSites@2022-09-01' = {
  name: staticWebAppName
  location: staticWebAppLocation
  sku: {
    tier: staticWebAppSkuName
    name: staticWebAppSkuCode
  }
  properties: {
    repositoryUrl: feRepositoryUrl
    branch: feBranch
    repositoryToken: feRepoToken
    buildProperties: {
      appLocation: feAppLocation
      apiLocation: feApiLocation
      appArtifactLocation: appArtifactLocation
    }
  }
}
