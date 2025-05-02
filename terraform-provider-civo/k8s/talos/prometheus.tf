 
# Prometheus Helm chart
## https://github.com/prometheus-community/helm-charts/blob/main/charts/prometheus/README.md
# Node Exporter Deployment Configuration
## https://artifacthub.io/packages/helm/prometheus-community/prometheus
#  Default traefik prometheus metrics entrypoint is on port 8080, at the path /metrics internally.
# PodSecurityPolicy (PSP) has been deprecated since Kubernetes v1.21 and was fully removed in v1.25:
# Pod Security Admission (PSA) mechanism is too open (namespaced)
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = local.helm_repository.prometheus
  chart      = "prometheus"
  version    = local.helm_repository.prometheus_version
  namespace  = kubernetes_namespace.cluster_tools[0].id
  wait       = false

  values = [
    <<EOF
extraScrapeConfigs: |
  - job_name: 'traefik'
    metrics_path: /metrics
    scrape_interval: 10s
    static_configs:
      - targets:
          - traefik.traefik.svc.cluster.local:9100

nodeExporter:
  hostRootfs: false
  containerSecurityContext:
    privileged: true
    allowPrivilegeEscalation: true
    runAsUser: 0
    runAsGroup: 0  
EOF
  ]

  count = var.prometheus_enabled ? 1 : 0
}



####################################
# Metrics Server for the HPA
## https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/README.md
## https://artifacthub.io/packages/helm/metrics-server/metrics-server
####################################
resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = local.helm_repository.metrics_server
  chart      = "metrics-server"
  version    = local.helm_repository.metrics_server_version
  namespace  = "kube-system" # kubernetes_namespace.cluster_tools.id # Workaround to run on 1.24
  wait       = false

  set {
    name  = "args"
    value = "{--kubelet-insecure-tls,--kubelet-preferred-address-types=InternalIP}"
  }

  count = var.metrics_server_enabled ? 1 : 0
}