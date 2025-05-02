resource "civo_network" "network" {
  count   = data.civo_network.existing.id == "" ? 1 : 0
  label   = var.network_name
  cidr_v4 = var.network_cidr
  region  = var.region
}

# Data Source: Attempt to retrieve existing network if network_id is provided
data "civo_network" "existing" {
  label    = var.network_name
  region   = var.region
}

# Local Variable: Determine the effective network ID
locals {
  network_id = data.civo_network.existing.id != "" ? data.civo_network.existing.id : civo_network.network[0].id
}