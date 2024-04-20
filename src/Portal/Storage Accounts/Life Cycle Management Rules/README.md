## Key Points

`Life Cycle management is for blobs`

1. Supports Standard General Purpose V2 account's blobs and Premium Blob Storage account's blob

2. Supports Life Cycle management for **Base Blob, Snapshots and Versions**

3. Supports **Block blobs** and **Append blobs**

4. Rules can be applied to all the blobs or only to certain blobs based on **Filter Sets**

   eg . Blobs belongs to a particular container, etc

5. Rules can be based on blob's

   - created date
   - last modified date
   - last accessed date ( **access tracking** needs to be enabled )

6. Defined at Storage account level and runs once per day

7. Example transitions

   - Hot to Cool
   - Hot to Archive
   - Cool to Archive
   - Deletion at the end of lifecycle of the blob
