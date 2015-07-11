Objectives -- hashicorp vs docker?

- Packer to generate image/containers
 -- DO image ubuntu with docker installed and configured (or just docker-machine then create an image)

 -- docker container images for each service -> tag and push (vs local container commit for dev)
    - dockerfiles vs packer..?
    - shared ubuntu base, ansible local configuration for each image
    - data containers for db -> easy backup
    - data containers for source (copy vs mounted host volume.. do files end up in container image?)
      - should code be an atomic deploy of a data volume container? (i think yes)
      - should code live on the docker host? (i think not)

need to separate images and dockerfiles to support different environments (qa/staging/prod/test/dev)

- Terraform to manage cloud infrastructure
 -- use of state files seems annoying, wish it could read config
 -- ansible/saltstack seem like better options, saltstack requires master ugh

- Deploy
 -- pull latest source code data volume container (ansible again?)
 -- relaunch containers from dockerfiles



step 1 -> docker host
step 2 -> container registry vs building locally
