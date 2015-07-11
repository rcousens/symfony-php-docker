FROM rc/nginx

EXPOSE 80

ENV PHP_FPM_HOST phpfpm
ENV PHP_FPM_PORT 9000
ENV LOGSTASH_HOST logstash

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/dev.conf /etc/nginx/sites-available/dev.conf
COPY config/logging.conf /etc/rsyslog.d/logging.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN ln -s /etc/nginx/sites-available/dev.conf /etc/nginx/sites-enabled/dev.conf

WORKDIR /var/www/html

CMD ["nginx"]

ENTRYPOINT ["/docker-entrypoint.sh"]