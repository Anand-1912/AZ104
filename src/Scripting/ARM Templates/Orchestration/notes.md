1. To define the relationships between the resources so that Azure Resource Manager will deploy the resources in the proper order and achieve maximum parallelization. this is done using **Depends On** block in the templates.

```
for example, we have to deploy storage account and then blob container.

Here, storage account is the parent resource and blob container is the child resource.
```
