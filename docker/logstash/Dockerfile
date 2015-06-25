FROM logstash

EXPOSE 514

COPY logstash.conf /
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]