#!/bin/bash

export ELASTICSEARCH_URL=http://${ELASTICSEARCH_PORT_9200_TCP_ADDR}:9200
/docker-entrypoint.sh kibana
