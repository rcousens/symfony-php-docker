FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    rsyslog \
    php5-cli \
    php5-fpm \
    php5-json \
    php5-intl \
    php5-curl \
    php5-xdebug \
    php5-pgsql

RUN sed -i "s@listen = /var/run/php5-fpm.sock@listen = 9000@" /etc/php5/fpm/pool.d/www.conf

RUN sed -i "s@^memory_limit = 128M@memory_limit = 512M@" /etc/php5/fpm/php.ini
RUN sed -i "s@^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT@error_reporting = E_ALL@" /etc/php5/fpm/php.ini
RUN sed -i "s@^display_errors = Off@display_errors = On@" /etc/php5/fpm/php.ini
RUN sed -i "s@^display_startup_errors = Off@display_startup_errors = On@" /etc/php5/fpm/php.ini
RUN sed -i "s@^;date.timezone =@date.timezone = UTC@" /etc/php5/fpm/php.ini
RUN sed -i "s@^;error_log = syslog@error_log = syslog@" /etc/php5/fpm/php.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

EXPOSE 9000

WORKDIR /var/www/html

COPY entrypoint.sh /
COPY 50-default.conf /etc/rsyslog.d/50-default.conf

ENTRYPOINT ["/entrypoint.sh"] 
