## References

1. [Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/configure-azure-load-balancer/2-determine-uses)

2. [Health Probes](https://learn.microsoft.com/en-us/training/modules/configure-azure-load-balancer/7-create-health-probes)

3. [Load Balancing Rules](https://learn.microsoft.com/en-us/training/modules/configure-azure-load-balancer/8-create-load-balancer-rules)

## Components

1. Frontend IP Configuration

   - Public IP (External Load Balancer)
   - Internal IP (Internal Load Balancer)

2. Load Balancing Rules
3. Health Probes
4. Backend Server Pools

```Load Balancer scales up to millions of TCP and UDP application flows.

```

## Load Balancer SKUs

1. Basic

   - Supports upto 300 backend pools
   - You can select virtual machines in a single availability set or virtual machines in an instance of Azure Virtual Machine Scale Sets.
   - Health Probes (HTTP, TCP)
   - No SLA

2. Standard

   - Supports upto 1000 backend pools
   - You can select virtual machines or Virtual Machine Scale Sets in a single virtual network. Your configuration can include a combination of virtual machines, availability sets, and Virtual Machine Scale Sets.
   - Health Probes (HTTPS, HTTP, TCP)
   - Zone-redundant and zonal frontends for inbound and outbound traffic
   - SLA : 99.99% for two or more virtual machines

3. Gateway

## Health Probe

1. Http based Probes

- Exprects response 200
- Default time interval between subsequent probes is 15 seconds
- Probe Timeout is 31 seconds

2. TCP based Probes

- Healthiness of Back end servers is determined by Load balancer using tcp sessions

## Load Balancing Rules.

To define a rule in the Azure portal, you configure several settings:

- IP version (IPv4 or IPv6)
- Front-end IP address, \*Port, and Protocol (TCP or UDP)
- Back-end pool and Back-end port
- Health probe
- Session persistence

  - None (Default)
  - Client IP
  - Client IP and Protocol

  Default Traffic distribution type

  - Five tuple hash (Source IP, Source Port, Destination IP, Destination Port and Protocol)

  Session Affinity

  - Three Tuple hash (Source IP, Source Port, Destination IP)

  - Two Tuple hash (Source IP, Destination IP)

  Determining the traffic distribution type is important and depends on the scenario.
