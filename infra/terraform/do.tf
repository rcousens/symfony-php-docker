provider "digitalocean" {
}

# Create a docker host
resource "digitalocean_droplet" "deploy" {
    image = "ubuntu-15-04-x64"
    name = "deploy"
    region = "sfo1"
    size = "512mb"
    ssh_keys = ["971320"]
}

# Create a docker registry
resource "digitalocean_droplet" "registry" {
    image = "ubuntu-15-04-x64"
    name = "deploy"
    region = "sfo1"
    size = "512mb"
    ssh_keys = ["971320"]
}

resource "digitalocean_record" "deploy" {
    domain = "rosscousens.com"
    type = "A"
    name = "deploy"
    value = "${digitalocean_droplet.deploy.ipv4_address}"
}

resource "digitalocean_record" "registry" {
    domain = "rosscousens.com"
    type = "A"
    name = "registry"
    value = "${digitalocean_droplet.registry.ipv4_address}"
}
