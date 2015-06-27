FROM ubuntu:15.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    netcat \
    rsyslog \
    php5-cli \
    php5-json \
    php5-intl \
    php5-curl \
    php5-pgsql \
    supervisor

RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

RUN sed -i "s@^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT@error_reporting = E_ALL@" /etc/php5/cli/php.ini
RUN sed -i "s@^display_errors = Off@display_errors = On@" /etc/php5/cli/php.ini
RUN sed -i "s@^display_startup_errors = Off@display_startup_errors = On@" /etc/php5/cli/php.ini
RUN sed -i "s@^;date.timezone =@date.timezone = UTC@" /etc/php5/cli/php.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /
COPY supervisord.conf /etc/supervisor/conf.d/

WORKDIR /etc/supervisor/conf.d

ENTRYPOINT ["/entrypoint.sh"]
