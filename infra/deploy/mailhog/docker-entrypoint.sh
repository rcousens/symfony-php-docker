#!/bin/bash

set -e

if [[ "$1" == -* ]]; then
    set -- MailHog "$@"
fi

if [ "$1" = 'MailHog' ]; then
    set -- gosu mailhog "$@"
fi

exec "$@"