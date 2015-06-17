FROM nginx

ADD default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"] 