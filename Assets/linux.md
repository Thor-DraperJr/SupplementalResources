## shorthand
* / = root
* ~ = home
* . = current directory
* .. = previous directory
* sudo = allows a permitted user to execute a command as the superuser

## basic commands
* ls - list directory contents
* mkdir - make directories
* cd - change directory
* df - report file system disk space usage
* dd - covert and copy a file
* mv - move (rename) files
* dig - DNS lookup utility
* nslookup - query Internet name servers interactively
* ip - show / manipulate routing, network devices, interfaces and tunnels
* man - an interface to the on-line reference manuals
* history - GNU History Library
* touch - change file timestamps
* grep  - print lines matching a pattern
* hostname - show or set the system's host name
* find - search for files in a directory hierarchy
* locate - find files by name
* mtr - combines the functionality of the traceroute and ping programs in a single network diagnostic tool.
* curl - transfer a URL
* wget - The non-interactive network downloader.


## vim - Vi IMproved, a programmer's text editor
### Basics
#### Normal mode
When vim starts up, you will be in Normal mode. Normal mode is not for inserting text into your file but allow you to preform many operations, like saving and exiting. Pressing <ESC> will always return you to Normal mode.

#### Insert Mode
To insert allow you to insert text. Type: `i` to enter insert mode. Press <ESC> to exit insert mode and enter Normal mode.

##### Exit
To exit Vim type:
<ESC> :q! <ENTER> to trash all changes.

OR type:
<ESC> :wq <ENTER> to save the changes.

##### Undo
In Normal mode type: u
##### Return line to its original state
In Normal mode type: <SHIFT>-U
##### Redo (undo the previous undo)
In Normal mode type: <CTRL>-R
##### Delete line
In Normal mode type: dd
##### Delete word(under the cursor)
In Normal mode type: dw
##### Delete character(under the cursor)
In Normal mode type: x
##### Delete from the cursor to the end of the line
In Normal mode type: d$
##### Find word(or string)
In Normal mode type: /theWord <ENTER>

## file hierachy
* **/** - The "root" directory. This is the entry point of all directories and is described as a forward slash, which is actually the home of the Operating System. Everything is in it. Not every user has read and write privileges to this directory; only the administrators or allowed users of the operating systems can have access to such privileges.
* **/bin** - This is the directory that has all the binary files of some important programs on the operating system. This directory holds the data about the most used commands related to making(mkdir), moving(mv), copying(cp), listing(ls), and removing(rm) a directory or file. According to the Linux Filesystem Standards, this directory cannot have subdirectories.
* **/boot** - This is the directory that handles the ignition of the Linux Operating System. First of all, you don’t need to modify anything in this directory, otherwise, you can’t alter anything in it unless you have administrator’s rights. You should stay away from doing anything in this directory, or else it will be a huge mess to set it up again.
* **/dev** - This directory holds the files of the devices like a USB Device or a Hard Drive. Most of the files are either created on the boot time or when a device is attached.
* **/etc** - for those types of configuration files and folders in which the system does not know where to put them. So, it is an “et Cetra” directory for the Linux Operating system. This directory mostly contains the static program local files that affect all users. Since this directory mostly contains files related to the configuration, it is better to call it “Everything to Configure”
* **/home** - This is the directory where most of the user’s personal data is placed. A user spends most of his time here because Downloads, Documents, Desktop, and all other basic required and much-known directories are in this “/home” directory. All the dot configuration files of a user are also in here.
* **/lib** - These are the folders where libraries are stored. Libraries are some files that are needed by any application to perform several tasks or functions. For example, these libraries may be needed by the binary files in the /bin directory.
* **/media** - This is the directory where all the external connected storage devices are mounted automatically. We do not need to do anything in this directory because it is managed by the Operating System itself, but if we want to mount storage devices manually, we have the /mnt directory for that purpose.
* **/mnt** - This is the directory where you can find the other mounted drives. For example, a USB drive, an External Hard Drive, or a Floppy Disk Drive. This is not used nowadays because the devices are automatically mounted to the /media directory, but this is where we can mount our storage devices manually.
* **/opt** - This is the optional folder. It is the directory where manually installed software by vendors is placed.
* **/proc** - This is the directory with the pseudo files. The pseudo files contain information about the processes.
* **/root** - Just like /home directory, /root is the house of the Administrator a.k.a. superuser. Since this is the superuser’s directory, it is better not to touch it unless you have complete knowledge of what you are doing.
* **/run** - This directory is used to store temporary data of processes running on the Operating System.
* **/sbin** - This directory is just like the /bin directory, but this is used by the superuser, and that’s why “s” is used before bin.
* **/snap** - The is the directory with the snap packages stored in it.
* **/srv** - This directory stores the data of the services running on the system. For example, it holds the data if a server is running on the Operating System.
* **/sys** - This directory is always created during boot time, so it is a virtual directory like /dev, and it is the directory when you want to communicate to the Kernal. It also holds information related to the connected devices.
* **/tmp** - This is a temporary directory and holds the temporary files of the applications running on the system.
* **/usr** - This directory contains the applications installed and used by the user. It is also known as the “UNIX System Resources”. It also has its own /bin, /sbin, and /lib directory, which is different from the superuser’s /bin, /sbin, and /lib directories.
* **/var** - This is a variable directory that contains the files and folders whose size is expected to increase with the passage of time and the system’s usage.


## Installs
* iperf - `sudo apt install iptraf` : generates traffic to measure bandwidth
