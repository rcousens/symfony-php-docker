FROM registry.rosscousens.com:5000/rc/postgres

EXPOSE 5432

ENV PGDATA /data
ENV POSTGRES_PASSWORD postgres
ENV LANG en_US.utf8
ENV PATH /usr/lib/postgresql/9.4/bin:$PATH

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /data

VOLUME /data

CMD ["postgres"]

ENTRYPOINT ["/docker-entrypoint.sh"]
