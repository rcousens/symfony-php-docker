#!/bin/bash

/bin/sed -i "s@<LOGSTASH_HOST>@${LOGSTASH_PORT_514_TCP_ADDR}@" /etc/rsyslog.d/50-default.conf

# move these to php-fpm.conf and drop dependency on composer configuring
export SYMFONY__DATABASE_HOST=$POSTGRES_PORT_5432_TCP_ADDR
export SYMFONY__REDIS_HOST=$REDIS_PORT_6379_TCP_ADDR
export SYMFONY__ELASTICSEARCH_HOST=$ELASTICSEARCH_PORT_9200_TCP_ADDR
export SYMFONY__MAILER_HOST=${MAILHOG_PORT_1025_TCP_ADDR}:1025
export SYMFONY__DATABASE_USER=postgres
export SYMFONY__DATABASE_PASSWORD=today123
export SYMFONY_ENV=prod

cd /var/www/html
/usr/local/bin/composer install

until nc -z postgres 5432; do
    echo "$(date) - waiting for postgres..."
    sleep 1
done

sleep 10

/usr/bin/php /var/www/html/app/console doctrine:database:create
/usr/bin/php /var/www/html/app/console doctrine:schema:create

rm -fr /var/www/html/app/cache/*
rm -fr /var/www/html/app/logs/*

/bin/chown -R www-data:www-data /var/www/html/app/cache
/bin/chown -R www-data:www-data /var/www/html/app/logs

/usr/sbin/rsyslogd &
/usr/sbin/php5-fpm --nodaemonize
