# Objective

## What is Vagrant
Vagrant is an open-source software product for building and maintaining portable virtual software development environments; e.g., for VirtualBox, KVM, Hyper-V, Docker containers, VMware, and AWS. It tries to simplify the software configuration management of virtualizations in order to increase development productivity. 
## Terms
* **sudo**: super user do
* **bash**: this is a shell for executing scripts
* **Virtualization**: Virtualization creates a simulated, or virtual, computing environment as opposed to a physical environment. Virtualization often includes computer-generated versions of hardware, operating systems, storage devices, and more. This allows organizations to partition a single physical computer or server into several virtual machines. Each virtual machine can then interact independently and run different operating systems or applications while sharing the resources of a single host machine.

### Step 1
Verify you're in the right directory
```
ls
```
![images/expectedPath.png](images/expectedPath.png)
### Step 2


`Windows`
```
bash vagrant-linux.sh --create
```

`Mac`
```
sudo bash vagrant-linux.sh --create
```
![images/1-expectedOutcome.png](images/1-expectedOutcome.png)


## Common issues:
## Virutalizaion not turned on in the BIOS
![images/2-VT-xError.png](images/2-VT-xError.png)
#### If you see this error ####
This means that you don't have virutlaiztion turned on in the BIOS. Take a look at this [documentation](https://helpdeskgeek.com/how-to/enable-virtualization-in-the-bios/)


### No such directory