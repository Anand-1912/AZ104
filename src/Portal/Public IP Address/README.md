## References

1. [Azure Public IP](https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/6-create-public-ip-addressing)

## Key Points

IP Versions Supported

- IPV4
- IPV6

**SKU**

1.  Basic

    - Supports both Static and Dynamic Assignments

    - used with Basic Load Balancer,Network interfaces, VPN gateways, Application gateways, and internet-facing load balancers

2.  Standard

    - Supports only Static Assignments

    - used with Standard Load Balancer and Network Interfaces

### Static IP Assignments

1. IP Address is assigned to the public ip resource regardless of state of the resource to which the public ip resource is allocated to.

2. IP get un-assigned only when the Public IP Resource is deleted

### Dynamic IP Assignments

1. IP Address is assigned only when the resource that needs Public IP resource is started

2. Deallocated when the dependent resource is dellocated, stopped and restarted.

IP Address in Dynamic IP Assignments can change.
