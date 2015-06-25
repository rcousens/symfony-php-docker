#!/bin/bash

/bin/sed -i "s@<ES_HOST>@${ELASTICSEARCH_PORT_9200_TCP_ADDR}@" /logstash.conf
logstash -f /logstash.conf