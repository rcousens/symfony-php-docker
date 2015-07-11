#!/bin/bash

if [[ "$1" == -* ]]; then
    set -- elasticsearch "$@"
fi

if [ "$1" = 'elasticsearch' ]; then
    set -- gosu elasticsearch elasticsearch
fi
exec "$@"
