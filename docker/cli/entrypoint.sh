#!/bin/bash
set -e

if [ "$1" = 'stall' ]; then
    exec tail -f /dev/null
elif [ "$1" = 'bash' ]; then
    exec gosu www-data bash --rcfile /etc/bash.bashrc
else
    exec gosu www-data php app/console "$@"
fi
