provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "python-demo"
  }
}

resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "app-config"
    namespace = kubernetes_namespace.demo.metadata[0].name
  }

  data = {
    APP_MODE = "dev"
    OWNER    = "arqui"
  }
}