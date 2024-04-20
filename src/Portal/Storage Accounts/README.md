## References

1. [Blob upload types](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/7-upload-blobs)

2. [Replication strategies](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/5-determine-replication-strategies)

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
