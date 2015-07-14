#!/bin/bash

LS_PKG_NAME=logstash-1.5.2

cd / && \
  wget https://download.elastic.co/logstash/logstash/$LS_PKG_NAME.tar.gz && \
  tar xvzf $LS_PKG_NAME.tar.gz && \
  rm -f $LS_PKG_NAME.tar.gz && \
  mv /$LS_PKG_NAME /logstash
