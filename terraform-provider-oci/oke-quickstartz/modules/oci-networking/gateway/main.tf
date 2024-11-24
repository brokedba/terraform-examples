# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

resource "oci_core_internet_gateway" "gateway" {
  compartment_id = var.compartment_ocid
  display_name   = var.internet_gateway_display_name
  enabled        = var.internet_gateway_enabled
  vcn_id         = var.vcn_id
  route_table_id = var.internet_gateway_route_table_id
  freeform_tags  = var.gateways_tags.freeformTags
  defined_tags   = var.gateways_tags.definedTags

  count = var.create_internet_gateway ? 1 : 0
}

resource "oci_core_nat_gateway" "gateway" {
  block_traffic  = var.nat_gateway_block_traffic
  compartment_id = var.compartment_ocid
  display_name   = var.nat_gateway_display_name
  vcn_id         = var.vcn_id
  public_ip_id   = var.nat_gateway_public_ip_id
  route_table_id = var.nat_gateway_route_table_id
  freeform_tags  = var.gateways_tags.freeformTags
  defined_tags   = var.gateways_tags.definedTags

  count = var.create_nat_gateway ? 1 : 0
   lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"],
      defined_tags["Oracle-Tags.CreatedOn"],
    ]
  }
}

resource "oci_core_service_gateway" "gateway" {
  compartment_id = var.compartment_ocid
  display_name   = var.service_gateway_display_name
  vcn_id         = var.vcn_id
  route_table_id = var.service_gateway_route_table_id
  freeform_tags  = var.gateways_tags.freeformTags
  defined_tags   = var.gateways_tags.definedTags

  services {
    service_id = lookup(data.oci_core_services.all_services.services[0], "id")
  }

  count = var.create_service_gateway ? 1 : 0
}

resource "oci_core_local_peering_gateway" "gateway" {
  compartment_id = var.compartment_ocid
  display_name   = var.local_peering_gateway_display_name
  vcn_id         = var.vcn_id
  peer_id        = var.local_peering_gateway_peer_id
  route_table_id = var.local_peering_gateway_route_table_id
  freeform_tags  = var.gateways_tags.freeformTags
  defined_tags   = var.gateways_tags.definedTags

  count = var.create_local_peering_gateway ? 1 : 0
}