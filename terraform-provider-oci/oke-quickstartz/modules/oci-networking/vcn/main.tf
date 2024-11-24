# Copyright (c) 2021, 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

resource "oci_core_vcn" "main" {
  cidr_blocks             = var.cidr_blocks
  compartment_id          = var.compartment_ocid
  display_name            = var.display_name
  dns_label               = var.dns_label
  freeform_tags           = var.vcn_tags.freeformTags
  defined_tags            = var.vcn_tags.definedTags
  is_ipv6enabled          = var.is_ipv6enabled
  ipv6private_cidr_blocks = var.ipv6private_cidr_blocks

  count = var.create_new_vcn ? 1 : 0
}