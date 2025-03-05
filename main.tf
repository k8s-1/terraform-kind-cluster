terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.8.0"
    }
  }
}

# Configure the Kind Provider
provider "kind" {}

# Create a Kind cluster
resource "kind_cluster" "default" {
  name           = "test-cluster"
  wait_for_ready = true
  node_image     = "kindest/node:v1.32.2"
}

provider "kubernetes" {
  host = kind_cluster.default.endpoint

  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
}

resource "kubernetes_pod" "example" {
  metadata {
    name = "example-pod"
  }

  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
      port {
        container_port = 80
      }
    }
  }
}
