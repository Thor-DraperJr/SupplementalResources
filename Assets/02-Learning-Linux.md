# 02-Learning-Linux
## What are basic elements or components of Linux?
* **Kernel:** It is considered a core or main part of Linux and is generally responsible for all major activities of OS such as process management, device management, etc.  
* **System Library:** These are special functions or programs with the help of which application programs or system utilities can access features of the kernel without any requirement of code. It is simply used to implement the functionality of the OS. 
* **System Utility:** These are utility programs that are responsible to perform specialized and individual-level tasks. They are considered more liable and allow users to manage the computer.  
* **Hardware:** It is physical hardware that includes items such as a mouse, keyboard, display, CPU, etc. 
* **Shell:** It is an environment in which we can run our commands, shell scripts, and programs. It is an interface between user and kernel that hides all complexities of functions of the kernel from the user. It is used to execute commands. 

### What is BASH?
BASH (Bourne Again Shell) is basically a command language interpreter.

### What is Kernel?
A resource manager that acts as a bridge between hardware and software. Its main role is to manage hardware resources for users and is generally used to provide an interface for user-level interaction. A kernel is the first program that is loaded whenever a computer system starts. It is also referred to as low-level system software.

Main functions include:
* Memory Management
* Process Management
* Device Management
* Storage Management
* Manage access, and use of various peripherals that are connected to the computer.

### What are two types of Linux User Mode?
Command Line & GUI

### What is swap space?
Swap space is space on the hard disk that is used when the amount of physical memory or RAM is full. It can be used as an extension of RAM by linux.

### What do you mean by a Process States in Linux?
Linux Process is a type of process that can be in a number of different states. The process enters these states from start till end. 

Process states in Linux are as follows:
* **New/Ready:** In this state, a new process is created and is ready to run.
* **Running:** In this state, the process is being executed.
* **Blocked/Wait:** In this state, the process is waiting for input from the user and if doesn't have resources to run such as memory, file locks, input, then it can remain in a waiting or blocked state.
* **Terminated/Completed:** In this state, the process has completed the execution or terminated by the OS.
* **Zombie:** Zombie Process, also referred to as a defunct or dead process in Linux, is a process that has finished the execution, but its entry remains in the process table. It usually happens due to a lack of correspondence between parent and child processes. This process occurs for the child process because the parent process needs to read the status of the child process.

### What is Linux Shell? What types of Shells are there in Linux?
Linux shell is a user interface present between user and kernel. Linux shell is basically a program used by users for executing commands. It accepts human-readable commands as input and converts them into kernel understandable language. 

Different types of shells are commonly used on typical Linux system as listed below: 
* BASH (Bourne Again Shell)
* CSH (C Shell)
* KSH (Korn Shell)
* TCSH
* ZSH
* Bourne Shell

### Name different types of modes used in VI editor.
VI editor (Visual Editor) is basically a default text editor that usually comes with most of the Linux OS. There are basically three types of modes used in VI editor as given below: 

* **Command Mode/Regular Mode:** It is the default mode for the vi editors. It is generally used to type commands that usually perform particular or specific vi functions. To enter this mode from another mode (Insert mode), one must press [esc]. In simple words, it lets you view the content.  
* **Insertion Mode/Edit Mode:** This mode allows you to do text editing, or type text into a file. To enter this mode from another mode (command mode), one must press [esc]. In simple words, it lets you delete or insert text or content. 
* **Ex Mode/Replacement Mode:** This mode is generally used to save the files and execution of the commands. It basically executes files with different parameters. To enter this mode, one must press [:]. In simple words, it lets you overwrite content or text.

### Name the file that is used to automatically mount file systems.
File that is used to automatically mount file systems is a Fstab file.

### What is LVM and why is it required?
LVM (Logical Volume Management) is basically a tool that provides logical volume management for the Linux kernel. It is being introduced simply to make physical storage device management easier. It also includes allocating disks, striping, mirroring, resizing logical volumes. Its main advantages are increased abstraction, flexibility, and control. It allows for flexible disk space management. It is especially required to resize the size of the file system online. In Linux, the size of the LVM partition can be extended using “lvextend” command and can be reduced using “lvreduce” commands, respectively.

### What is a “/proc” file system?
Proc file system is a pseudo or virtual file system that provides an interface to the kernel data structure. It generally includes useful information about processes that are running currently. It can also be used to change some kernel parameters at runtime or during execution. It is also regarded as a control and information center for the kernel. All files under this directory are named virtual files.

### What do you mean by the daemons?
Daemons also referred to as the background process, is a long-running Linux program that runs in the background. They do not have any controlling terminal, therefore, they run in the background. These are the processes that are generally started when the system is bootstrapped and terminate or end only when the system is shut down.

## What is the difference between cron and anacron?
Cron: It is a program in Linux that is used to execute tasks at a scheduled time. It works effectively on machines that run continuously. 

Anacron: It is a program in Linux that is used to execute tasks at certain intervals. It works effectively on machines that are powered off in a day or week. 

| Cron | Anacron |
| :--- | ---: |
|It is a daemon.|It is not a daemon. |
|It can be scheduled by any normal user. |It can only be used by super users.|
|It is considered ideal for servers. |It is considered ideal for desktops and laptops.|
|It expects the system to run 24*7|It does not expect the system to run 24*7|
|Its minimum granularity is in minutes.|Its minimum granularity is only in days|
|It is used to execute scheduled commands.|It is used to execute commands periodically.|

### What is load average in Linux?
Load average, as the name suggests, is the average system load on Linux servers being calculated over a given period of time. The load average of Linux servers can be found using “top” and “uptime” commands. It is simply used to keep track of system resources. It is represented by a decimal number starting at 0.00.  It tells you the load that the system has been under.

### What is INODE and Process Id?
**INODE:** It is a unique name given to each file by OS. Each inode has a unique inode number within a file system. It stores various information about files in Linux such as ownership, file size, file type, access mode, number of links, etc.  

**Process Id (Identifier):** It is a unique Id given to each process. It is simply used to uniquely identify an active process throughout the system until the process terminates. The first process started by the kernel in Linux is “init” and its process id is 1.

### Why /etc/resolv.conf and /etc/hosts files are used?
**/etc/resolv.conf:** It is used to configure DNS name servers as it contains the details of the nameserver i.e., details of your DNS server. The DNS server is then used to resolve the hostname of the IP address. 

**/etc/hosts:** It is used to map or translate any hostname or domain name to its relevant IP address.

### What are the advantages of using NIC teaming?
Network Bonding, also known as NIC Teaming, is a type of bonding that is used to connect multiple network interfaces into a single interface. It usually improves performance and redundancy simply by increasing network throughput and bandwidth. NIC (Network Interface Card) teaming has several advantages as given below: 
* Load Balancing  
* Failover  
* Increases uptime

### Name three standard streams in Linux.
Standard streams are basically I/O (Input and Output) communication channels between a program and its environment in Linux. Input and output in the Linux environment are distributed across three standard streams. Three standard streams in Linux are as follows:
* Standard Input (stdin)
* Standard Output (stdout)
* Standard Error (stderr)

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
| awk |  | pattern scanning and processing language; awk -F(DELIMITER) '{print $(FIELD_NUMBER)}' (FILE) |
| | -F | input field separator |
| apt | | package management system |
| | update | used to download package information from all configured sources |
| | upgrade | used to install available upgrades of all packages currently installed on the system |
| | install | installs a package |
| | remove | removes a package |
| | list --installed | list all the packages that have been installed on your system using the apt command and using the .deb files, as well as listing the packages installed as dependencies. |
| cat |  | concatenate files and print on the standard output |
| cut |  | remove sections from each line of files |
| cp | | copy |
| cd | | change directory |
| curl | | transfer a URL |
| clear | | clears the terminal history on the page |
| chmod | | change the permissions info |
| chown | | change the owner and group of a file |
|crontab | | maintain crontab files for individual users |
| | -e | used to edit the current crontab using the editor specified by the VISUAL or EDITOR environment variables |
| | -l | causes the current crontab to be displayed on standard output |
| df | | report file system disk space usage |
| | -h | human-readable, print sizes in powers of 1024 |
| dd | | covert and copy a file |
| deluser | | delete user|
| dig | | DNS lookup utility |
| du | | estimate file space usage |
| echo | | display a line of text |
| | -e | enable interpretation of backslash escapes |
| file | | determine file type |
| find | | search for files in a directory hierarchy |
| | -iname | the match is case insensitive |
| | -type f | search for files |
| | -type d | search for directories |
| free | | display amount of free and used memory in the system |
| | -h | show all output fields automatically scaled to shortest three digit unit and display the units of print out (B=bytes, K=kibibyts, M=mebibyte, G=gibibyte, T=tebibyte, P=pebibyte)
| grep  | | print lines matching a pattern |
|  | -R | read all files under each directory, recursively.  Follow all symbolic links |
| gzip |  | used to compress files |
| gunzip |  |  decompress files created by gzip, zip, compress, compress -H or packq |
| groupadd | | create a new group |
| hostname | | show or set the system's host name |
| history | | Display or manipulate the history list |
| ip | | show / manipulate routing, network devices, interfaces and tunnels |
| journal | | query the journal |
| | e | immediately jump to the end in the pager |
| | f | follow the journal |
| locate | | find files by name |
| logrotate | | rotates, compresses, and mails system logs |
| | -v | verbose |
| | -f | force outside of the normal cronjob |
| ls | | show directory contents, lists names of files |
| | -a | do not ignore entries starting with `.` |
| | -l | use a long listing format and shows permissions |
| | -h | with -l and -s, print sizes like 1K 234M 2G etc. |
| less |  |  Less is a program similar to more, but it has many more features.  Less does not have to read the entire input file before starting, so with large input files it starts up faster than text editors like vi |
| man | | an interface to the on-line reference manuals |
| mkdir | | make directories |
| mv | | move |
| mtr | | combines the functionality of the traceroute and ping programs in a single network diagnostic tool |
| more |  | a filter for paging through text one screenful at a time. |
| nslookup | | query Internet name servers interactively |
| nc | | arbitrary TCP and UDP connections and listens |
| pwd | | present working directory |
| read | | read a line from the standard input and split it into fields |
| su |  | allows to run commands with a substitute user and group ID |
| | -s | run shell if /etc/shells allows it |
| sudo | | allows a permitted user to execute a command as the super user |
| | -l | list user's privileges or check a specific command; use twice for longer format |
| systemctl | | query or send control commands to the system manager |
| | -t | list units of a particular type |
| sh |  | The shell is a command that reads lines from either a file or the terminal, interprets them, and generally executes other commands |
| sed |  | stream editor for filtering and transforming text |
| source | | read and execute commands from FILENAME in the current shell |
| tail | | output the last part of files q|
| tar | | an archiving utility |
| | -c | create an archive |
| | -v | verbose, prints progress status and other useful info |
| | -f | indicates the title |
| | -t | list contents |
| | -x | extract |
| | -z | filter the archive through gzip |
|  | -C | name of the directory to place the files |
|  | -W | validates the data |
| touch | | change file timestamps |
| top | |  display Linux processes |  
| usermod | | modify a user account |
| useradd | | create a new user or update default new user information |
| unzip | | unpacks `zip` archives |
| wget | | The non-interactive network downloader |
| wc | | print newline, word, and byte counts for each file |
| | -l | print the newline counts |
| whoami | | determines the current user |
| which | | searches through the directories that are defined in the $PATH environment variable for a given filename |
| visudo | | used to edit the sudoers file |
| vmstat | | report statistics of virtual memory |
| zip | | package and compress (archive) files |

## Reading the Synopsis Section
commands typically follow this format:

`program -options arguments`

The synopsis section usually gives some example use-cases. Sometimes sub-commands have different options, so several examples might be shown.
* Brackets `[]` always denote optional switches, arguments, options, etc.
* the pipe `|` means or, particularly when inside brackets or parenthesis.
* Brackets in brackets just means that the second part is dependent on the first, and also itself optional. Some switches you can use on their own or add a value to them. Commas at the start of a bracket would indicate there can be multiple comma separated values.
* They lean on Regex concepts, but are meant to be human readable so don't follow all the escaping rules etc.

### Regular Expressions (RegEx)
| Symbol | Description |
| :--- | --: |
| . | It is called a wild card character, It matches any one character other than the new line. |
| ^ | It matches the start of the string. |
| * | It matches up to zero or more occurrences i.e. any number of times of the character of the string. |
| \ | It is used for escape following character. |
| () | It is used to match or search for a set of regular expressions. |
| ? | It matches exactly one character in the string or stream. |

#### Bash Brace Expansion
Bash brace expansion is used to generate stings at the command line or in a shell script. The syntax for brace expansion consists of either a sequence specification or a comma separated list of items inside curly braces "{}". A sequence consists of a starting and ending item separated by two periods "..".

#### Escaping
Escaping is a method of quoting single characters. The escape `\` preceding a character tells the shell to interpret that character literally.

| Symbol | Description |
| :--- | --: |
| \n | newline |
| \r | return |
| \t | tab |
| \v | vertical tab |
| \b | backspace |
| \a | "alert" (beep or flash) |
| \0xx | translates to the octal ASCII equivalent of 0xx |
| \" | gives the quote its literal meaning | 
| \$ | gives the dollar sign its literal meaning (variable name following \$ will not be referenced) | 
| `\\` | gives the backslash its literal meaning |

#### Unix Shell - Understanding Variables
* `abc` - bare word\string that can be a variable name: abc=123
* `$abc` - reference to a variable called abc
* `${abc}` - string safe variable reference file_${abc}_name.txt
* `$(abc)` - run the command abc and use it's stdout in place of the $(abc)
* `($abc)` - run the command stored $abc in a subshell

#### Expanding Expressions
* Group commands in a sub-shell: ( )
    * (list)
        * Placing a list of commands between parentheses causes a subshell to be created, and each of the commands in list to be executed in that subshell, without removing non-exported variables.
        * Since the list is executed in a subshell, variable assignments do not remain in effect after the subshell completes.
        * Not to be confused with Command Substitution   $(command) Notice the dollar prefix, which tells the shell to substitute the output of the command into the main command.
* Group commands in the current shell: { }
    * { list; }
        * Placing a list of commands between curly braces causes the list to be executed in the current shell context. No subshell is created. The semicolon (or newline) following list is required.
        * In addition to the creation of a subshell, there is a subtle difference between these two constructs due to historical reasons. The braces are reserved words, so they must be separated from the list by blanks. The parentheses are operators, and are recognized as separate tokens by the shell even if they are not separated from the list by whitespace.
        * The exit status of both of these constructs is the exit status of list.
* Group commands in the current shell: { }
    * { list; }
        * Placing a list of commands between curly braces causes the list to be executed in the current shell context. No subshell is created. The semicolon (or newline) following list is required.
        * In addition to the creation of a subshell, there is a subtle difference between these two constructs due to historical reasons. The braces are reserved words, so they must be separated from the list by blanks. The parentheses are operators, and are recognized as separate tokens by the shell even if they are not separated from the list by whitespace.
        * The exit status of both of these constructs is the exit status of list.
* Test - return the binary result of an expression: [[ ]]
    * [[ expression ]]
        * Return a status of 0 or 1 depending on the evaluation of the conditional expression. Word splitting and filename expansion are not performed on the words between the [[ and ]]; tilde expansion, parameter and variable expansion, arithmetic expansion, command substitution, process substitution, and quote removal are performed.
        * When the == and != operators are used, pattern matching will be done on the string to the right of the operator.
        * The return value is 0 if the string matches or does not match the pattern, respectively, and 1 otherwise.
        * Any part of the pattern can be quoted to force it to be matched as a string.
* Arithmetic expansion
    * Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result.
        * The format for arithmetic expansion is:
            * $(( expression ))
        * The format for a simple Arithmetic Evaluation is:
            * (( expression ))
    * The expression is treated as if it were within double quotes, but a double quote inside the parentheses is not treated specially. All tokens in the expression undergo parameter expansion, command substitution, and quote removal. Arithmetic substitutions can be nested.
    * The exit status of arithmetic expressions are Success(0) / Fail (1) codes rather then the True (1) / False (0) which you might expect, so an expression like (( 2 > 4)) will return an exit code of 1
    * However if you set a variable to the results of an arithmetic expression that will be set to the more logical True (1) / False (0)
```
let "NUM = (( 2 > 4 ))"
echo $?
# 1
echo $NUM
# 0
```
* Shell variables can be used as operands:

```
TEST=STRING
STRING=3
echo $((TEST))
# 3
```
* Arithmetic operators e.g. (( DEMOVAR += 5 ))
```
  = Set Equal to
 *= Multiply
 /= divide
 %= Modulo
 += Add
 -= Subract
<<= bitwise shift left
>>= bitwise shift right
 &= bitwise AND
 ^= bitwise XOR
 |= bitwise NOT
 ```
* Comparison operators e.g. (( DEMOVAR == 5 ))
```
== Test Equality
!= Test Inequality
 < Less than
 > Greater than
<= Less than or equal
>= Greater than or equal
```
* Combine multiple expressions
Expressions can be combined using the following operators, listed in decreasing order of precedence:
| operator | definition |
| :--- | ---: |
| ( expression ) | Returns the value of expression. This can be used to override the normal precedence of operators. |
| ! expression | Logical NOT, True if expression is false. |
| (( expr1 && expr2 )) | Logical AND |
| (( expr1 || expr2 )) | Logical OR |
| (( expr1 | expr2 )) | Bitwise OR |

The && and || commands do not execute expression2 if the value of expression1 is sufficient to determine the return value of the entire conditional expression. If the expression is invalid, Bash prints a message indicating failure to the standard error and no substitution occurs.

Logical operators operate on logical values, while bitwise operators operate on integer bits.

`if x and y: # logical operation`

`z = z & 0xFF # bitwise operation`

### Reading `ls -l`
When using the list permission option you will see a printout like:

`drwxrwxrwx 1 root root     512 May 24 11:32  Documents/`

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

### Important etc files
* hosts: This file contains the mappings of IP addresses to host names

## What do the directory colors mean?
The colours from ls are as follows:

* **Blue:** Directory
* **Green:** Executable or recognized data file
* **Sky Blue:** Link
* **Yellow (black background):** Device file
* **Pink:** Graphics image file
* **Red:** File Archive

## Sudoers
All=ALL:ALL ALL
* The first ALL is the users allowed
* The second one is the hosts
* The third one is the user as you are running the command
* The last one is the commands allowed

## cron
A system daemon that keeps track of when to run scheduled tasks. The general syntax for a crontab is: `minute hour day-of-month month day-of-week [user] command`

The time and date fields are:
| Field | Allowed Values |
| :---- | -------: |
| minute | 0-59 |
| hour | 0-23 |
| day of month | 0-31 |
| month | 0-12 (or names, see below) |
| day of week | 0-7 (0 or 7 is Sun, or use names) |

A  field  may  be an asterisk (*), which always stands for first-last.

Ranges of numbers are allowed. Ranges  are  two  numbers separated  with  a  hyphen.  The specified range is inclusive.  For example, 8-11 for an 'hours' entry specifies execution at hours 8, 9, 10 and 11.

Lists are allowed.  A list is a set of numbers (or ranges) separated by commas.  Examples: '1,2,5,9' '0-4,8-12'.

Step values can be used in conjunction with ranges.  Following a range with '/<number>' specifies skips  of  the number's value through the range.  For example, ``0-23/2'' can be used in the hours field to specify  command  execution  every other hour (the alternative in the V7 standard is ``0,2,4,6,8,10,12,14,16,18,20,22'').   Steps  are  also permitted after an asterisk, so if you want to say ``every two hours'', just use ``*/2''.

Names can also be used for the ``month''  and  ``day  of week'' fields.  Use the first three letters of the particular day or month (case doesn't matter).  Ranges or  lists of names are not allowed. The  ``sixth''  field (the rest of the line) specifies the command to be run.  The  entire  command  portion  of  the line,  up to a newline or % character, will be executed by /bin/sh or by the shell specified in the SHELL variable of the  cronfile.   Percent-signs  (%) in the command, unless escaped with backslash (\), will be changed  into  newline characters, and all data after the first % will be sent to the command as standard input.

 > Note: The day of a command's execution can be specified by two  fields  --  day  of  month, and day of week.  If both fields are restricted (ie, aren't *), the command will be run when either field matches the current time.  For example, ``30 4 1,15 * 5'' would cause a command to be run at  4:30am on the 1st and 15th of each month, plus every Friday.

## Cyber Programs
### Lynis (Auditing)
A security scanner used to scan a machine for vulnerabilities. It generates and saves a report of its findings for administrators to review.

## Other Helpful Tools
### Installs
* iperf - `sudo apt install iptraf` : generates traffic to measure bandwidth

### How to Show Asterisks While Typing Sudo Password in Linux+
* `sudo cp /etc/sudoers /etc/sudoers.bak`
    * You can enable the password feedback feature in /etc/sudoers file, but first create a backup of the file
* `sudo visudo`
* Search for the following line. `Defaults env_reset`
* And append pwfeedback to it, so that it looks like this. `Defaults env_reset,pwfeedback`

### Auditd
auditd is the userspace component to the Linux Auditing System. It's responsible for writing audit records to the disk. Viewing the logs is done with  the  ause‐arch  or  aureport  utilities.

| command | options | definition |
| :---- | :----: | ----: | 
| auditctl |  | a utility to assist controlling the kernel's audit system |
|  | -l | list rules |
|  | -w | write |
| aureport | | a tool that produces summary reports of audit daemon logs |
| | -m | modifications |
| | -p | Report about processes |
| | -k | Report about audit rule keys |

### chkrootkit
chkrootkit examines certain elements of the target system and determines whether they have been tampered with.

| options | definition |
| :--- | --: |
| -x | Enter expert mode. |

### john
john, better known as John the Ripper, is a tool to find weak passwords of users in a server

john [options] password-files

To see the cracked passwords, use john -show passwd

### fping
fping differs from ping in that you can specify any number of targets on the command line, or specify a file containing the lists of targets to ping.

| options | definitions |
| :-- | --: |
| -g | Generate a target list from a supplied IP netmask, or a starting and ending IP. |

### nmap
Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing.

| options | definitions |
| :-- | --: |
| -sS | TCP SYN Scan |