# Install Java in Arch LInux 

**Find the latest Java package in Arch**

Open a terminal and run this command.

```bash
$ yay jdk
```
This command searches all packages with JDK in them. 
So, it would give you a huge list of packages. For new users, it is probably confusing to install. 
You can either use grep to filter out the list or go through them quickly.

**Install Oracle Java in Arch**

The Oracle package name is JDK. So, in the above list, it should be mentioned as “aur/jdk”. 
You can run the above command `yay jdk` and then enter the number to install.

Or, you can just run the below command and press enter when asked for providers to choose the default. 
See below.

```bash
yay -S jdk
```
After the installation, check the Java version using `java --version` from the terminal.

**Install OpenJDK in Arch (main)** 

First, search for the extact package name:

```bash
$ sudo pacman -Ss java | grep jdk
```
Then, use the following command to install the `jdk-openjdk` package

``` bash
$ sudo pacman -S jdk-openjdk
```
**Install OpenJRE in Arch (main)**

First, search for the extact package name:

```bash
$ sudo pacman -Ss java | grep jre
```
Then, use the following command to install the `jre-openjdk` package

``` bash
$ sudo pacman -S jre-openjdk jre-openjdk-headless
```
Proceed with the installation and wait for it to complete. 
After the installation, check the Java version using `java --version` from the terminal.

**Check the Java version**

You  can check what java version is currently used in your Arch system using below command:

``` bash
$ java --version
```
The Arch utility archlinux-java can list the available java environments using the below command.

``` bash
$ archliux-java status
```
**Change Java environment version**

If you are a developer and use Arch for development, 
you may have installed multiple Java versions for different projects. 
In that case, you can switch between multiple Java versions using the below command. 
You can get the actual package name using the archlinux-java status command.

``` bash
$ sudo archlinux-java set <target java package name>
```
**Configure Java Environment**

```
export JAVA_HOME="/urs/lib/jvm/jdk-17/"
export PATH=\$PATH:\$JAVA_HOME/bin

or 
export JAVA_HOME=/opt/jdk-17
export PATH=$PATH:$JAVA_HOME/bin
```

#### Example

``` bash
$ sudo archlinux-java set java-15-jdk
```
If you have set an invalid Java environment link, use the following command to fix it.

``` bash
$ sudo archlinux-java fix
```
So. that’s all of it for this quick guide.

### How to compile and run Java file 

To compile the file, open your terminal and type

``` bash
$ javac filename.java
```
To run the generated class file, use

``` bash
$ java filename
```
### Install spring-boot-cli from AUR

``` bash
$ git clone https://aur.archlinux.org/spring-boot-cli.git
$ cd spring-boot-cli
$ makepkg -si
$ cd ..
$ sudo rm -rfv spring-boot-cli
```
## Java Directory

``` bash
$ whereis java
java: /usr/lib/jvm/java-17-openjdk/bin/java
``` 
- If you have any error while instlling Java (java 17). You can refer to this:

``` bash
$ sudo rm -rf /usr/local/bin/package-query
```
## References

- [Install/Upgrade Oracle JDK 17 (Java 17 LTS) ](https://www.linuxcapable.com/how-to-install-oracle-jdk-17-java-17-lts-on-linux-mint-20/)
