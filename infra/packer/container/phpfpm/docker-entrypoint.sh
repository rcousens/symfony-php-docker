#!/bin/bash

if [ "$1" = 'php5-fpm' ]; then
    sed -i "s@<LOGSTASH_HOST>@logstash@" /etc/rsyslog.d/logging.conf

    cd /var/www/html
    composer install

    until nc -z postgres 5432; do
        echo "$(date) - waiting for postgres..."
        sleep 1
    done

    sleep 10

    php app/console doctrine:database:create
    php app/console doctrine:schema:create

    rm -fr /var/www/html/app/cache/*
    rm -fr /var/www/html/app/logs/*

    chown -R www-data:www-data /var/www/html/app/cache
    chown -R www-data:www-data /var/www/html/app/logs

    rsyslogd

    set -- php5-fpm --nodaemonize
fi

exec "$@"
