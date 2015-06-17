#!/bin/bash

/bin/sed -i "s@<FPM_HOST>@${PHP_1_PORT_9000_TCP_ADDR}@" /etc/nginx/conf.d/default.conf
/bin/sed -i "s@<FPM_PORT>@${PHP_1_PORT_9000_TCP_PORT}@" /etc/nginx/conf.d/default.conf

/usr/sbin/nginx -g "daemon off;"
