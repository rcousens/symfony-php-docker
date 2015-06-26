#!/bin/bash

/bin/sed -i "s@<FPM_HOST>@${PHP_1_PORT_9000_TCP_ADDR}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<FPM_PORT>@${PHP_1_PORT_9000_TCP_PORT}@" /etc/nginx/conf.d/default.conf

/bin/sed -i "s@<LOGSTASH_HOST>@${LOGSTASH_1_PORT_514_TCP_ADDR}@" /etc/rsyslog.d/50-default.conf

/usr/sbin/rsyslogd &
/usr/sbin/nginx -g "daemon off;"
