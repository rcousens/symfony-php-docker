#!/bin/bash

/bin/chmod 777 /var/www/html/app/cache
/usr/sbin/php5-fpm --nodaemonize
