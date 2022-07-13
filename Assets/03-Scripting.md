# Bash Scripting

|`>`| create or overwrite |
|`>>`| append |
|`|`| taking the output of one command and adding it to another |
|`;`| running the next command without relying on the others |
|`&&`| only run if previous command succeeds |

`;` - a command that might have a faulty fail that you'd like to ignore (say you're creating a director that's already created)

## Bash Conditional Statement

Two types of conditional statements can be used in bash. These are, ‘If’ and ‘case’ statements. ‘If’ statements can be used to check the conditions in multiple ways. Many variations of ‘if’ statements are described in this tutorial. ‘case’ statement is used as an alternative to ‘if’ statement. But, some specific conditions can be checked only by using ‘case’ statement and it doesn’t support various conditions like ‘if’ statement. All bourbons are whisky but not all whiskeys are bourbon. So, any task done by ‘case’ statement can be done easily by ‘if’ statement, but ‘case’ statement can’t be used for all types of the task done by ‘if’ statement.

* if statement
* if else statement
* if elif statement
* Nested if statement
* case statement

### Conditional operators

|Operator | Description |
| :--- | ---: |
| -eq | Returns true if two numbers are equivalent |
| -lt | Returns true if a number is less than another number |
| -gt | Returns true if a number is greater than another number |
| == | Returns true if two strings are equivalent |
| != | Returns true if two strings are not equivalent |
| ! | Returns true if the expression is false |
| -d | Check the existence of a directory |
| -e | Check the existence of a file |
| -r | Check the existence of a file and read permission |
| -w | Check the existence of a file and write permission |
| -x | Check the existence of a file and execute permission |

```sh
if [ condition ] ; then
Command(s)
fi
```

## Powershell

Cmdlets − Cmdlets perform common system administration tasks, for example managing the registry, services, processes, event logs, and using Windows Management Instrumentation (WMI).

Task oriented − PowerShell scripting language is task based and provide supports for existing scripts and command-line tools.

Consistent design − As cmdlets and system data stores use common syntax and have common naming conventions, data sharing is easy. The output from one cmdlet can be pipelined to another cmdlet without any manipulation.

Simple to Use − Simplified, command-based navigation lets users navigate the registry and other data stores similar to the file system navigation.

Object based − PowerShell possesses powerful object manipulation capabilities. Objects can be sent to other tools or databases directly.

Extensible interface. − PowerShell is customizable as independent software vendors and enterprise developers can build custom tools and utilities using PowerShell to administer their software.

## Variables

PowerShell variables are named objects. As PowerShell works with objects, these variables are used to work with objects.

Use a '$' to create a variable.

```ps1
$variable = [command]
```

From that session on you'll be able to uses the $variable as a command to invoke the command.

## Looping

A loop statement allows us to execute a statement or group of statements multiple times and following is the general form of a loop statement in most of the programming languages

for loop:
    Execute a sequence of statements multiple times and abbreviates the code that manages the loop variable.

forEach loop:
    Enhanced for loop. This is mainly used to traverse collection of elements including arrays.

```Powershell
$declaredVariable = Get-ChildItem .

foreach ($object in $declaredVariable){
    Write-Host $object
}
```

while loop:
    Repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body.

do...while loop:
    Like a while statement, except that it tests the condition at the end of the loop body.

### Links

* <https://www.howtogeek.com/68563/HTG-EXPLAINS-WHAT-ARE-THE-DIFFERENCES-BETWEEN-LINUX-SHELLS/>
* <https://www.educba.com/variables-in-shell-scripting/>
* <https://linuxhint.com/bash_conditional_statement/>

*
