# Create a firewall
resource "civo_firewall" "firewall" {
  name                 = "${var.cluster_name_prefix}-firewall"
  create_default_rules = false
  network_id           = local.network_id

  ingress_rule {
    label      = "kubernetes-api-server"
    protocol   = "tcp"
    port_range = "6443"
    cidr       = var.kubernetes_api_access
    action     = "allow"
  }
    egress_rule {
    label      = "all"
    protocol   = "tcp"
    port_range = "1-65535"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}
