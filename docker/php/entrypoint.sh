#!/bin/bash

cd /var/www/html
export SYMFONY__DATABASE_HOST=$POSTGRES_PORT_5432_TCP_ADDR 
export SYMFONY__REDIS_HOST=$REDIS_PORT_6379_TCP_ADDR
export SYMFONY__ELASTICSEARCH_HOST=$ELASTICSEARCH_PORT_9200_TCP_ADDR
export SYMFONY_ENV=prod
/usr/local/bin/composer install
until nc -z postgres 5432; do
    echo "$(date) - waiting for postgres..."
    sleep 1
done
/usr/bin/php /var/www/html/app/console doctrine:database:create
/usr/bin/php /var/www/html/app/console doctrine:schema:create
rm -fr /var/www/html/app/cache/*
rm -fr /var/www/html/app/logs/*
/bin/chmod 777 /var/www/html/app/cache
/bin/chmod 777 /var/www/html/app/logs
/usr/sbin/rsyslogd &
/usr/sbin/php5-fpm --nodaemonize
