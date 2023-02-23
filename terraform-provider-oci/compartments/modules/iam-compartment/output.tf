output "compartment_id" {
  description = "Compartment ocid"
  // This allows the compartment ID to be retrieved from the resource if it exists, and if not to use the data source.
  value = var.compartment_create ? element(concat(oci_identity_compartment.this.*.id, tolist([""])), 0) : lookup(local.compartment_ids[0], "id")
}

output "parent_compartment_id" {
  description = "Parent Compartment ocid"
  // This allows the compartment ID to be retrieved from the resource if it exists, and if not to use the data source.
  value = var.compartment_create ? element(concat(oci_identity_compartment.this.*.compartment_id, tolist([""])), 0) : lookup(local.parent_compartment_ids[0], "compartment_id")
}

output "compartment_name" {
  description = "Compartment name"
  value = var.compartment_name
}

output "compartment_description" {
  description = "Compartment description"
  value = var.compartment_description
}

/*
output "level_1_sub_compartments" {
  description = "compartment name, description, ocid, and parent ocid"
  value = {
    name        = module.level_1_sub_compartments.compartment_name,
    description = module.level_1_sub_compartments.compartment_description,
    ocid        = module.level_1_sub_compartments.compartment_id,
    parent      = module.level_1_sub_compartments.parent_compartment_id
  }
}

output "level_2_sub_compartments" {
  description = "compartment name, description, ocid, and parent ocid"
  value = {
    name        = module.level_2_sub_compartments.compartment_name,
    description = module.level_2_sub_compartments.compartment_description,
    ocid        = module.level_2_sub_compartments.compartment_id,
    parent      = module.level_2_sub_compartments.parent_compartment_id
  }
}
*/