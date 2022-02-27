# How to install Docker on Arch Linux

## Install the Official version of Docker on Arch 

1. We will be using pacman to install the official binaries from the Community. Open a terminal an type:

``` bash
$ sudo pacman -S docker
```
2. The development version is in the Arch User Repository. YOu need to have git installed for this:

``` bash
$ sudo pacman -S base-devel
$ git clone https://aur.archlinux.org/docker-git.git
$ cd docker-git/
$ makepkg -sri
```
## Starting the docker service n startup

Before we can use docker, we need to enable Docker daemon. We can easily do it using systemctl start.

``` bash
$ sudo systemctl start docker.service
$ sudo systemctl enable docker.service
```
To confirm that docker service is running, issue the command:

``` bash
$ sudo systemctl status docker
```
To stop docker, invoke the command:

``` bash
$ sudo systemctl stop docker
```

Additionally, you can confirm the version of Docker that you are running using the docker version command shown.

``` bash
$ sudo docker version
```

## Adding User to Docker group

Running docker requires sudo privileges. So we need to root every time we run docker. This can be eliminated by adding the user to the docker group. To add the user to the docker group, use the usermod command.

``` bash
$ sudo usermod -aG docker $USER
```
The user needs to log back in to see the effect.

Note: Anyone added to the docker group is root equivalent, so make sure you trust the user that you are adding to the docker group.

## Hello Docker

Now that we have docker installed we can run our first docker command- “Hello World”

``` bash
$ sudo docker run hello-world
```

To download or pull an image from Docker hub without running it, use the syntx:
``` bash 
$ sudo docker pull <image-name>
```

For example, to pull an Nginx image, run

``` bash
$ sudo docker pull nginx
```
To check the images residing on your system invoke:

``` bash
$ sudo docker images
```
