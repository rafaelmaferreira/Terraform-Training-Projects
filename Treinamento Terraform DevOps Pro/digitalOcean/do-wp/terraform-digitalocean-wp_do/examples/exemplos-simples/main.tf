terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0.0"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_077d7e19c740bb0ce2ed61c0552e755e28e919906dc218567b743b228314585e"
}

module "wp-stack" {
  source      = "rafaferreira011/wp_do/digitalocean"
  version     = "1.0.0"
  region      = var.region
  vms_ssh     = digitalocean_ssh_key.ssh.fingerprint
  wp_vm_count = var.wp_vm_count
}

resource "digitalocean_ssh_key" "ssh" {
  name       = "wp-ssh"
  public_key = file("~/.ssh/id_rsa.pub")
}