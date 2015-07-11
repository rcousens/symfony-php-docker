provider "digitalocean" {
}

# Create a web server
resource "digitalocean_droplet" "deploy" {
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

