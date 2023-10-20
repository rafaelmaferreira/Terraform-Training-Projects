terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
    }  
}

resource "helm_release" "example" {
  name             = "nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.6.0"
  namespace        = "nginx-ingress"
  create_namespace = true
}
