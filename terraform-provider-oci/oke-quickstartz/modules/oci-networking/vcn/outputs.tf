# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "vcn_id" {
  value = data.oci_core_vcn.main_or_existent.id
}
output "default_dhcp_options_id" {
  value = data.oci_core_vcn.main_or_existent.default_dhcp_options_id
}
output "compartment_id" {
  value = data.oci_core_vcn.main_or_existent.compartment_id
}
output "default_route_table_id" {
  value = data.oci_core_vcn.main_or_existent.default_route_table_id
}
output "default_security_list_id" {
  value = data.oci_core_vcn.main_or_existent.default_security_list_id
}
output "dns_label" {
  value = data.oci_core_vcn.main_or_existent.dns_label
}
output "display_name" {
  value = data.oci_core_vcn.main_or_existent.display_name
}
output "cidr_blocks" {
  value = data.oci_core_vcn.main_or_existent.cidr_blocks
}
output "byoipv6cidr_blocks" {
  value = data.oci_core_vcn.main_or_existent.byoipv6cidr_blocks
}
output "ipv6cidr_blocks" {
  value = data.oci_core_vcn.main_or_existent.ipv6cidr_blocks
}
output "ipv6private_cidr_blocks" {
  value = data.oci_core_vcn.main_or_existent.ipv6private_cidr_blocks
}
output "vcn_domain_name" {
  value = data.oci_core_vcn.main_or_existent.vcn_domain_name
}
