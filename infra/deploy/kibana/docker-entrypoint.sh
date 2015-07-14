#!/bin/bash

set -e

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
    set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
    if [ "$ELASTICSEARCH_URL" -o "$ELASTICSEARCH_PORT_9200_TCP" ]; then
        : ${ELASTICSEARCH_URL:='http://elasticsearch:9200'}
        sed -ri "s!^(elasticsearch_url:).*!\1 '$ELASTICSEARCH_URL'!" /kibana/config/kibana.yml
    fi

    set -- gosu kibana "$@"
fi

exec "$@"