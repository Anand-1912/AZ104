[MSDN](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10)

1. Supports Migration of data to and out of Azure Storage Accounts

2. Uses SAS or Entra ID AuthN.

3. Examples

   - `azcopy copy "C:\local\path" "https://account.blob.core.windows.net/mycontainer1/?sv=2018-03-28&ss=bjqt&srt=sco&sp=rwddgcup&se=2019-05-01T05:01:17Z&st=2019-04-30T21:01:17Z&spr=https&sig=MGCXiyEzbtttkr3ewJIh2AR8KrghSy1DGM9ovN734bQF4%3D" --recursive=true`

   - azcopy login (to login using Entra Id before executing copy or other commands)

4. Supports the following.

- Upload files to Azure Blob Storage
- Download files from Azure Blob Storage
- Copy blobs between Azure Storage accounts
- Sync Local with Azure Blob Storage
- Transfer data to Azure File Shares
- Copy Data from AWS S3 / Google Storage to Azure Storage

## Important Commands:

- azcopy login
- azcopy logout
- **azcopy make**
- azcopy bench
- **azcopy copy**
- azcopy jobs
- **azcopy remove**
- azcopy sync

AzCopy does not have a command to rename files.

Azure Storage Explorer uses AzCopy for Data operations.
