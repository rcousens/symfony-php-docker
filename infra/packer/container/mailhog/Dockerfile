FROM rc/mailhog

EXPOSE 1025
EXPOSE 8025

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["MailHog"]

ENTRYPOINT ["/docker-entrypoint.sh"]