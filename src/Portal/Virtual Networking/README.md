## References

1. [Subnets and NSG](https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/3-create-subnets)

2. [VNet Peering](https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/2-determine-uses)

3. [Gateway Transit - Hub Spoke](https://azure.microsoft.com/en-us/blog/create-a-transit-vnet-using-vnet-peering/)

## Keypoints

**Subnets**

1. A subnet can be associated with Zero or one NSG (atmost 1 NSG)

2. One NSG can be mapped to many Subnets

3. Reserved IP Addresses per subnet.

   - Five

Let's examine the reserved addresses in an IP address range of 192.168.1.0/24.

- 192.168.1.0 This value identifies the virtual network address.
- 192.168.1.1 Azure configures this address as the default gateway.
- 192.168.1.2 and 192.168.1.3 Azure maps these Azure DNS IP addresses to the virtual network space.
- 192.168.1.255 This value supplies the virtual network broadcast address.

**NSG**

1. NSGs are associated to Subnet and NICs
2. NSG rules implements DMZ (DeMilitarized Zones)

NSG security rule contains the following settings.

- Name
- Priority
- Port
- Protocol (Any, TCP, UDP)
- Source (Any, IP addresses, Service tag)
- Destination (Any, IP addresses, Virtual network)
- Action (Allow or Deny)

**VNet Peering**

1. Regional VNet Peering

   - Connects VNets in the same regions (can be from different subscriptions)

2. Global VNet Peering

   - Connects VNets in the different regions (can be from different subscriptions)

3. Traffics flow between the Vnets through Microsoft Backbone network

4. No Resource disruptions occur when creating or after Creating the VNet peering.

5. Peering Status

   - **Initiated** (status of first vnet only)

   first vnet ----> second vnet (remote vnet)

   - **Connected** (status of both vnets)

   first -------> second (remote vnet)
   vnet <-------- vnet

   `Your peering isn't successfully established until both virtual networks in the peering have a status of Connected.`

6. Virtual network peering is nontransitive

7. Extended Peering Techniques

   - Hub and Spoke networks
   - UDR (User Defined Routes)
   - Service Chaining
