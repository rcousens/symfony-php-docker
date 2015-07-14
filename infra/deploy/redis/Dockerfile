FROM registry.rosscousens.com:5000/rc/redis

EXPOSE 6379

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /var/lib/redis

ENTRYPOINT ["/docker-entrypoint.sh"]
