terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {
  type        = string
  default     = "dop_v1_2bb34b9ac5e293f8c86708e2a73107e40eeea4047e157784259a65e421b9a56c"
  description = "Token da Digital Ocean"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "vm-web"
  region = "nyc3"
  size   = "s-1vcpu-1gb"

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    #ignore_changes = [
    #  tags,
    #]
    replace_triggered_by = [
      digitalocean_droplet.jenkins
    ]
  }
}

resource "digitalocean_droplet" "jenkins" {
  image  = "ubuntu-22-04-x64"
  name   = "vm-web"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  
}