## References

1. [Deployment Slots](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/5-create-deployment-slots)

2. [Swapped settings versus slot-specific settings](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/6-add-deployment-slots)

3. [App Service - Security Module -EasyAuthModule_32/64](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/7-secure-app-service)

4. [Back up and restore your App Service app](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/9-backup-app-service)

5. [Application Insights](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/10-use-application-insights)

## Key Points

1. #### Deployment Slots

   - Requires atleast **Standard** App Service Plan
   - Auto Swap
   - Slot Specific Settings (eg. SSL Certificates, VNet Integration, Managed Identities, CORS, Custom domain names, Always ON, IP Restrictions,Service Connector and the Environment Variables set by them )
   - Swapped Settings (eg. Connection strings (_can be modified to a slot specific_), App Settings (_can be modified to a slot specific_), Handler mappings, Content )

2. #### Security Module

   - Available from **Free** plan.
   - Supports different providers (entra, facebook , google and twitter)
   - Stores, validates and refreshes the AuthN tokens
   - Log traces
   - Identity Injection in the Request Headers
   - EasyAuthModule.

3. #### Custom Domain

   - Needs atleast **Shared** App Service Plan

4. #### Backup and Restore

   - Needs atleast **Basic** Plan
   - Supports full and partial backup
   - Needs Storage account and container in the same subscription as the AppService plan
   - Backup can hold up to 10 GB of App and Database Content

   `If your storage account is enabled with a firewall, you can't use the storage account as the destination for your backups.`
