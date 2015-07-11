#!/bin/bash

DEBIAN_FRONTEND=noninteractive

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# disable default cluster creation
apt-get install -y postgresql-common \
    && sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf

# install postgresql
apt-get install -y \
    postgresql-9.4 \
    postgresql-contrib-9.4

# create data volume
mkdir /data && chown -R postgres:postgres /data
