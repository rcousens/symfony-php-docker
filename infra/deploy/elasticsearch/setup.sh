#!/bin/bash

ES_PKG_NAME=elasticsearch-1.6.0

groupadd -r elasticsearch && useradd -r -g elasticsearch elasticsearch

cd / && \
  wget https://download.elastic.co/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

mkdir /data && chown -R elasticsearch:elasticsearch /elasticsearch /data
