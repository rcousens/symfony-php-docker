#!/bin/bash

set -e

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
    set -- supervisord -c /etc/supervisor/supervisord.conf "$@"
fi

if [ "$1" = 'supervisord' ]; then
    sed -i "s@<LOGSTASH_HOST>@logstash@" /etc/rsyslog.d/logging.conf

    rsyslogd

    until nc -z postgres 5432; do
        echo "$(date) - waiting for postgres..."
        sleep 3
    done

    sleep 15

    set -- supervisord -c /etc/supervisor/supervisord.conf
fi

exec "$@"