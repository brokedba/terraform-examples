# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id
  display_name   = var.display_name
  freeform_tags  = var.route_table_tags.freeformTags
  defined_tags   = var.route_table_tags.definedTags

  dynamic "route_rules" {
    for_each = var.route_rules
    content {
      description       = route_rules.value.description
      destination       = route_rules.value.destination
      destination_type  = route_rules.value.destination_type
      network_entity_id = route_rules.value.network_entity_id
    }
  }

  count = var.create_route_table ? 1 : 0
}