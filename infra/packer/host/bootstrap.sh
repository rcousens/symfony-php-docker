#!/bin/bash
DEBIAN_FRONTEND=noninteractive
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible