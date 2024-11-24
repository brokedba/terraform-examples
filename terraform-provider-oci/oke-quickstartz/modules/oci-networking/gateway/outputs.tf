# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "internet_gateway_id" {
  value       = var.create_internet_gateway ? oci_core_internet_gateway.gateway[0].id : null
  description = "The OCID of the Internet Gateway."
}
output "nat_gateway_id" {
  value       = var.create_nat_gateway ? oci_core_nat_gateway.gateway[0].id : null
  description = "The OCID of the NAT Gateway."
}
output "service_gateway_id" {
  value       = var.create_service_gateway ? oci_core_service_gateway.gateway[0].id : null
  description = "The OCID of the Service Gateway."
}
output "local_peering_gateway_id" {
  value       = var.create_local_peering_gateway ? oci_core_local_peering_gateway.gateway[0].id : null
  description = "The OCID of the Local Peering Gateway."
}