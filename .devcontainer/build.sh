#!/usr/bin/env bash

sudo apt update

# NGINX

sudo apt -y install nginx
sudo ln -fs /workspaces/cxl-wpstarter/.devcontainer/etc/nginx/sites-available/default /etc/nginx/sites-available/default

# PHP

sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt -y install php7.4-{bcmath,cli,curl,fpm,mbstring,mysqli,xdebug,xml}

# Composer

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# Node

curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs npm

# MariaDB

sudo apt -y install mariadb-client mariadb-server
sudo /etc/init.d/mysql start
sudo mysql -u root -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost';FLUSH PRIVILEGES;"

# wp-cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
