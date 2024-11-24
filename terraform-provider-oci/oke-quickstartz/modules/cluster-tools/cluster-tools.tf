# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

# Create namespace cluster-tools for supporting services
resource "kubernetes_namespace" "cluster_tools" {
  metadata {
    name = var.cluster_tools_namespace
  }

  count = local.use_cluster_tools_namespace ? 1 : 0
}

locals {
  # Helm repos
  helm_repository = {
    ingress_nginx          = "https://kubernetes.github.io/ingress-nginx"
    ingress_nginx_version  = "4.6.1"
    jetstack               = "https://charts.jetstack.io" # cert-manager
    jetstack_version       = "1.12.0"                     # cert-manager
    grafana                = "https://grafana.github.io/helm-charts"
    grafana_version        = "6.56.5"
    prometheus             = "https://prometheus-community.github.io/helm-charts"
    prometheus_version     = "22.6.2"
    metrics_server         = "https://kubernetes-sigs.github.io/metrics-server"
    metrics_server_version = "3.10.0"
  }
  use_cluster_tools_namespace = anytrue([var.grafana_enabled, var.ingress_nginx_enabled, var.cert_manager_enabled, var.prometheus_enabled]) ? true : false
}

# OCI Provider
variable "tenancy_ocid" {}
# variable "compartment_ocid" {}
variable "region" {}

# Namespace
variable "cluster_tools_namespace" {
  default = "cluster-tools"
}