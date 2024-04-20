1. Setup two VMs (Windows Servers) that will act as the local file share cache for your network.

2. Setup the Storage Account and create a File Share.

3. Install Azure Storage Sync Agent (based on VM - OS type) on both of the VMs.

4. Create a File Sync Service in the Azure.

5. Create a Sync Group in the File Sync Service

   - Select the Storage account and the File Share
   - The **Cloud endpoint** will be created along with the Sync Group

6. A Sync Group can have **one Cloud Endpoint** and more than one **Server Endpoints**

7. A file sync resource can have many Sync Groups.

8. Run the Server Register Service in the VMs and register them to the FileSync Service.

9. Add the Registered Servers as the Server Endpoints in the File Sync Service.

10. Once the Server endpoints are provisioned,

    - Add the file in VM-001's registered share Path, and it will be synced to other VM which is VM-002 through File Share. (File will also be available in the FileShare as well).

    - The Files should **NOT** be added in the Azure File shares directly, because it will not be synced to the cache servers (registered servers).
