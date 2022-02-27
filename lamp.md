# How to Install a LAMP (Apache, MariaDB, PHP) Stack on Arch Linux
---
LAMP stands for Linux, Apache, MySQL, MariaDB, MongoDB, PHP, PERL, Python,
PhpMyAdmin. LAMP is combination of operating system and bunch of open-source
software which is developed by different organizations.

---
Let's go through the packages above:
 - `apache` - An HTTP web server, it will set up the local server for your application.
 - `php` - A server side programing language that will process data from the website
 - `php-apache` - This integrates PHP with the Apache server
 - `mariadb` - An SQL database server

## 1. Upadate your Arch system

Run the following command as root user to update your Arch Linux:

``` bash
$ sudo pacman -Syyu
```
## 2. Install Apache

After updating the system, install Apache web server using command:

``` bash
$ sudo pacman -S apache
```
Edit /etc/httpd/conf/httpd.conf

``` bash
$ sudo vim /etc/httpd/conf/httpd.conf
```
Search and comment out the following line if it is not already:

```
[...]
#LoadModule unique_id_module modules/mod_unique_id.so
[...]
```
Save an close the file.

Enable Apache service to start at boot and restart Apache service using commands:

``` bash
$ sudo systemctl enable httpd
$ sudo systemctl restart httpd
```
You can verify whether Apache is running or not with command:

``` bash
$ sudo systemctl status httpd
```
### Test Apache

Let us create a sample page in the Apache root directory, i.e **/srv/http.**

``` bash
$ sudo vim /srv/http/index.html
```
Add the following line:

``` html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Welcome</title>
 </head>
<body>
  <h2>Welcome to my Web Server test page</h2>
</body>
</html>
```
Now, open your web browser and navigate to **https://localhost**

## 3. Install MariaDB

Run the following command to install MariaDB:

``` bash
$ sudo pacman -S mysql
```
As you may know, MariaDB is now officially the default implementation of MySQL in Arch Linux since 2013. So, you will be asked whether to install MariaDB or Percona server, just hit enter and then type "Y" and press enter again. The default selection i.e MariaDB will be installed on your Arch Linux.

You need to initialize the MariaDB data directory prior to starting the service. To do so, run:

``` bash
$ sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```
Then issue the following command to enable and start MariaDB service.

``` bash
$ sudo systemctl enable mysqld
$ sudo systemctl restart mysqld
```
You can verify whether MariaDb is running or not using command:

``` bash
$ sudo systemctl status mysqld
```
### Setup MySQL/MariaDB root user password
As you may know, it is recommended to setup a password for database root user.

Run the following command to setup MariaDB root user password:

``` bash
$ sudo mysql_secure_installation
```
That's it. You can now login to mysql root user and create or manage databases from mySQL command-line interface.

``` bash
$ sudo mysql -u root -p
```
## 4. Install PHP

To install PHP on Arch Linux, run:

``` bash
$ sudo pacman -S php php-apache php-cgi php-gd php-pgsql
```
After PHP is installed, we need to configure Apache PHP module.

To do so, edit **/etc/httpd/conf/httpd.conf** file,

``` bash
$ sudo vim /etc/httpd/conf/httpd.conf
```
Find the following line and comment it out:

```
[...]
#LoadModule mpm_event_module modules/mod_mpm_event.so
[...]
```
Next, find and uncomment the following line in the configuration:

```
[...]
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
[...]
```
Then, add the following lines at the bootom for php8:

```
[...]
LoadModule php_module modules/libphp.so
AddHandler php-script php
Include conf/extra/php_module.conf
[...]
```
or for php7:

```
[...]
LoadModule php7_module modules/libphp7.so
AddHandler php7-script php
Include conf/extra/php7_module.conf
[...]
```
After installing, edit **php.ini** file,

``` bash
$ sudo vim /etc/php/php.ini
```
Make sure the following lines are uncommented.

```
[...]
extension=curl
extension=gd
extension=mysqli
extension=zip
[...]
```

Now save the file and exit. Restart the apsche server to make sure all the configurations are loaded properly.

``` bash
$ sudo systemctl restart httpd
```
### Test PHP

Now create a **info.php** file in the Apache root directory.

``` bash
$ sudo vim /srv/http/info.php
```
Add the following lines:

``` php
<?php
 phpinfo();
?>
```
Restart the httpd service.

``` bash
$ sudo systemctl restart httpd
```
Open up your web browser and navigate to **https://localhost/info.php**

## 5. Install phpMyAdmin

phpMyAdmin is a graphical MySQL/MariaBD administration tool that can be used to create, edit and delete databases.

To install it, run:

``` bash
$ sudo pacman -S phpmyadmin
```
After installing, edit **php.ini* file,

```bash
$ sudo vim /etc/php/php.ini
```
Make sure the following lines are uncommented.

```
[...]
extension=bz2
extension=mysqli
[...]
```
Save and close the file.

Next, create configuration file for phpMyAdmin,

``` bash
$ sudo /etc/httpd/conf/extra/phpmyadmin.conf
```
Add the following lines:

```
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
 <Directory "/usr/share/webapps/phpMyAdmin">
  DirectoryIndex index.php
  AllowOverride All
  Options FollowSymlinks
  Require all granted
 </Directory>
 ```
 Then, open Apache configuration file,
 
 ``` bash
 $ sudo vim /etc/httpd/conf/httpd.conf
 ```
 Add the following line at the end:
 
 ```
 Include conf/extra/phpmyadmin.conf
 ```
 Save and close the file. 
 
 Restart the httpd service again.
 
 ``` bash
 $ sudo systemctl restart httpd
 ```
 ### Test phpMyAdmin
 
 Open your browser and navigate to **https://localhost/phpmyadmin**
 
 You might see an error that says **The configuration file now needs a secret passphrase (blowfish_secret)** at the bottom of phpMyAdmin dashboard.

To get rid of this error, edit **/etc/webapps/phpmyadmin/config.inc.php** file,

``` bash
$ sudo vim /etc/webapps/phpmyadmin/config.inc.php
```
Find the following line and specify bluefish secret passphrase:

```
$cfg['blowfish_secret'] = '`MyP@$S`'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH!$ /**
```
Save and close the file.

Restart Apache service.

``` bash
$ sudo systemctl restart httpd
```
The error will be gone now.

*That’s all for now. At this stage, you have a working LAMP stack, and is ready to host your websites.*
