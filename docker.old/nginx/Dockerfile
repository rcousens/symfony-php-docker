FROM nginx

RUN apt-get update && apt-get install -y rsyslog

ADD default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /
COPY 50-default.conf /etc/rsyslog.d/50-default.conf

ENTRYPOINT ["/entrypoint.sh"] 