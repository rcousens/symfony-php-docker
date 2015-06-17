#!/bin/bash

echo "env[SYMFONY__DATABASE_HOST]=$POSTGRES_PORT_5432_TCP_ADDR" >> /etc/php5//fpm/pool.d/www.conf
cd /var/www/html
SYMFONY__DATABASE_HOST=$POSTGRES_PORT_5432_TCP_ADDR /usr/local/bin/composer install
rm -fr /var/www/html/app/cache/*
rm -fr /var/www/html/app/logs/*
/bin/chmod 777 /var/www/html/app/cache
/bin/chmod 777 /var/www/html/app/logs
/usr/sbin/php5-fpm --nodaemonize
