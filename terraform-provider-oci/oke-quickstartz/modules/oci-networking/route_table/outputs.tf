# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "route_table_id" {
  value       = var.create_route_table ? oci_core_route_table.route_table[0].id : null
  description = "The OCID of the Route Table."
}