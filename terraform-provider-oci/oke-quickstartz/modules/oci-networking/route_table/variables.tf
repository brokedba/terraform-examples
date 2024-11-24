# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

variable "compartment_ocid" {}
variable "vcn_id" {}
variable "route_table_name" {}
variable "create_route_table" {
  default     = false
  description = "Creates a new route table. If false, bypass the creation."
}
variable "display_name" {
  default     = null
  description = "Display name for the subnet."
}
variable "route_rules" {
  type = list(object({
    description       = string
    destination       = string
    destination_type  = string
    network_entity_id = string
  }))
  default = []
}
# Deployment Details + Freeform Tags + Defined Tags
variable "route_table_tags" {
  description = "Tags to be added to the route table resources"
}