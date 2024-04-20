## References

1. [Setup Availabilty Set](https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-availability/3-setup-availability-sets)

2. [Update and Fault Domains](https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-availability/4-review-update-fault-domains)

## Notes

1. Logical Grouping to increase the Availability of VMs

2. Fault Domains (max 3) and Update Domains (max 20)

3. The Grouping ensures that not all of the machines are upgraded at the same time during a host operating system upgrade in the datacenter.

4. A virtual machine can only be added to an availability set when the virtual machine is created. To change the availability set for a virtual machine, you need to delete and then recreate the virtual machine.

5. > [!IMPORTANT]  
   > Each application tier exercised in your configuration should be located in a separate availability set. The separation helps to mitigate single point of failure on all machines.

(i.e) Web tier should be in its own Availability Set, likewise Middle tier and Database tier.
