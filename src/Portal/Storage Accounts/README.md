## References

1. [Blob upload types](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/7-upload-blobs)

2. [Replication strategies](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/5-determine-replication-strategies)

3. [Azure Storage Encryption using CMK](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/6-create-customer-managed-keys)

- Storage account and Keyvault should be in the same region but can belong to different Subscription.

## Key Points

1. Types

- Standard (GPV2)

  Supports LRS, GRS, ZRS, GZRS, RGRS and RGZRS replications.

- Premium Block Blob
- Premium Page Blob
- Premium File Shares

  Premium Storage accounts support only LRS and ZRS replications.

- Large File shares are supported when replication type is either LRS or ZRS. (100 TiB fileshare capacity and increased performance)

- All storage account types are encrypted by using Storage Service Encryption (SSE) for data at rest.

- Data is encrypted automatically before it's persisted to _Azure Managed Disks, Azure Blob Storage, Azure Queue Storage, Azure Cosmos DB, Azure Table Storage, or Azure Files_.

- Azure Storage encryption is enabled for all new and existing storage accounts and can't be disabled.
