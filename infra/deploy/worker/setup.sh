#!/bin/bash

DEBIAN_FRONTEND=noninteractive

apt-get install -y \
    php5-cli \
    php5-json \
    php5-intl \
    php5-curl \
    php5-pgsql \

sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

sed -i "s@^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT@error_reporting = E_ALL@" /etc/php5/cli/php.ini
sed -i "s@^display_errors = Off@display_errors = On@" /etc/php5/cli/php.ini
sed -i "s@^display_startup_errors = Off@display_startup_errors = On@" /etc/php5/cli/php.ini
sed -i "s@^;date.timezone =@date.timezone = UTC@" /etc/php5/cli/php.ini
