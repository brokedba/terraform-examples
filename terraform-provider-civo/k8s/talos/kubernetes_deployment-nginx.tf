resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "default"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        nginx = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          nginx = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "nginx"
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
