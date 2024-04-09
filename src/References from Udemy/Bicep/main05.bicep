// Can we just output the values of the CIDR function to see what we get
// output - https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/outputs?tabs=azure-powershell
// The different data types - https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/data-types

output subnetvalues array=[for i in range(1, 3) : cidrSubnet('10.0.0.0/16', 24, i)]

