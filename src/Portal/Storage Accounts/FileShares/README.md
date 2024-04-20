## References

1. [TebiBytes]([https://www.techtarget.com/searchstorage/definition/tebibyte-TiB])

2. [Snapshots](https://learn.microsoft.com/en-us/training/modules/configure-azure-files-file-sync/4-create-file-share-snapshots)

## Key Points

1. **Types**

   1. Standard

   - created in **Standard General Purpose V2 Storage account**
   - uses Standard Hard Disk Drives (HDD)
   - supports SMB (uses port **445**) and REST access
   - can allow switching between _Hot_,_Cool_,_Transaction Optimized_ access tiers
   - Hot tiers are used when _Azure File Sync_ needs to be enabled.

   - Default Capacity: 5 TiB (5 TebiByte)
   - 1000 IO/s
   - Large File Shares - 100 TiB and increases the performance (not supported in GRS, and more)

   2. Premium

   - created in **Premium File Storage Account**
   - uses Solid State Drives (SSD)
   - supports SMB, NFS and REST protocols

   `A fileshare can support either SMB or NFS but not both. Storage account can have multiple fileshares`

2. Snapshots Support

   - Manual **Share Level Snapshots**
   - Automated Snapshot using Auto Backup configuration

     - Backups are stored using _Azure Recovery Services Vault_
   - Read only

3. Soft Delete Support

- Can be enabled for **SMB** based File Shares only
- Can be enabled on existing and New file shares
- Can be retained for 1 to 365 days

