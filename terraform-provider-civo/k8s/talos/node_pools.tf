# Add a node pool
# resource "civo_kubernetes_node_pool" "back-end" {
#    cluster_id = civo_kubernetes_cluster.my-cluster.id
#    label = "back-end" // Optional
#    node_count = var.cluster_node_count
#    size = element(data.civo_size.xsmall.sizes, 0).name // var.cluster_node_size
#    region = var.region

#    labels = {
#      service  = "backend"
#      priority = "high"
#    }

#   taint {
#     key    = "workloadKind"
#     value  = "database"
#     effect = "NoSchedule"
#   }

#   taint {
#     key    = "workloadKind"
#     value  = "frontend"
#     effect = "NoSchedule"
#   }
# }
