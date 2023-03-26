terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "web_page" {
  metadata {
    name = "web-page"
  }
  spec {
    replicas = 10

    selector {
      match_labels = {
        app = "web-page"
      }
    }
    template {
      metadata {
        labels = {
          app = "web-page"
        }
      }

      spec {
        container {
          image = "fabricioveronez/web-page:green"
          name  = "web-page"
        }
      }
    }
  }
}

resource "kubernetes_service" "web_page_service" {
  metadata {
    name = "web-page"
  }
  spec {
    selector = {
      app = kubernetes_deployment.web_page.spec.0.template.0.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "ClusterIP"
  }
}