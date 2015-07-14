#!/bin/bash

cd base
packer build packer.json
cd ../base-java
packer build packer.json
cd ../nginx
packer build packer.json
cd ../redis
packer build packer.json
cd ../phpfpm
packer build packer.json
cd ../elasticsearch
packer build packer.json
cd ../logstash
packer build packer.json
cd ../postgres
packer build packer.json
cd ../worker
packer build packer.json
cd ../kibana
packer build packer.json
cd ../mailhog
packer build packer.json
