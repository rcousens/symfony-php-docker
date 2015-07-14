#!/bin/bash

KB_PKG_NAME=kibana-4.0.3-linux-x64

groupadd -r kibana && useradd -r -g kibana kibana

cd / && \
  wget https://download.elastic.co/kibana/kibana/$KB_PKG_NAME.tar.gz && \
  tar xvzf $KB_PKG_NAME.tar.gz && \
  rm -f $KB_PKG_NAME.tar.gz && \
  mv /$KB_PKG_NAME /kibana

chown -R kibana:kibana /kibana
