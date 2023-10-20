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

data "digitalocean_ssh_key" "ssh" {
  name = "terraform"
}

resource "digitalocean_droplet" "vm" {
  image    = "ubuntu-22-04-x64"
  name     = "vm"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]
}

variable "do_token" {
  type        = string
  default     = "x"
  description = "Chave da API"
}

variable "region" {
  type        = string
  default     = "nyc1"
  description = "Região"
}

resource "digitalocean_droplet" "vm_outside" {
  name   = "vm-outside-teste"
  image  = "ubuntu-22-10-x64"
  region = var.region
  size   = "s-1vcpu-2gb"
}