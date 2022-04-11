# <p>A Complete Guide to Install Tomcat on Linux</p>

## Install Apache Tomcat10 on Linux

```
$ sudo pacman -sy tomcat10
```

### Rename Tomcat

```
$ cd /usr/share/
$ sudo mv tomcat10 apache-tomcat
```

### Create Apache Tomcat user:

For security purpose, Tomcat should be run as an unprivileged user (i.e not root)

First create a new `tomcat` group

```
$ sudo groupadd tomcat
```
Now create a new `tomcat` user

```
$ $ sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
```
or

```
$ sudo useradd -M -d /usr/share/apache-tomcat tomcat
```

Now fix permissions

```
$ cd /usr/share/tomcat
$ sudo chgrp -R tomcat /usr/share/tomcat
$ sudo chmod -R g+r conf
$ sudo chmod g+r conf
$ sudo chown -R tomcat webapps/ work/ temp/ logs/
```


```
$ sudo chowm -R tomcat /usr/share/apache-tomcat
```

## Secure Access to admin/manager dashboard

We need to secure access to admin areas of tomcat UI, edit the file:

```
$ sudo nvim /usr/share/tomcat10/conf/tomcat-users.xml
```
Add the following content before `</tomcat-users>`

``` xml
<!-- manager section user role -->
<role rolename="manager-gui" />
<user username="manager" password="StronPassw0rd123" roles="manager-gui" />

<!-- admin section user role -->
<role rolename="admin-gui" />
<user username="admin" password="StronPassw0rd123" roles="manager-gui,admin-gui" />
```
## Configure Systemd service

Create Systemd unit file for Tomcat 10:

```
$ sudo nvim /etc/systemd/system/tomcat.service
```

Then paste below content into the file:

```
[Unit]
Description=Tomcat
After=syslog.target network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/default-java
Environment='JAVA_OPTS=-Djava.awt.headless=true'

Environment=CATALINA_HOME=/usr/share/apache-tomcat
Environment=CATALINA_BASE=/usr/share/apache-tomcat
Environment=CATALINA_PID=/usr/share/apache-tomcat/temp/tomcat.pid

ExecStart=/usr/share/apache-tomcat/bin/catalina.sh start
ExecStop=/usr/share/apache-tomcat/bin/catalina.sh stop

[Install]
WantedBy=multi-user.target
```
Reload systemd daemon:

```
$ sudo systemctl daemon-reload
```
Run the commands below to start thetomcat service:

```
$ sudo systemctl restart tomcat
```
Enable tomcat to sart at system boot

```
$ sudo systemctl enable tomcat
```

If the start was successful, you should see port 8080 on your system being used by a Java process.

## References

- [Install Apache Tomcat 10 on Ubuntu 20.04|18.04](https://computingforgeeks.com/install-apache-tomcat-on-ubuntu-linux/)
- [A Complete Guide to Install Tomcat on Linux](https://www.journaldev.com/39819/install-tomcat-on-linux)
- [Tomcat Install on Linux](https://docs.axelor.com/abs/5.0/install/source/linux.html)
