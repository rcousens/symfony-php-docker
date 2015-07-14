FROM registry.rosscousens.com:5000/rc/logstash

EXPOSE 514

COPY config/logstash.conf /logstash/config/logstash.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /logstash

CMD ["logstash"]

ENTRYPOINT ["/docker-entrypoint.sh"]