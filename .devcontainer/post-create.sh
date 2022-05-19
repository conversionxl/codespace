# Start services
sudo service mysql start
sudo service nginx start
sudo service php7.4-fpm start

# Composer install
composer install -n

# Setup database
wp db create
wp db import wordpress_cxl_wpstarter.sql