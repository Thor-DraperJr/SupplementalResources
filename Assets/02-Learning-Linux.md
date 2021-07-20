# 02-Learning-Linux
## Common Symbol Alias
| Directory | Description |
| :-------- | :---------: |
| `/` | root |
| `~` | home |
| `.` | current directory |
| `..` | previous directory |

## Basic Commands 
| Command | Options |Definition |
| :------ | :-------: | -----: |
| sudo | | allows a permitted user to execute a command as the super user |
| | -l | list user's privileges or check a specific command; use twice for longer format |
| pwd | | present working directory |
| ls | | show directory contents, lists names of files |
| | -a | do not ignore entries starting with `.` |
| | -l | use a long listing format |
| | -h | with -l and -s, print sizes like 1K 234M 2G etc. |
| cd | | change directory |
| mv | | move |
| cp | | copy |
| su | | switch user |
| | -s | run shell if /etc/shells allows it |
| mkdir | | make directories |
| df | | report file system disk space usage |
| dd | | covert and copy a file |
| dig | | DNS lookup utility |
| nslookup | | query Internet name servers interactively |
| ip | | show / manipulate routing, network devices, interfaces and tunnels |
| man | | an interface to the on-line reference manuals |
| touch | | change file timestamps |
| grep  | | print lines matching a pattern |
| hostname | | show or set the system's host name |
| find | | search for files in a directory hierarchy |
| | -iname | the match is case insensitive |
| | -type f | search for files |
| | -type d | search for directories |
| locate | | find files by name |
| mtr | | combines the functionality of the traceroute and ping programs in a single network diagnostic tool |
| curl | | transfer a URL |
| wget | | The non-interactive network downloader |
| nc | | arbitrary TCP and UDP connections and listens |
| clear | | clears the terminal history on the page |
| history | | Display or manipulate the history list |
| chmod | | change the permissions info |
| chown | | change the owner and group of a file |
| usermod | | modify a user account |
| useradd | | create a new user or update default new user information |
| groupadd | | create a new group |
| wc | | print newline, word, and byte counts for each file |
| | -l | print the newline counts |
| cut |  | remove sections from each line of files |
| awk |  | pattern scanning and processing language; awk -F(DELIMITER) '{print $(FIELD_NUMBER)}' (FILE) |
| | -F | input field separator |
| sed |  | stream editor for filtering and transforming text |
| cat |  | concatenate files and print on the standard output |
| more |  | a filter for paging through text one screenful at a time. |
| less |  |  Less is a program similar to more, but it has many more features.  Less does not have to read the entire input file before starting, so with large input files it starts up faster than text editors like vi |
|  |  |  |

### Reading `ls`

* Column 1 indicates information regarding file permission.
    * The very first character represents the file type. It will be one of:
        * –:  A regular file.
        * b: A block special file.
        * c: A character special file.
        * d: A directory.
        * l: A symbolic link.
        * n: A network file.
        * p: A named pipe.
        * s: A socket.
    * The next nine characters are three groups of three characters displayed contiguously. Each group of three represent the read, write, and execute permissions, in that order. If the permission is granted, there will be an r, w, or x present. If the permission is not granted, a hyphen - is shown.
        * The first set of three characters are the permissions for the file owner. The second set of three permissions are for group members, and the last set of three permissions is for others.
        * Sometimes the execution permission for the owner is represented by an s. This is the setuid bit. If it is present, it means that the file is executed with the privileges of the file owner, not the user executing the file.
        * The execution permission for the group can also be an s.  This is the setgid bit. When this is applied to a file, it means the file will be executed with the privileges of the ower’s group. When used with a directory, any files created inside it will take their group permissions from the directory they’re being created in, not from the user who is creating the file.
        * The execution permission for the others can sometimes be represented by a t. This is the sticky bit. It is usually applied to directories. If this is set, regardless of the write and executable privileges that are set on the files in the directory, only the file owner, the directory owner, or the root user can rename or delete files in the directory.
            * A common use for the sticky bit is on folders such as “/tmp”. This is writable by all users on the computer. The sticky bit on the directory ensures that users—and processes launched by the users—can only rename or delete their own temporary files.
* Column 2 indicates the number of links to the file.
* Column 3 & 4 indicates the owner and group information.
* Column 5 indicayes size of the file in bytes.
* Column 6 shows th date and time on which the file was recently modified.
* Column 7 shows the file or directory name

#### File Permissions

| Classes  | Definition | 
| :-- | --: |
| Owner | usually the creator of the file or folder. In Linux, any files or folders that you create in your Home directory are usually owned by you unless you specifically change the ownership | 
| Group | contains a group of users who share the same permissions and user privilege |
| Others | the general public |

---

| Permissions  | Definition | 
| :-- | --: |
| Read | You cannot modify the contents of the file in any way. When applied to a Folder, you can only view the files within that folder; you cannot delete or modify the files in any way or add more files to the folder.|
| Write | You can modify the file. If you have “write” access to a folder, then you can delete and add files to that folder. | 
| Execute | Execute is mainly used when you need to run the file and is most commonly used when you need to run a script. |

---

| Permissions  | Permutation | 
| :-- | --: |
| Read, Write, and Execute | 7 |
| Read and Write | 6 |
| Read and Execute | 5 |
| Read | 4 |
| Write and Execute | 3 |
| Write | 2 |
| Execute | 1 |
| No permission | 0 |

---

Every file and folder contains 8-bit data that controls the permissions. In its basic binary form, 000 means that no permissions of any form are granted.

A complete set of file permissions assigns the first digit to the Owner, the second digit to the Group, and the third to Others. Here are some of the commonly used permissions:

* **755:** This set of permissions is commonly used by web servers. The owner has all the permissions to read, write and execute. Everyone else can read and execute but cannot make changes to the file.
* **644:** Only the owner can read and write. Everyone else can only read. No one can execute this file.
* **655:** Only the owner can read and write and cannot execute the file. Everyone else can read and execute and cannot modify the file.

### Combining Commands
* Pipe operator `|`:
    * Pipe is used to combine two or more commands, and in this, the output of one command acts as input to another command, and this command’s output may act as input to the next command and so on.
* Logical AND operator `&&`:
    * The second command will only execute if the first command has executed successfully.
* Semi-Colon Operator `;`:
    * The execution of the second command is independent of the execution status of the first command.

## vim | Vi IMproved, a programmer's text editor
__**Basics**__
* Normal mode
    * When vim starts up, you will be in Normal mode. Normal mode is not for inserting text into your file but allow you to preform many operations, like saving and exiting. Pressing <ESC> will always return you to Normal mode.
* Insert Mode
    * To insert allow you to insert text. Type: `i` to enter insert mode. Press <ESC> to exit insert mode and enter Normal mode.
    * To exit Vim press `ESC` and then type: 
        * `:q!` + [ENTER] to trash all changes.
        * `:wq` + [ENTER] to save the changes.
* Undo
    * In Normal mode type: u
    * Return line to its original state
        * In Normal mode type: [SHIFT] + U
    * Redo (undo the previous undo)
        * In Normal mode type: [CTRL] + R
* Delete 
    * Delete line
        * In Normal mode type: dd
    * Delete word(under the cursor)
        * In Normal mode type: dw
    * Delete character(under the cursor)
        * In Normal mode type: x
    * Delete from the cursor to the end of the line
        * In Normal mode type: d$
* Find word(or string)
    * In Normal mode type: `/`theWord + [ENTER]

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

## What do the directory colors mean?
The colours from ls are as follows:

* **Blue:** Directory
* **Green:** Executable or recognized data file
* **Sky Blue:** Link
* **Yellow (black background):** Device file
* **Pink:** Graphics image file
* **Red:** File Archive


## Other Helpful Tools
### Installs
* iperf - `sudo apt install iptraf` : generates traffic to measure bandwidth

### How to Show Asterisks While Typing Sudo Password in Linux+
* `sudo cp /etc/sudoers /etc/sudoers.bak`
    * You can enable the password feedback feature in /etc/sudoers file, but first create a backup of the file
* `sudo visudo`
* Search for the following line. `Defaults env_reset`
* And append pwfeedback to it, so that it looks like this. `Defaults env_reset,pwfeedback`