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
| -eq |	Returns true if two numbers are equivalent |
| -lt | Returns true if a number is less than another number |
| -gt | Returns true if a number is greater than another number |
| == | Returns true if two strings are equivalent |
| != | Returns true if two strings are not equivalent |
| !	| Returns true if the expression is false |
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

#### Links
* https://www.howtogeek.com/68563/HTG-EXPLAINS-WHAT-ARE-THE-DIFFERENCES-BETWEEN-LINUX-SHELLS/
* https://www.educba.com/variables-in-shell-scripting/
* https://linuxhint.com/bash_conditional_statement/
* 