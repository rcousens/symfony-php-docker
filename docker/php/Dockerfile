FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    php5-cli \
    php5-fpm \
    php5-json \
    php5-intl 

RUN sed -i "s@listen = /var/run/php5-fpm.sock@listen = 9000@" /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000

WORKDIR /var/www/html

CMD ["/usr/sbin/php5-fpm", "--nodaemonize"]
