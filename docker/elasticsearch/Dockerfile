FROM rococo.io:5000/rc/elasticsearch

EXPOSE 9200
EXPOSE 9300

ENV PATH /elasticsearch/bin:$PATH

COPY config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /data

VOLUME /data

CMD ["elasticsearch"]

ENTRYPOINT ["/docker-entrypoint.sh"]