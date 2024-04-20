## References

1. [learn](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/6-determine-blob-object-replication)

## Key Points

Object Replication is for blobs.

`When object replication is enabled, blobs are copied asynchronously from a source storage account to a destination account. Cross-tenant policies will appear under "Other accounts", along with policies on accounts not in an active subscription or on deleted accounts. The storage accounts may be in different Azure regions`

1. Versioning and Changefeed needs to be enabled in the Source Storage account

2. Versioning needs to be enabled in the Destination Storage account.

3. Replication can be enabled between Storage account from different Subscriptions and tenants.

4. Specific Blobs can be replicated using **Copy Over** conditions.

- Everything
- Custom
- New

Note: Versioning can be enabled even after the storage account is created.

5. Object Replication does not replicate Snapshots from Source to Destination Storage account.
