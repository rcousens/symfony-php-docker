#!/bin/bash

if [ "$1" = 'logstash' ]; then
    sed -i "s@<ES_HOST>@elasticsearch@" /logstash/config/logstash.conf
    set -- /logstash/bin/logstash -f /logstash/config/logstash.conf
fi

exec "$@"
