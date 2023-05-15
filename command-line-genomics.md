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

## Questions

::: {.incremental}
- What is a command shell and why would I use one?
- How can I move around on my computer?
- How can I see what files and directories I have?
- How can I specify the location of a file or directory on my computer?
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

## Live demo

Off to JupyterHub 🚀

## Key points

::: {.incremental}
- The shell lets you work more efficiently using the keyboard rather than a GUI
- Some commands for navigating your file system: `ls`, `pwd`, and `cd`
- Most commands can take options (a.k.a. "flags") which begin with `-`
- Tab completion can reduce errors and speed things up significantly
:::

# Navigating Files and Directories

## Questions

::: {.incremental}
- How can I perform operations on files outside of my working directory?
- What are some navigational shortcuts I can use to make my work more efficient?
:::

## Live demo

Off to JupyterHub 🚀

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

## Live demo

Off to JupyterHub 🚀

## Exercise: Navigating Practice

Navigate to your home directory.
From there, list the contents of the `untrimmed_fastq` directory.

. . .

```
$ cd
$ ls shell_data/untrimmed_fastq/
SRR097977.fastq  SRR098026.fastq
```

## Live demo

Off to JupyterHub 🚀

## Exercise: Relative Path Resolution

Using the filesystem diagram below, if pwd displays `/Users/thing`, what will `ls ../backup` display?

1. `../backup: No such file or directory`
2. `2012-12-01 2013-01-08 2013-01-27`
3. `2012-12-01/ 2013-01-08/ 2013-01-27/`
4. `original pnas_final pnas_sub`

![](media/filesystem-challenge.svg)

. . .

4 is correct! `../backup` refers to `/Users/backup`.

## Live demo

Off to JupyterHub 🚀

## Key points

::: {.incremental}
- The `/`, `~`, and `..` characters represent important navigational shortcuts
- Hidden files and directories start with `.` and can be viewed using `ls -a`
- Relative paths specify a location starting from the working
  directory, while absolute paths specify a location starting from the
  root of the file system.
:::
