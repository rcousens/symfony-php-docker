#!/bin/bash

set -e

if [[ "$1" == -* ]]; then
    set -- nginx "$@"
fi

if [ "$1" = 'nginx' ]; then
    sed -i "s@<PHP_FPM_HOST>@$PHP_FPM_HOST@" /etc/nginx/sites-available/dev.conf
    sed -i "s@<PHP_FPM_PORT>@$PHP_FPM_PORT@" /etc/nginx/sites-available/dev.conf
    sed -i "s@<LOGSTASH_HOST>@$LOGSTASH_HOST@" /etc/rsyslog.d/logging.conf
    rsyslogd
    set -- nginx -g "daemon off;"
fi

exec "$@"
