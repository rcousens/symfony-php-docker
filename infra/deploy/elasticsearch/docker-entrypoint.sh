#!/bin/bash

if [[ "$1" == -* ]]; then
    set -- elasticsearch "$@"
fi

if [ "$1" = 'elasticsearch' ]; then
    chown -R elasticsearch:elasticsearch /data
    set -- gosu elasticsearch elasticsearch
fi
exec "$@"
