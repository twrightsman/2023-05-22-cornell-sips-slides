---
title: 'Introduction to Conda for (Data) Scientists'
author: 'Carpentries Incubator'
date: 'Summer 2023'
theme: 'white'
navigationMode: 'linear'
width: 1920
height: 1080
---

## Course material is available for later reference

https://twrightsman.github.io/introduction-to-conda-for-data-scientists

Link is in the course website schedule.

::: {.notes}
- not recommended to open now
- don't worry about writing down everything
- focus on understanding
:::

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

`source /opt/tljh/user/bin/activate`

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

# Using Packages and Channels

## Objectives

::: {.incremental}
- Understand Conda packages and channels.
- Install packages from specific channels.
- Understand why being explicit with channel selection is important.
- Be able to install Python (and R) packages not in Conda into a Conda environment.
:::

## What is a Conda package?

A compressed archive file (think `.zip`) of a specific software.

. . .

More specifically, it includes things like:

::: {.incremental}
1. The executable programs of that software (_e.g._ `bash` or `nano`)
2. The libraries/modules of that software
3. Metadata describing the package (name, author, version, etc)
:::

## Conda Package structure

Example of a PyTorch 1.1 Conda package.

```
.
├── bin
│   └── convert-caffe2-to-onnx
│   └── convert-onnx-to-caffe2
├── info
│   ├── LICENSE.txt
│   ├── about.json
│   ├── files
│   ├── git
│   ├── has_prefix.json
│   ├── hash_input.json
│   ├── index.json
│   ├── paths.json
│   ├── recipe/
│   └── test/
└── lib
    └── python3.6
        └── site-packages
            ├── caffe2/
            ├── torch/
            └── torch-1.1.0-py3.6.egg-info/
```

. . .

Note this does not have any of PyTorch's dependencies.
Those are in their own Conda packages.

## What are Conda channels?

::: {.incremental}
- A Conda package is associated with a specific channel.
- The default channels include the `main` Anaconda channel and others
  managed by Anaconda
- `conda-forge` is a big channel that replaces `main`
- `bioconda` has biology-specific packages like `BioPython`
    - packages in `bioconda` depend on `conda-forge` packages
:::

## `conda-forge`

You might want to use `conda-forge` over `main` for a few reasons:

1. Packages in `conda-forge` are usually more up-to-date than in `main`
2. `conda-forge` has many packages not in `main`
3. `conda-forge` prioritizes open-source dependencies
4. `conda-forge` is maintained by a large community, instead of a single entity

## Exercise: Using the `pytorch` channel

Like many projects, PyTorch has its own channel on Anaconda
Cloud. This channel has several interesting packages, in particular
`pytorch` (PyTorch core) and `torchvision` (datasets, transforms, and
models specific to computer vision).

Create a new directory called `my-computer-vision-project` and then
create a Python 3.6 environment in a sub-directory called `env/` with
the two packages listed above. Also include the most recent version of
`jupyterlab` in your environment (so you have a nice UI) and
`matplotlib` (so you can make plots).

. . .

```
$ mkdir my-computer-vision-project
$ cd my-computer-vision-project/
$ conda create --prefix ./env --channel pytorch \
  python=3.6 \
  jupyterlab=1.0 \
  pytorch=1.1 \
  torchvision=0.3 \
  matplotlib=3.1
```

## Exercise: Using `pip` inside Conda environments

Activate the `machine-learning-env` you created in a previous challenge and use `pip` to install `combo`.

. . .

```
$ conda install --name machine-learning-env pip
$ conda activate machine-learning-env
$ python -m pip install combo==0.1.*
```

## Key points

::: {.incremental}
- A package is a tarball containing system-level libraries, Python or other modules, executable programs and other components, and associated metadata.
- A Conda channel is a URL to a directory containing a Conda package(s).
- Understand how to use Conda and Pip together effectively.
:::

# Sharing Environments

## Objectives

::: {.incremental}
- Create an environment from a YAML file that can be read by Windows, Mac OS, or Linux.
- Create an environment based on exact package versions.
:::

## Environment files

```yaml
name: machine-learning-env

dependencies:
  - ipython
  - matplotlib
  - pandas
  - pip
  - python
  - scikit-learn

```

## Why create environment files?

::: {.incremental}
1. Makes it easier for you to quickly run your code in other environments (_e.g._ other machines)
    - _e.g._ A supercomputing cluster, your Linux workstation, your MacOS laptop, you in 6 months
2. Makes it easier for your collaborators to run your code
3. Easy recovery if you break your environment while testing lots of software
:::

## Better environment files with explicit versions

```yaml
name: machine-learning-env

dependencies:
  - ipython=7.13
  - matplotlib=3.1
  - pandas=1.0
  - pip=20.0
  - python=3.6
  - scikit-learn=0.22
```

- Depends on the software, but specifying major and minor versions (`X.Y`) is specific enough

## Version control your environment files

::: {.incremental}
- Don't check your actual Conda environment folders into version control
- Instead, check in the environment file to create them
- Helps keep your environment and code in sync
    - If you need to run old code, can go back and recreate your exact environment
:::

## Exercise: Create an environment from an environment file

Create a new project directory and then create a new `environment.yml` file inside your project directory with the following contents.

```yaml
name: scikit-learn-env

dependencies:
  - ipython=7.13
  - matplotlib=3.1
  - pandas=1.0
  - pip=20.0
  - python=3.6
  - scikit-learn=0.22
```

Now use this file to create a new Conda environment. Where is this new
environment created? Using the same `environment.yml` file create a
Conda environment as a sub-directory called `env/` inside a newly
created project directory. Compare the contents of the two
environments.

```
$ mkdir scikit-learn-project-dir
$ cd scikit-learn-project-dir
$ nano environment.yml
$ conda env create --file environment.yml
$ conda env create --file environment.yml --prefix ./env
```

## Specifying channels in your environment files

```yaml
name: pytorch-env

channels:
  - pytorch
  - defaults

dependencies:
	- pytorch=1.1
```

## Using `pip` in your environment files

```yaml
name: example

dependencies:
  - jupyterlab=1.0
  - matplotlib=3.1
  - pandas=0.24
  - scikit-learn=0.21
  - pip=19.1
  - pip:
    - kaggle==1.5
    - yellowbrick==0.9
```

```yaml
  - pip
  - pip:
    - -r file:requirements.txt
```

## Key points

- Sharing Conda environments with other researchers facilitates the reprodicibility of your research.
- Environment files explicitly describe your project's software environment.

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
