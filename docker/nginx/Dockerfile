FROM nginx

RUN apt-get update && apt-get install -y rsyslog

ADD default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"] 