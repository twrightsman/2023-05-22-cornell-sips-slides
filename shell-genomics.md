---
title: 'Introduction to the Command Line for Genomics'
author: 'Data Carpentries'
date: 'May 22 / Jun 12'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

## Course material is available for later reference

https://twrightsman.github.io/shell-genomics

::: {.notes}
- not recommended to open now
- don't worry about writing down everything
- focus on understanding
:::

# Summary

## GUI vs. CLI

::: {.incremental}
- GUI = graphical user interface
  - web browser, office suite, etc
- CLI = command line interface
  - shell (_e.g._ `bash`, `zsh`, PowerShell, ...)
:::

# Introducing the Shell

## Objectives

::: {.incremental}
- Describe key reasons for learning shell.
- Navigate your file system using the command line.
- Access and read help files for bash programs and use help files to identify useful command options.
- Demonstrate the use of tab completion, and explain its advantages.
:::

## What is a shell...

```
[user@computer:~]$
```

A program that lets you control your computer using commands entered
with a keyboard.

::: {.notes}
- as opposed to a GUI which you control with keyboard + mouse +
  touchscreen
- discuss the pieces of the prompt
    - they can take many forms depending on settings
:::

## ...and why should I care?

::: {.incremental}
- Many bioinformatics tools have no GUI
    - those that do have more advanced features in CLI
- Automate repetitive tasks
    - rename lots of files
    - run same command with many different parameters
    - reduces human error
- Increases reproducibility by having an exact record of what was done
- Using powerful remote computers typically requires a CLI
:::

## How to access the shell

::: {.incremental}
- MacOS/Linux: "Terminal" application
- Windows: Windows Subsystem for Linux (WSL)
    - Command Prompt `cmd.exe` is different!
:::

::: {.notes}
- explain that JupyterHub we are using is running on Linux
:::

## Filesystems

:::: {.columns}
::: {.column width="33%"}
Windows

```
C:
├── Program Files
├── Users
│   ├── Administrator
│   ├── Public
│   └── ...
└── ...
D:
E:
```
:::
::: {.column width="33%"}
MacOS

```
/
├── Applications
├── Library
├── Users
│   ├── User1
│   └── ...
└── ...
```
:::
::: {.column width="33%"}
Linux

```
/
├── bin
├── etc
├── home
│   ├── user1
│   └── ...
└── ...
```
:::
::::

Organize files and folders into a tree structure.

## Live demo

Off to JupyterHub 🚀

## Exercise: Long `ls`

Use the `-l` option for the `ls` command to display more information
for each item in the directory.

What is one piece of additional information this long format gives you
that you don’t see with the bare `ls` command?

. . .

```
$ ls -l
total 8
drwxr-x--- 2 dcuser dcuser 4096 Jul 30  2015 sra_metadata
drwxr-xr-x 2 dcuser dcuser 4096 Nov 15  2017 untrimmed_fastq
```

## Key points

::: {.incremental}
- The shell lets you work more efficiently using the keyboard rather than a GUI
- Some commands for navigating your file system: `ls`, `pwd`, and `cd`
- Most commands can take options (a.k.a. "flags") which begin with `-`
- Tab completion can reduce errors and speed things up significantly
:::

# Navigating Files and Directories

## Objectives

::: {.incremental}
- Use a single command to navigate multiple steps in your directory structure, including moving backwards (one level up).
- Perform operations on files in directories outside your working directory.
- Work with hidden directories and hidden files.
- Interconvert between absolute and relative paths.
- Employ navigational shortcuts to move around your file system.
:::

## Exercise: Finding Hidden Directories

There is a hidden directory within `shell_data`.
Explore the options of `ls` to find out how to list its contents.

Hint: Hidden files and directories start with `.` on Unix (MacOS/Linux).

**What is the name of the text file in that hidden directory?**

. . .

```
$ man ls
$ ls -a shell_data
.  ..  .hidden  sra_metadata  untrimmed_fastq
$ ls shell_data/.hidden
youfoundit.txt
```

## Exercise: Navigating Practice

Navigate to your home directory.
From there, list the contents of the `untrimmed_fastq` directory.

. . .

```
$ cd
$ ls shell_data/untrimmed_fastq/
SRR097977.fastq  SRR098026.fastq
```

## Exercise: Relative Path Resolution

Using the filesystem diagram below, if pwd displays `/Users/thing`, what will `ls ../backup` display?

1. `../backup: No such file or directory`
2. `2012-12-01 2013-01-08 2013-01-27`
3. `2012-12-01/ 2013-01-08/ 2013-01-27/`
4. `original pnas_final pnas_sub`

![](media/filesystem-challenge.svg)

. . .

4 is correct! `../backup` refers to `/Users/backup`.

## Key points

::: {.incremental}
- The `/`, `~`, and `..` characters represent important navigational shortcuts
- Hidden files and directories start with `.` and can be viewed using `ls -a`
- Relative paths specify a location starting from the working
  directory, while absolute paths specify a location starting from the
  root of the file system.
:::

# Working with Files and Directories

## Objectives

::: {.incremental}
- View, search within, copy, move, and rename files. Create new directories.
- Use wildcards (`*`) to perform operations on multiple files.
- Make a file read only.
- Use the history command to view and repeat recently used commands.
:::

## Exercise: Wildcards

Do each of the following tasks from your current directory using a single `ls` command for each:

1. List all of the files in `/usr/bin` that start with the letter ‘c’.
2. List all of the files in `/usr/bin` that contain the letter ‘a’.
3. List all of the files in `/usr/bin` that end with the letter ‘o’.

Bonus: List all of the files in `/usr/bin` that contain the letter ‘a’ or the letter ‘c’.

Hint: The bonus question requires a Unix wildcard that we haven’t talked about yet.
Try searching the internet for information about Unix wildcards to find what you need to solve the bonus problem.

## Exercise: Wildcards

1. `ls /usr/bin/c*`
2. `ls /usr/bin/*a*`
3. `ls /usr/bin/*o`

Bonus: `ls /usr/bin/*[ac]*`

## Exercise: `echo`

`echo` is a shell command that writes its arguments to the shell's output.
It also works with wildcards.

```
$ echo *.fastq
SRR097977.fastq SRR098026.fastq
```

Notice the output of `echo *.fastq` is the same as `ls *.fastq`.

What if the wildcard could not be matched?

**Compare the outputs of** `echo *.missing` **and** `ls *.missing`.

## Exercise: `echo`

```
$ echo *.missing
*.missing
$ ls *.missing
ls: cannot access '*.missing': No such file or directory
```

## Exercise: Replaying History

Find the line number in your history for the command that listed all the .sh files in `/usr/bin`.

Rerun that command.

## Exercise: Viewing File Contents

1. Print out the contents of the `~/shell_data/untrimmed_fastq/SRR097977.fastq` file.
   What is the last line of the file?
2. From your home directory, and without changing directories, use one short command to print the contents of all of the files in the `~/shell_data/untrimmed_fastq` directory.

. . .

1. The last line of the file is `C:CCC::CCCCCCCC<8?6A:C28C<608'&&&,'$`
2. `cat ~/shell_data/untrimmed_fastq/*`

## Exercise: Searching with `less`

What are the next three nucleotides (characters) after the first instance of the sequence `TTTTT`?

. . .

`CAC`

## FASTQ format

 Line  Description
------ ------------
 1      Always begins with ‘@’ and then information about the read
 2      The actual DNA sequence
 3      Always begins with a ‘+’ and sometimes the same info in line 1
 4      Has a string of characters which represent the quality scores<br>Must have same number of characters as line 2

. . .

```
Quality encoding: !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJK
                  |         |         |         |         |
Quality score:    0........10........20........30........40..
```

. . .

$$Q = -10 \log_{10} P$$

10 = 90%, 20 = 99%, etc...

## UNIX file permissions

![](media/rwx_figure.svg)

## Exercise: Write-protecting files

Starting in the `shell_data/untrimmed_fastq/` directory, do the following:

1. Make sure that you have deleted your backup directory and all files it contains.
2. Create a backup of each of your FASTQ files using `cp`.
3. Use a wildcard to move all of your backup files to a new backup directory.
4. Change the permissions on all of your backup files to be write-protected.

Hint: You may need to look at `man cp` and `man mv` for instructions on how to use these commands with wildcards.

. . .

```
$ rm -r backup
$ cp SRR098026.fastq SRR098026-backup.fastq
$ cp SRR097977.fastq SRR097977-backup.fastq
$ mkdir backup
$ mv *-backup.fastq backup
$ chmod -w backup/*-backup.fastq
$ ls -l backup
-r--r--r-- 1 dcuser dcuser 47552 Nov 15 23:06 SRR097977-backup.fastq
-r--r--r-- 1 dcuser dcuser 43332 Nov 15 23:06 SRR098026-backup.fastq
```

## Key points

::: {.incremental}
- You can view file contents using `less`, `cat`, `head` or `tail`.
- The commands `cp`, `mv`, and `mkdir` are useful for manipulating existing files and creating new directories.
- You can view file permissions using `ls -l` and change permissions using `chmod`.
- The `history` command and the up arrow on your keyboard can be used to repeat recently used commands.
:::

# Redirection

## Objectives

::: {.incremental}
- Employ the `grep` command to search for information within files.
- Print the results of a command to a file.
- Construct command pipelines with two or more stages.
- Use `for` loops to run the same command for several input files.
:::

## Exercise

1. Search for the sequence `GNATNACCACTTCC` in the `SRR098026.fastq`
   file. Have your search return all matching lines and the name (or
   identifier) for each sequence that contains a match.
2. Search for the sequence AAGTT in both FASTQ files. Have your search
   return all matching lines and the name (or identifier) for each
   sequence that contains a match.
   
. . .

```
$ grep -B1 GNATNACCACTTCC SRR098026.fastq
@SRR098026.245 HWUSI-EAS1599_1:2:1:2:801 length=35
GNATNACCACTTCCAGTGCTGANNNNNNNGGGATG
$ grep -B1 AAGTT *.fastq
SRR097977.fastq-@SRR097977.11 209DTAAXX_Lenski2_1_7:8:3:247:351 length=36
SRR097977.fastq:GATTGCTTTAATGAAAAAGTCATATAAGTTGCCATG
--
SRR097977.fastq-@SRR097977.67 209DTAAXX_Lenski2_1_7:8:3:544:566 length=36
SRR097977.fastq:TTGTCCACGCTTTTCTATGTAAAGTTTATTTGCTTT
--
...
```

## Exercise

How many sequences are there in SRR098026.fastq?

Remember that every sequence is formed by four lines.

. . .

```
$ wc -l SRR098026.fastq
996
```

## Exercise

How many sequences in `SRR098026.fastq` contain at least 3 consecutive Ns?

. . .

```
$ grep NNN SRR098026.fastq > bad_reads.txt
$ wc -l bad_reads.txt
```

## Exercise

Print the file prefix of all of the `.txt` files in our current directory.

. . .

```
$ for filename in *.txt
> do
> name=$(basename ${filename} .txt)
> echo ${name}
> done
```

## Exercise

Remove `_2019` from all of the `.txt` files.

```
$ for filename in *_2019.txt
> do
> name=$(basename ${filename} _2019.txt)
> mv ${filename} ${name}.txt
> done
```

## Key points

::: {.incremental}
- `grep` is a powerful search tool with many options for customization.
- `>`, `>>`, and `|` are different ways of redirecting output.
- `command > file` redirects a command’s output to a file.
- `command >> file` redirects a command’s output to a file without overwriting the existing contents of the file.
- `command_1 | command_2` redirects the output of the first command as input to the second command.
- `for` loops are used for iteration.
- `basename` gets rid of repetitive parts of names.
:::

# Writing Scripts and Working with Data

## Objectives

::: {.incremental}
- Use the `nano` text editor to modify text files.
- Write a basic shell script.
- Use the `bash` command to execute a shell script.
- Use `chmod` to make a script an executable program.
:::

## Exercise: Modifying README

Open `README.txt` and add the date to the top of the file and save the file.

. . .

Use `nano README.txt` to open the file.
Add today’s date and then use **Ctrl+X** followed by **y** and **Enter** to save.

## Exercise: Notify when done

We want the script to tell us when it’s done.

1. Open `bad-reads-script.sh` and add the line `echo "Script finished!"`
   after the `grep` command and save the file.
2. Run the updated script.

. . .

```
$ bash bad-reads-script.sh
Script finished!
```

## Key points

::: {.incremental}
- Scripts are a collection of commands executed together.
- `wget` and `curl` can be used to download data to your computer using the shell.
:::

# Feedback

## Minute cards

- Example positive prompts
    - One thing you liked about this section of the workshop
	- The most important thing you learned today
	- A new skill, command, or technique you are most excited about using
- Example constructive prompts
    - One thing you did not like or would change about this section of the workshop
	- One thing that is confusing / you would like clarification on
	- One question you have

## One Up, One Down
