#!/bin/bash

DEBIAN_FRONTEND=noninteractive

apt-get install -y \
    php5-cli \
    php5-fpm \
    php5-json \
    php5-intl \
    php5-curl \
    php5-xdebug \
    php5-pgsql

sed -i "s@listen = /var/run/php5-fpm.sock@listen = 9000@" /etc/php5/fpm/pool.d/www.conf

sed -i "s@^memory_limit = 128M@memory_limit = 512M@" /etc/php5/fpm/php.ini
sed -i "s@^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT@error_reporting = E_ALL@" /etc/php5/fpm/php.ini
sed -i "s@^display_errors = Off@display_errors = On@" /etc/php5/fpm/php.ini
sed -i "s@^display_startup_errors = Off@display_startup_errors = On@" /etc/php5/fpm/php.ini
sed -i "s@^;date.timezone =@date.timezone = UTC@" /etc/php5/fpm/php.ini
sed -i "s@^;error_log = syslog@error_log = syslog@" /etc/php5/fpm/php.ini

echo "xdebug.idekey = PHPSTORM" >> /etc/php5/fpm/conf.d/20-xdebug.ini
echo "xdebug.max_nesting_level = 1000" >> /etc/php5/fpm/conf.d/20-xdebug.ini
echo "xdebug.remote_enable = 1" >> /etc/php5/fpm/conf.d/20-xdebug.ini
echo "xdebug.remote_connect_back = 1" >> /etc/php5/fpm/conf.d/20-xdebug.ini

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
