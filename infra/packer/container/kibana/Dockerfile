FROM rc/kibana

EXPOSE 5601

ENV ELASTICSEARCH_URL http://elasticsearch:9200
ENV PATH /kibana/bin:$PATH

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /kibana

CMD ["kibana"]

ENTRYPOINT ["/docker-entrypoint.sh"]