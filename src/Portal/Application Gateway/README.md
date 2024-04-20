## References

1. [Azure Application Gateway](https://learn.microsoft.com/en-us/training/modules/configure-azure-application-gateway/2-implement)

2. [Routing](https://learn.microsoft.com/en-us/training/modules/configure-azure-application-gateway/3-determine-routing)

3. [Gateway Components](https://learn.microsoft.com/en-us/training/modules/configure-azure-application-gateway/4-app-gateway-components)

## Key Points

Application Gateway needs its own subnet in a VNet where it is deployed to main its own resources

1. Layer 7 routing
2. Supported Protocols
   - Http
   - Https
   - Http /2
   - Web Sockets Protocol
3. Firewall Protection

   `The firewall checks each request for threats based on the Open Web Application Security Project (OWASP). Common threats include SQL-injection, cross-site scripting, command injection, HTTP request smuggling and response splitting, and remote file inclusion. Other threats can come from bots, crawlers, scanners, and HTTP protocol violations and anomalies.`

4. Session Stickiness
5. Auto Scaling
6. End to End Encryption
7. Rewrite Request and Response Headers
8. Health Probe

`The back-end pool can include Azure virtual machines, Azure Virtual Machine Scale Sets, Azure App Service, and even on-premises servers.`

9. Load Balancing (Round Robin Technique)

#### Components

1. Frontend IP
2. WAF (optional)
3. Listener

   - Basic (Path based Routing)
   - Multi Site (Site based Routing)

4. Routing Rules
5. Backend Pools
6. Http Settings
7. Health Probes

   `Health probes determine which servers in your back-end pool are available for load-balancing. Application Gateway uses a health probe to send a request to a server. When the server returns an HTTP response with a status code between 200 and 399, the server is considered healthy. If you don't configure a health probe, Application Gateway creates a default probe that waits for 30 seconds before identifying a server as unavailable (unhealthy).`

#### Types of Routing

1. **Path Based Routing**

   - sends requests with different URL paths to different pools of back-end servers.

2. **Multi Site Routing**

   - configures more than one web application on the same application gateway instance.
