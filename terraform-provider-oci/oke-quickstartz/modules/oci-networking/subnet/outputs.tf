# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "subnet_id" {
  value       = var.create_subnet ? oci_core_subnet.subnet[0].id : null
  description = "The OCID of the subnet."
}
output "subnet_name" {
  value       = var.subnet_name
  description = "The reference name of the subnet. (Not the display name)"
}