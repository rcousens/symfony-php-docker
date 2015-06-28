#!/bin/bash

/bin/sed -i "s@<LOGSTASH_HOST>@${LOGSTASH_1_PORT_514_TCP_ADDR}@" /etc/rsyslog.d/50-default.conf

until nc -z postgres 5432; do
    echo "$(date) - waiting for postgres..."
    sleep 1
done
sleep 15

/usr/sbin/rsyslogd &
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
