# Create a firewall
resource "civo_firewall" "firewall-ingress" {
  name                 = "${var.cluster_name_prefix}-firewall-ingress"
  create_default_rules = false
  network_id           = local.network_id
  ingress_rule {
    protocol    = "tcp"
    port_range  = "80"
    cidr        = var.cluster_web_access
    label       = "web"
    action      = "allow"
  }

  ingress_rule {
    protocol    = "tcp"
    port_range   = "443"
    cidr        = var.cluster_websecure_access
    label       = "websecure"
    action      = "allow"
  }
}
