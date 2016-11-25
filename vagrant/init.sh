#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

GIT_EMAIL="user@domain.com"
GIT_USER="User Name"
MYSQL_PASSWORD="pass"

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

echo "Provisioning virtual machine..."

echo "- Installing Git."
sudo apt-get install -y git

echo "- Configuring Git."
git config --global user.name $GIT_USER
git config --global user.email $GIT_EMAIL

echo "- Installyng Ruby."
sudo apt-get install -y ruby

echo "- Installyng NodeJS."
sudo apt-get install -y nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node

echo "- Installyng NPM."
sudo apt-get install -y npm
sudo npm install -g npm
sudo npm install -g gulp

echo "- Installing Apache2."
sudo apt-get install -y apache2

echo "- Configuring Apache2."
grep -q "ServerName localhost" /etc/apache2/apache2.conf || sudo echo "ServerName localhost" >> /etc/apache2/apache2.conf
sudo a2dissite 000-default.conf
sudo cp /var/www/vagrant/init.vhost /etc/apache2/sites-available/000-default.conf
sudo a2ensite 000-default.conf
sudo ufw allow in "Apache Full"

echo "- Testing Apache2."
sudo apache2ctl configtest

echo "- Restarting Apache2."
sudo service apache2 restart

echo "- Setting required MySQL configurations."
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password $MYSQL_PASSWORD'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD'

echo "- Installing MySQL."
sudo apt-get install -y mysql-server

echo "- Installing PHP."
sudo apt-get install -y php7.0
sudo apt-get install -y libapache2-mod-php7.0
sudo apt-get install -y php7.0-mysql
sudo apt-get install -y php7.0-xml
sudo apt-get install -y php5-curl

echo "- Configuring PHP."
sudo a2enmod rewrite

echo "- Restarting Apache2."
sudo service apache2 restart

echo "- Installing Composer."
wget https://getcomposer.org/installer
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

echo "- Installing PHPUnit."
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

echo "- Cleaning unnecesary packages."
sudo apt-get autoremove -y --purge
