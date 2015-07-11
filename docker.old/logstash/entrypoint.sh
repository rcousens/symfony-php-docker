#!/bin/bash

/bin/sed -i "s@<ES_HOST>@elasticsearch@" /logstash.conf
logstash -f /logstash.conf