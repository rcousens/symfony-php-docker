#!/bin/bash

sleep 30
# cd /var/www/html
# export SYMFONY__DATABASE_HOST=$POSTGRES_PORT_5432_TCP_ADDR
# export SYMFONY__REDIS_HOST=$REDIS_PORT_6379_TCP_ADDR
# export SYMFONY__ELASTICSEARCH_HOST=$ELASTICSEARCH_PORT_9200_TCP_ADDR
# /usr/local/bin/composer install
# rm -fr /var/www/html/app/cache/*
# rm -fr /var/www/html/app/logs/*
# /bin/chmod 777 /var/www/html/app/cache
# /bin/chmod 777 /var/www/html/app/logs
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
