#!/bin/bash

/bin/sed -i "s@<FPM_HOST>@php@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<FPM_PORT>@9000@" /etc/nginx/conf.d/default.conf

/bin/sed -i "s@<LOGSTASH_HOST>@logstash@" /etc/rsyslog.d/50-default.conf

/usr/sbin/rsyslogd &
/usr/sbin/nginx -g "daemon off;"
