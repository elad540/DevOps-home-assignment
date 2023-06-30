provider "digitalocean" {
  token = "<YOUR_DIGITALOCEAN_API_TOKEN>"
}

resource "digitalocean_droplet" "example" {
  name      = "example-droplet"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  image     = "ubuntu-20-04-x64"
  user_data = "${file("user_data.sh")}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
}
