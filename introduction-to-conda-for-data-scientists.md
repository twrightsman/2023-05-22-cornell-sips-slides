---
title: 'Introduction to Conda for (Data) Scientists'
author: 'Carpentries Incubator'
date: 'Summer 2023'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

# Getting Started with Conda

## Objectives

::: {.incremental}
- Understand why you should use a package and environment management
  system as part of your (data) science workflow.
- Explain the benefits of using Conda as part of your (data) science
  workflow.
:::

## Packages

```python
# standard library packages/libraries
import os

# third-party packages/libraries
import numpy
import pandas
```

Python only comes with the "standard library".

Third-party packages have to be installed separately.

## Dependencies

::: {.incremental}
- Packages depend on other packages
- SciPy does not re-implement matrices, _depends on_ NumPy
    - also depends on matplotlib for plotting functionality
    - ggplot2 depends on tibble, another tidyverse package
- Many packages are being continually developed
    - Packages may need a certain minimum version of a dependency for specific functionality
:::

::: {.notes}
- myFavPlotLib added pie charts in v1.2 and you need pie charts
    - can't use myFavPlotLib v1.1
:::

## Package management

A good package manager does primarily two things:

1. identifying and installing compatible versions of software and all
   required dependencies
2. handling the process of updating software as more recent versions
   become available

. . .

Ubuntu and Debian use `apt`. MacOS can use `brew`, but like Windows it
does not have a built-in operating system package manager.

. . .

Python has many package managers: `pip`, `poetry`, and others...

. . .

Usually we don't want to mess up operating system-level packages, just
install software for our specific current project.

## Environments

::: {.incremental}
- When starting out, you can usually get away with the latest version of everything
- What if you need to run an older tool that doesn't work with the latest?
    - ...yet your scripts rely on new functionality
- In the extreme case, you could use two computers...
    - ...but a more lightweight solution are _environments_
- Software installed into one environment is isolated from other environments
    - `module load` on HPC?
- One environment for the older tool, one environment for your awesome
  research scripts
:::

## Environment management {transition="none-out"}

An environment manager solves many problems:

::: {.incremental}
- An application you need for a research project requires different
  versions of your base programming language or different versions of
  various third-party packages from the versions that you are
  currently using.
- An application you developed as part of a previous research project
  that worked fine on your system six months ago now no longer works.
- Code that was written for a joint research project works on your
  machine but not on your collaborators’ machines.
- An application that you are developing on your local machine doesn’t
  provide the same results when run on your remote cluster (or a
  different OS).
:::

## Environment management {transition="none-in"}

An environment management system enables you to set up a new, project
specific software environment containing specific Python/R/etc
versions as well as the versions of additional packages and required
dependencies that are all mutually compatible.

::: {.incremental}
- Environment management systems help resolve dependency issues by
  allowing you to use different versions of a package for different
  projects.
- Make your projects self-contained and reproducible by capturing all
  package dependencies in a single requirements file.
- Allow you to install packages on a host on which you do not have
  admin privileges.
:::

## Why should I use a package/environment manager?

Installing software system-wide has major drawbacks:

::: {.incremental}
1. It is often impossible to install different versions of the same
   software package at the same time.
2. Updating software required for one project can often “break” the
   software installed for another project.
:::

. . .

All of these can and have caused major headaches for researchers...

## Discussion

In the Etherpad, let's discuss the following prompt:

> What are some of the _potential_ benefits from installing software separately for each project? What are some of the _potential_ costs?

. . .

::: {.incremental}
- Some of the benefits may rely on _being able to separate software into environments_.
- Once you have isolated environments, you need to _manage the packages within them_.
- Two complementary problems: environment management and package management.
:::

## Conda

Conda is an open source **package and environment management** system that runs on Windows, Mac OS and Linux.

::: {.incremental}
- Conda can quickly install, run, and update packages and their
  dependencies.
- Conda can create, save, load, and switch between project specific
  software environments on your local computer.
- Although Conda was created for Python programs, Conda can package
  and distribute software for any language such as R, Ruby, Lua,
  Scala, Java, JavaScript, C, C++, FORTRAN.
:::

## Conda vs. Miniconda vs. Anaconda

![](media/miniconda_vs_anaconda.png){.r-stretch}

## Key points

::: {.incremental}
- Conda is a platform agnostic, open source package and environment
  management system.
- Using a package and environment management tool facilitates
  portability and reproducibility of (data) science workflows.
- Conda solves both the package and environment management problems
  and targets multiple programming languages. Other open source tools
  solve either one or the other, or target only a particular
  programming language.
- (Ana)conda is not only for Python.
:::

# Working with Environments

## Objectives

::: {.incremental}
- Understand how Conda environments can improve your research workflow.
- Create a new environment.
- Activate (deactivate) a particular environment.
- Install packages into existing environments using Conda.
- Specify the installation location of an environment.
- List all of the existing environments on your machine.
- List all of the installed packages within a particular environment.
- Delete an entire environment.
:::

## What is a Conda environment?

A directory that contains a specific collection of Conda packages.

For example: NumPy 1.20, matplotlib 3.5, and Python 3.9.

You can change the active Conda environment as needed.

. . .

**(!)** Avoid changing the `base` environment.

## Live demo

Off to JupyterHub 🚀

## Exercise: Creating a new environment

Create a new environment called “machine-learning-env” with Python and
the most current versions of IPython, Matplotlib, Pandas, Numba and
Scikit-Learn.

. . .

```
$ conda create --name machine-learning-env \
  ipython \
  matplotlib \
  pandas \
  python \
  scikit-learn \
  numba
```

## Exercise: Activate an existing environment by name

Activate the `machine-learning-env` environment created in the previous challenge by name.

. . .

```
(base) $ conda activate machine-learning-env
(machine-learning-env) $
```

## Exercise: Deactivate the active environment

Deactivate the `machine-learning-env` environment that you activated in the previous challenge.

**Bonus:** Try to import `numba` when the `machine-learning-env`
environment is active and when it is not active. What do you see?

. . .

```
(active-environment-name) $ conda deactivate
(base) $
```

## Exercise: Installing a package into a specific environment

Have a read through the official documentation for the `conda install`
command and see if you can figure out how to install Dask into the
machine-learning-env that you created in the previous challenge.

Hint: You can either search online or use the help flag to `conda install`.

. . .

You can install Dask into `machine-learning-env` using the `conda install` command as follows.

```
$ conda install --name machine-learning-env dask=2.16
```

You could also install Dask into `machine-learning-env` by first activating that environment and then using the `conda install` command.

```
$ conda activate machine-learning-env
$ conda install dask=2020.12
```

## Exercise: Creating a new environment as a sub-directory within a project directory

First create a project directory called project-dir using the following command.

```
$ mkdir project-dir
$ cd project-dir
```

Next, create a new environment inside the newly created `project-dir` in a sub-directory called `env` and install Python 3.6, version 3.1 of Matplotlib, and version 2.0 of TensorFlow.

. . .

```
$ conda create --prefix ./env \
  python=3.6 \
  matplotlib=3.1 \
  tensorflow=2.0
```

## Exercise: R dependencies with Conda

First create a project directory called `r-project-dir` using the
following command.

```
$ cd ~/Desktop/introduction-to-conda-for-data-scientists
$ mkdir r-project-dir
$ cd r-project-dir
```

Next, take a look through the list of R packages available by default
for installation using Conda. Create a new environment inside the
newly created `r-project-dir` in a sub-directory called `env` and
install `r-base`, `r-tidyverse` and `r-sparklyr`.

. . .

```
$ conda create --prefix ./env \
> r-base \
> r-tidyverse \
> r-sparklyr \
```

## Exercise: Listing packages in an environment

List the packages installed in the `machine-learning-env` environment
that you created in a previous challenge.

. . .

```
$ conda list --name machine-learning-env
```

or

```
$ conda activate machine-learning-env
$ conda list
```

## Exercise: Delete an entire environment

Delete the entire “basic-scipy-env” environment.

. . .

```
$ conda remove --name basic-scipy-env --all
```

## Key points

::: {.incremental}
- A Conda environment is a directory that contains a specific collection of Conda packages that you have installed.
- You create (remove) a new environment using the `conda create` (`conda remove`) commands.
- You activate (deactivate) an environment using the `conda activate` (`conda deactivate`) commands.
- You install packages into environments using `conda install`.
- Use the `conda env list` command to list existing environments and their respective locations.
- Use the `conda list` command to list all of the packages installed in an environment.
:::
