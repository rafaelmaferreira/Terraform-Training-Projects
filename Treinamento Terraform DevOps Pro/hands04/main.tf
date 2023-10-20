terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


provider "digitalocean" {
  token = var.do_token
}

#resource "digitalocean_droplet" "web" {
#}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "${var.k8s_name}-${terraform.workspace}"
  region  = var.region
  version = var.k8s_version

  node_pool {
    name       = "pool-zzgs1lerk"
    size       = var.k8s_node_size
    node_count = var.k8s_node_count
  }

  lifecycle {
    prevent_destroy = false
  }
}

variable "do_token" {
  type    = string
  default = "dop_v1_51d0672b81b095889c08095ce3c6ea79d62213c879a2307425fbee161c9ec510"
}



variable "region" {
  type    = string
  default = "nyc1"
}

variable "k8s_name" {
  type    = string
  default = "k8s-aula"
}
variable "k8s_version" {
  type    = string
  default = "1.26.3-do.0"
}

variable "k8s_node_size" {
  type    = string
  default = "s-2vcpu-4gb"
}

variable "k8s_node_count" {
  type    = number
  default = "3"
}