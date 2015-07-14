#!/bin/bash

GOLANG_GOOS=linux
GOLANG_GOARCH=amd64
GOLANG_VERSION=1.4.2
export GOPATH=/go

groupadd -r mailhog && useradd -r -g mailhog mailhog

apt-get install -y \
    bzr \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

curl -sSL https://storage.googleapis.com/golang/go$GOLANG_VERSION.$GOLANG_GOOS-$GOLANG_GOARCH.tar.gz \
    | tar -v -C /usr/local -xz

mkdir -p $GOPATH/src $GOPATH/bin && chmod -R 777 $GOPATH

export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

go get github.com/mailhog/MailHog