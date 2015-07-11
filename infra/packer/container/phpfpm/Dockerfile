FROM rc/phpfpm

EXPOSE 9000

# move these to php-fpm.conf and drop dependency on composer configuring
ENV SYMFONY__DATABASE_HOST postgres
ENV SYMFONY__REDIS_HOST redis
ENV SYMFONY__ELASTICSEARCH_HOST elasticsearch
ENV SYMFONY__MAILER_HOST mailhog:1025
ENV SYMFONY__DATABASE_USER postgres
ENV SYMFONY__DATABASE_PASSWORD postgres

COPY config/logging.conf /etc/rsyslog.d/logging.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/docker-entrypoint.sh"]
