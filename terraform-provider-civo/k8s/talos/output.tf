output "kubernetes_cluster_name" {
  value = civo_kubernetes_cluster.cluster.name
}

output "master_ip" {
  value = civo_kubernetes_cluster.cluster.master_ip
}
output "kubernetes_cluster_endpoint" {
  value = civo_kubernetes_cluster.cluster.api_endpoint
}

output "kubernetes_cluster_id" {
  value = civo_kubernetes_cluster.cluster.id
}

output "kubernetes_cluster_status" {
  value = civo_kubernetes_cluster.cluster.status
}

output "kubernetes_cluster_ready" {
  value = civo_kubernetes_cluster.cluster.ready
}

output "kubernetes_cluster_version" {
  value = civo_kubernetes_cluster.cluster.kubernetes_version
}

output "network_id" {
  description = "The ID of the Civo Network."
  value       = local.network_id
}




output "cluster_installed_applications" {
  value = civo_kubernetes_cluster.cluster.installed_applications[*].application
}


output "ingress_controller_load_balancer_hostname" {
  value = data.kubernetes_service.traefik.status[0].load_balancer.0.ingress.0.hostname
}


output "grafana_url" {
  value =  local.app_nip_io_domain
}

# output "namespace_id" {
  
#   value = kubernetes_namespace.cluster_tools
# }

# Node pools
/* output "node_pool_instance_names" {
#   description = "List of instance names in each node pool."
#   value = {
#     for pool_key, pool in module.civo_node_pools :
#     pool_key => pool.instance_names
#   }
# }
output "node_pool_ids" {
  description = "List of IDs of the Civo Kubernetes Node Pools."
  value       = [for pool in module.civo_node_pools : pool.node_pool_id]
}
*/