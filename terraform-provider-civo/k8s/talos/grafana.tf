

# Grafana Helm chart
## https://github.com/grafana/helm-charts/blob/main/charts/grafana/README.md
## https://artifacthub.io/packages/helm/grafana/grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = local.helm_repository.grafana
  chart      = "grafana"
  version    = local.helm_repository.grafana_version
  namespace  = kubernetes_namespace.cluster_tools[0].id
  wait       = false

  set {
    name  = "grafana\\.ini.server.root_url"
    value = "%(protocol)s://%(domain)s:%(http_port)s/grafana"
    type  = "string"
  }

  # set {
  #   name  = "grafana\\.ini.server.serve_from_sub_path"
  #   value = "true"
  # }

  values = [
    <<EOF
dashboards:
  default:
    k8s-cluster:
      gnetId: 7249
      revision: 1
      datasource: Prometheus
    k8s-cluster-metrics:
      gnetId: 11663
      revision: 1
      datasource: Prometheus
    k8s-cluster-metrics-simple:
      gnetId: 6417
      revision: 1
      datasource: Prometheus
    k8s-pods-monitoring:
      gnetId: 13498
      revision: 1
      datasource: Prometheus
    k8s-memory:
      gnetId: 13421
      revision: 1
      datasource: Prometheus
    k8s-networking:
      gnetId: 12658
      revision: 1
      datasource: Prometheus
    k8s-cluster-autoscaler:
      gnetId: 3831
      revision: 1
      datasource: Prometheus
    k8s-hpa:
      gnetId: 10257
      revision: 1
      datasource: Prometheus
    k8s-pods:
      gnetId: 6336
      revision: 1
      datasource: Prometheus
    spring-boot:
      gnetId: 12464
      revision: 2
      datasource: Prometheus
    nginx-ingress-controller:
      gnetId: 9614
      revision: 1
      datasource: Prometheus
dashboardProviders:
   dashboardproviders.yaml:
     apiVersion: 1
     providers:
     - name: 'default'
       orgId: 1
       folder: ''
       type: file
       disableDeletion: true
       editable: true
       options:
         path: /var/lib/grafana/dashboards/default
sidecar:
  datasources:
    enabled: true
    label: grafana_datasource
  dashboards:
    enabled: true
    label: grafana_dashboard
persistence:
  enabled: true
plugins:
  - grafana-kubernetes-app
  - grafana-worldmap-panel
  - grafana-piechart-panel
  - btplc-status-dot-panel
datasources: 
  datasources.yaml:
    apiVersion: 1
    datasources:
    - name: Prometheus
      type: prometheus
      url: http://prometheus-server.${kubernetes_namespace.cluster_tools[0].id }.svc.cluster.local
      access: proxy
      isDefault: true
      disableDeletion: true
      editable: false
EOF
  ]

  count = var.grafana_enabled ? 1 : 0
}
# Grafana Middleware replacement for the nginx rewrite annotation
## https://doc.traefik.io/traefik/middlewares/http/stripprefix/
 # replace namespace with full value if issues after apply
resource "kubectl_manifest" "grafana_replace_path" {
  count = var.grafana_enabled ? 1 : 0
  yaml_body = <<YAML
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: grafana-replace-path
  namespace: "${kubernetes_namespace.cluster_tools[0].id}"
spec:
  replacePathRegex:
    regex: "^/grafana(/|$)(.*)"
    replacement: "/$2"
YAML

  depends_on = [helm_release.traefik_ingress, kubernetes_namespace.cluster_tools]
}
## Grafana Ingress
####  Grafana will match requests that:
#  - Start with `/grafana`.
#  - Optionally have a `/` or nothing (`$`) after `/grafana`.
#  - Optionally have additional characters after `/grafana(/|$)`.
## ### Examples of Matching Paths:
# - `/grafana`   
# - `/grafana/`
# - `/grafana/some/path`
# - `/grafana?query=1`
resource "kubernetes_ingress_v1" "grafana" {
  wait_for_load_balancer = true
  metadata {
    name        = "grafana"
    namespace   = kubernetes_namespace.cluster_tools[0].id
    annotations = {
      "kubernetes.io/ingress.class"               = "traefik"
      "cert-manager.io/cluster-issuer"            = "letsencrypt-prod"
      "traefik.ingress.kubernetes.io/router.middlewares" = "${kubernetes_namespace.cluster_tools[0].id}-grafana-replace-path@kubernetescrd"
      "acme.cert-manager.io/http01-edit-in-place"      = "true"
    }
  }

  spec {
    ingress_class_name = "traefik"
    rule {
      http {
        path {
          path      = "/grafana"
          path_type = "Prefix"
          backend {
            service {
              name = "grafana"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    dynamic "rule" {
      for_each = local.ingress_hosts
      content {
        host = rule.value
        http {
          path {
            path      = "/grafana"
            path_type = "Prefix"
            backend {
              service {
                name = "grafana"
                port {
                  number = 80
                }
              }
            }
          }
        }
      }
    }

    tls {
      secret_name = "grafana-${var.ingress_cluster_issuer}-tls"
      hosts       = local.ingress_hosts
    }
  }
  depends_on = [
    helm_release.traefik_ingress, helm_release.grafana, 
    helm_release.cert_manager, kubectl_manifest.letsencrypt_prod_issuer,
    kubectl_manifest.grafana_replace_path[0],
    null_resource.wait_for_letsencrypt_prod_issuer_ready,
    civo_firewall.firewall-ingress 
       ]

  count = (var.grafana_enabled ) ? 1 : 0
lifecycle {
  ignore_changes = [
    spec[0].rule,
    spec[0].tls[0].hosts
  ]
}

}
## Kubernetes Secret: Grafana Admin Password
data "kubernetes_secret" "grafana" {
  metadata {
    name      = "grafana"
    namespace = kubernetes_namespace.cluster_tools.0.id
  }
  depends_on = [helm_release.grafana]

  count = var.grafana_enabled ? 1 : 0
}

locals {
  grafana_admin_password = var.grafana_enabled ? data.kubernetes_secret.grafana.0.data.admin-password : "Grafana_Not_Deployed"
}

output "grafana_admin_password" {
  value     = var.grafana_enabled ? local.grafana_admin_password : null
  sensitive = true
}


# Local Variables
locals {
  # Generate ingress hosts by splitting the provided variable and optionally appending a nip.io domain
  ingress_hosts = compact(
    concat(
      split(",", var.ingress_hosts),var.ingress_hosts_include_nip_io ? [format("%s.%s.%s", substr(lower(replace(var.app_name, "/\\W|_|\\s/", "")), 0, 6), local.ingress_controller_load_balancer_ip_hex, var.nip_io_domain)] : []
    )
  )
# Local Variable for Load Balancer IP in Hex
   load_balancer_hostname = data.kubernetes_service.traefik.status[0].load_balancer.0.ingress.0.hostname
   ingress_controller_load_balancer_ip     =  data.kubernetes_service.traefik.status[0].load_balancer.0.ingress.0.hostname  
   ingress_controller_load_balancer_ip_hex = join("", formatlist("%02x", split(".", data.kubernetes_service.traefik.status[0].load_balancer.0.ingress.0.ip))) 
   ingress_controller_load_balancer_hostname = var.ingress_hosts != "" ? local.ingress_hosts[0] : (var.ingress_hosts_include_nip_io ? local.app_nip_io_domain : local.ingress_controller_load_balancer_ip)
   app_nip_io_domain = ( var.ingress_hosts_include_nip_io) ? format("${local.app_name_for_dns}.%s.${var.nip_io_domain}", local.ingress_controller_load_balancer_ip_hex) : ""
  # Application name normalized for DNS to generate nip.io domains
   app_name_for_dns  = substr(lower(replace(local.app_name, "/\\W|_|\\s/", "")), 0, 6)
   app_name          = var.app_name
}




