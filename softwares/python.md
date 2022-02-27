# Guide install Python
## Installing Python3
### Install python3
``` bash
 $ sudo pacman -S python3
```
To check Python
``` bash
$ python --version
```
### Installing pip
``` bash
 $ sudo pacman -S python-pip
```
You can also install pip yourself to ensure you have the latest version. It's recommended to use the system pip to bootstrap a user installation of pip:
``` bash
$ python3 -m pip install --user --upgrade pip
$ python3 -m pip --version
```
To check pip
``` bash
$ pip --version
```
## Installing Framework - Django
``` bash
 $ sudo pacman -S python-django
 or
 $ pip install django
```
This will make Django's code importable, and will also make the `django-admin` utility command available. In other words, you're all set!

We can confirm `django-admin` version with following command in your terminal 
``` bash
 $ python -m django --version
```
## How create a virtual environmen

### Installing virtualenv
`virtualenv` is used to manage Python packages for different projects. Using virtualenv allows you to avoid installing Python packages globally which could break system tools or other projects. You can install virtualenv using pip.
``` bash
$ python3 -m pip install -user virtualenv
```
### Creating a virtual environment 
`venv`(for python3) allow you to manage separate package installations for different projects. When you switch projects, you can simply create a new virtual environment.
``` bash
$ python3 -m venv env_name
$ ls
env_name
``` 
With above command, you can create the virtual environment in your project and call it env_name.You can name it anythign you want.

### Activating a virtual environment 
Before you can start installing or using packages in your virtual environment you’ll need to *activate* it. Activating a virtual environment will put the virtual environment-specific `python` and `pip` executables into your shell’s `PATH`.
``` bash
$ source env_name/bin/activate
```
You can confirm you're in the virtual environment by checking the location of your Python interpreter:
``` bash
$ which python 
```
It should be in the 'env_name' directory:
```
.../env_name/bin/python
```
### Leaving the virtual environment 
If you want to switch projects or otherwise leave your virtual environment, simply run:
``` bash
$ deactivate
```

## Instal Tkinter Python
Tkinter can be installed using pip
``` bash
$ pip install tk
```
### How to install Python Packages

* First, make sure pip has installed on your OS
``` bash
$ pip --version
```
* Run **pip install** command to install related packages.
``` bash
$ pip install numpy pandas scipy matplotlib
```
* Run **pip uninstall** command to uninstall related packages.
``` bash
$ pip uninstall numpy pandas scipy matplotlib
```
* Run **pip show** command to display package install information, for example
``` bash
$ pip show pandas
```
## How to install Jupyter Notebook using Anaconda

### Installing Anacond using yay -S

``` bash
$ yay -S anaconda
```
### Activate or Deactivate Ananconda environment

``` bash
### Activate anaconda environment
$ source /opt/anaconda/bin/activate root
or
$ conda activate
### Deactivate ananconda environment
$ source /opt/anaconda/bin/deactivate root
or
$ conda deactivate
```

### Run Jupyter Notebook

``` bash
$ jupyter notebook
```
