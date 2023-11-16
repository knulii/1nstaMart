#!/bin/bash

echo "1nstaMart Setup"
sleep 1
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "\r\nProvided by the awesome ${BLUE}knulii${NC}\r\n"
echo "Make a new root Linux password"
passwd

sudo apt update && apt upgrade -y

sudo apt-get install nginx -y

sudo apt-get install mysql-server -y
mysql_secure_installation

mysql -e "CREATE DATABASE 1nstaMart_db DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER 'user1'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pA3sw0Rd!!lmnop/';"
mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'user1'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

echo "mysql 1nstaMart_db < 1nstaMart_db.sql"

sudo service mysql restart

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt-get install php8.1-fpm php-mysql -y
sudo apt-get install -y php8.1-mysql
sudo apt-get install php8.1-mbstring php8.1-xml php8.1-xmlrpc php8.1-gmp php8.1-curl php8.1-gd composer unzip -y
sudo systemctl restart php8.1-fpm
sudo apt update

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

sudo apt-get install openjdk-8-jdk -y
echo "JAVA_HOME=$(which java)" | sudo tee -a /etc/environment
source /etc/environment
echo $JAVA_HOME

echo "Now a new user named user1 - create a password for them"

adduser user1
adduser user1 sudo

mv 1nstaMart /home/user1/
su user1
