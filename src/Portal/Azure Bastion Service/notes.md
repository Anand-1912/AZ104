1. Azure Bastion Service is used to make secure RDP / SSH connection to Windows/ Linux VM.

2. When Azure Bastion is deployed in a VNet, then VMs hosted in that VNet does not need Public IP address to connect them.

3. Azure Bastion needs a delegated subnet with the name **AzureBastionSubnet**. It should be empty initially.

4. Azure Bastion Service deploys the required resources in that subnet.

5. Azure Bastion Service can also be used to connect VM hosted in the peered vnets.

6. Azure Bastion Service has 3 tiers.

   - Developer - 1 instance (available in a few regions)
   - Basic - 2 instances
   - Standard - 2 to 50 instances
