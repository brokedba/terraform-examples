locals {
  node_size = coalesce(
    var.cluster_node_size,
    var.compute_type == "ai" ? element(data.civo_size.ai.sizes, 0).name : element(data.civo_size.standard.sizes, 0).name
  )
  kubernetes_version = (
    length(data.civo_kubernetes_version.latest_talos.versions) > 0 ?
    coalesce(var.kubernetes_version, data.civo_kubernetes_version.latest_talos.versions[0].version) :
    var.kubernetes_version
  )
}

resource "civo_kubernetes_cluster" "cluster" {
  name                = "${var.cluster_name_prefix}-cluster"
  cluster_type        = var.cluster_type
  kubernetes_version  = local.kubernetes_version
  network_id          = local.network_id #  if not declare we use the default one
  firewall_id         = civo_firewall.firewall.id
  region              = var.region
 
  cni                 = var.cni  # Talos cluster type only support "flannel"

  write_kubeconfig    = true
  applications        = var.cluster_type == "talos" ? "" : var.applications  # "civo-cluster-autoscaler"  applications = var.applications
  
  pools {
    node_count = var.cluster_node_count
    size       = local.node_size
    label = var.label  # "my-pool-label" This label will be set as an annotation on the nodes in the pool
    # labels              = var.node_pool_labels
    # taints = var.taints 
  }
  timeouts {
    create = "5m"
  }
# tags = var.tags
#  lifecycle {
#     ignore_changes = [ kubernetes_version]
#  }
}

resource "local_file" "cluster-config" {
  content              = civo_kubernetes_cluster.cluster.kubeconfig
  filename             = "${path.module}/kubeconfig"
  file_permission      = "0600"
  directory_permission = "0755"
}