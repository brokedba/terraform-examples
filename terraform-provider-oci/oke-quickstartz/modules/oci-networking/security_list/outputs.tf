# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "security_list_id" {
  value       = var.create_security_list ? oci_core_security_list.security_list[0].id : null
  description = "The OCID of the security list."
}
output "security_list_name" {
  value       = var.security_list_name
  description = "The reference name of the security list. (Not the display name)"
}