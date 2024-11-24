# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

resource "oci_core_subnet" "subnet" {
  cidr_block                 = var.cidr_block
  compartment_id             = var.compartment_ocid
  display_name               = var.display_name
  dns_label                  = var.dns_label
  vcn_id                     = var.vcn_id
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic
  prohibit_internet_ingress  = var.prohibit_internet_ingress
  route_table_id             = var.route_table_id
  dhcp_options_id            = var.dhcp_options_id
  security_list_ids          = var.security_list_ids
  ipv6cidr_block             = var.ipv6cidr_block
  freeform_tags              = var.subnet_tags.freeformTags
  defined_tags               = var.subnet_tags.definedTags

  count = var.create_subnet ? 1 : 0
}