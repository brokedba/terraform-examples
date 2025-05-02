# Description: This file contains the configuration for deploying Grafana on Kubernetes using Helm. 
# Namespace
resource "kubernetes_namespace" "landing_ns" {
  depends_on = [local_file.cluster-config]
  metadata {
    name = var.kubernetes_namespace
  }
}



# Create namespace cluster-tools for supporting services
resource "kubernetes_namespace" "cluster_tools" {
  metadata {
    name = var.cluster_tools_namespace
    # allow for privileged prometheus-node-exporter to scrape Hostnetwork & HostPID metrics
    labels = {
      "pod-security.kubernetes.io/enforce" = "privileged"
    }
  }

  count = local.use_cluster_tools_namespace ? 1 : 0

}

locals {
  # Helm repos
  helm_repository = {
    ingress_nginx          = "https://kubernetes.github.io/ingress-nginx"
    ingress_nginx_version  = "4.11.2" #"4.6.1"
    jetstack               = "https://charts.jetstack.io" # cert-manager
    jetstack_version       = "1.15.3" #"1.12.0"           # cert-manager
    grafana                = "https://grafana.github.io/helm-charts"
    grafana_version        = "8.4.8" #"8.13.1"
    prometheus             = "https://prometheus-community.github.io/helm-charts"
    prometheus_version     =  "27.11.0" # "25.26.0"
    metrics_server         = "https://kubernetes-sigs.github.io/metrics-server"
    metrics_server_version = "3.12.1" #"3.12.2"
  }
  use_cluster_tools_namespace = anytrue([var.grafana_enabled, var.prometheus_enabled]) ? true : false
}

