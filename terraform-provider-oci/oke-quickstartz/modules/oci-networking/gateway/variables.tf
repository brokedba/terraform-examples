# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

variable "compartment_ocid" {}
variable "vcn_id" {}
# Internet Gateway
variable "create_internet_gateway" {
  default     = false
  description = "Create an internet gateway"
}
variable "internet_gateway_display_name" {
  default     = "Internet Gateway"
  description = "Display name for the internet gateway"
}
variable "internet_gateway_enabled" {
  default     = true
  description = "Whether the gateway is enabled upon creation."
}
variable "internet_gateway_route_table_id" {
  default     = null
  description = "The OCID of the route table the internet gateway will use."
}
# NAT Gateway
variable "create_nat_gateway" {
  default     = false
  description = "Create a NAT gateway"
}
variable "nat_gateway_display_name" {
  default     = "NAT Gateway"
  description = "Display name for the NAT gateway"
}
variable "nat_gateway_block_traffic" {
  default     = false
  description = "Whether the NAT gateway blocks traffic through it."
}
variable "nat_gateway_route_table_id" {
  default     = null
  description = "The OCID of the route table the NAT gateway will use."
}
variable "nat_gateway_public_ip_id" {
  default     = null
  description = "The OCID of the public IP the NAT gateway will use."
}
# Service Gateway
variable "create_service_gateway" {
  default     = false
  description = "Create a service gateway"
}
variable "service_gateway_display_name" {
  default     = "Service Gateway"
  description = "Display name for the service gateway"
}
variable "service_gateway_route_table_id" {
  default     = null
  description = "The OCID of the route table the service gateway will use."
}
# Local Peering Gateway (LPG)
variable "create_local_peering_gateway" {
  default     = false
  description = "Create a local peering gateway"
}
variable "local_peering_gateway_display_name" {
  default     = "Local Peering Gateway"
  description = "Display name for the local peering gateway"
}
variable "local_peering_gateway_peer_id" {
  default     = null
  description = "The OCID of the LPG you want to peer with."
}
variable "local_peering_gateway_route_table_id" {
  default     = null
  description = "The OCID of the route table the local peering gateway will use."
}
# Deployment Details + Freeform Tags + Defined Tags
variable "gateways_tags" {
  description = "Tags to be added to the gateway resources"
}