FROM rc/phpfpm

EXPOSE 9000

COPY config/logging.conf /etc/rsyslog.d/logging.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/docker-entrypoint.sh"]
