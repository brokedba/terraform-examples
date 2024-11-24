# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_ocid
  display_name   = var.display_name
  vcn_id         = var.vcn_id
  freeform_tags  = var.security_list_tags.freeformTags
  defined_tags   = var.security_list_tags.definedTags

  dynamic "egress_security_rules" {
    for_each = var.egress_security_rules
    content {
      description      = egress_security_rules.value.description
      destination      = egress_security_rules.value.destination
      destination_type = egress_security_rules.value.destination_type
      protocol         = egress_security_rules.value.protocol
      stateless        = egress_security_rules.value.stateless

      dynamic "tcp_options" {
        for_each = (egress_security_rules.value.tcp_options.max != -1 && egress_security_rules.value.tcp_options.min != -1) ? [1] : []
        content {
          max = egress_security_rules.value.tcp_options.max
          min = egress_security_rules.value.tcp_options.min
          dynamic "source_port_range" {
            for_each = can(egress_security_rules.value.tcp_options.source_port_range.max) ? [1] : []
            content {
              max = egress_security_rules.value.tcp_options.source_port_range.max
              min = egress_security_rules.value.tcp_options.source_port_range.min
            }
          }
        }
      }
      dynamic "udp_options" {
        for_each = (egress_security_rules.value.udp_options.max != -1 && egress_security_rules.value.udp_options.min != -1) ? [1] : []
        content {
          max = egress_security_rules.value.udp_options.max
          min = egress_security_rules.value.udp_options.min
          dynamic "source_port_range" {
            for_each = can(egress_security_rules.value.udp_options.source_port_range.max) ? [1] : []
            content {
              max = egress_security_rules.value.udp_options.source_port_range.max
              min = egress_security_rules.value.udp_options.source_port_range.min
            }
          }
        }
      }
      dynamic "icmp_options" {
        for_each = can(egress_security_rules.value.icmp_options.type) ? [1] : []
        content {
          type = egress_security_rules.value.icmp_options.type
          code = egress_security_rules.value.icmp_options.code
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = var.ingress_security_rules
    content {
      description = ingress_security_rules.value.description
      source      = ingress_security_rules.value.source
      source_type = ingress_security_rules.value.source_type
      protocol    = ingress_security_rules.value.protocol
      stateless   = ingress_security_rules.value.stateless

      dynamic "tcp_options" {
        for_each = (ingress_security_rules.value.tcp_options.max != -1 && ingress_security_rules.value.tcp_options.min != -1) ? [1] : []
        content {
          max = ingress_security_rules.value.tcp_options.max
          min = ingress_security_rules.value.tcp_options.min
          dynamic "source_port_range" {
            for_each = can(ingress_security_rules.value.tcp_options.source_port_range.max) ? [1] : []
            content {
              max = ingress_security_rules.value.tcp_options.source_port_range.max
              min = ingress_security_rules.value.tcp_options.source_port_range.min
            }
          }
        }
      }
      dynamic "udp_options" {
        for_each = (ingress_security_rules.value.udp_options.max != -1 && ingress_security_rules.value.udp_options.min != -1) ? [1] : []
        content {
          max = ingress_security_rules.value.udp_options.max
          min = ingress_security_rules.value.udp_options.min
          dynamic "source_port_range" {
            for_each = can(ingress_security_rules.value.udp_options.source_port_range.max) ? [1] : []
            content {
              max = ingress_security_rules.value.udp_options.source_port_range.max
              min = ingress_security_rules.value.udp_options.source_port_range.min
            }
          }
        }
      }
      dynamic "icmp_options" {
        for_each = can(ingress_security_rules.value.icmp_options.type) ? [1] : []
        content {
          type = ingress_security_rules.value.icmp_options.type
          code = ingress_security_rules.value.icmp_options.code
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [freeform_tags, defined_tags, egress_security_rules, ingress_security_rules]
  }

  count = var.create_security_list ? 1 : 0
}