FROM rococo.io:5000/rc/worker

COPY config/logging.conf /etc/rsyslog.d/logging.conf
COPY config/worker.conf /etc/supervisor/conf.d/worker.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["supervisord"]

ENTRYPOINT ["/docker-entrypoint.sh"]
