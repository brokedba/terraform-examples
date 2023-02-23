output "main_compartment" {
  value = {
    Comp_name = oci_identity_compartment.iam_compartment_main.name
    comp_desc = oci_identity_compartment.iam_compartment_main.description
    comp_ocid = oci_identity_compartment.iam_compartment_main.id
  }
}

output "l1_sub_compartment" {
  value = {
    comp_name = module.level_1_sub_compartments[var.app_compartment_name].compartment_name

  }
}
output "l1_sub_compartments" {
  description = "Shows all level one subcompartments details "
  #value       = {for k,v in aws_security_group_rule.terra_sg_rule : k => v.to_port}
  value = { for comp, p in module.level_1_sub_compartments : comp => format("%s => Desc: %s", p.compartment_id, p.compartment_description) }
}

output "l2_sub_compartments" {
  description = "Shows all level one subcompartments details "
  #value       = {for k,v in aws_security_group_rule.terra_sg_rule : k => v.to_port}
  value = { for comp, p in module.level_2_sub_compartments : comp => format("%s => Desc: %s", p.compartment_id, p.compartment_description) }
}

output "comp-network-ocid" {
  value = module.level_1_sub_compartments["comp-network"].compartment_id
}

output "comp-security-ocid" {
  value = module.level_1_sub_compartments["comp-security"].compartment_id
}

output "comp-shared-ocid" {
  value = module.level_1_sub_compartments["comp-shared"].compartment_id
}
output "comp-app-ocid" {
  value = module.level_1_sub_compartments[var.app_compartment_name].compartment_id
}
output "comp-app-db-ocid" {
  value = module.level_2_sub_compartments["${var.app_compartment_name}-db"].compartment_id
}

output "comp-app-prod-ocid" {
  value = module.level_2_sub_compartments["${var.app_compartment_name}-prod"].compartment_id
}

output "comp-app-nprod-ocid" {
  value = module.level_2_sub_compartments["${var.app_compartment_name}-nprod"].compartment_id
}

output "comp-app-dr-ocid" {
  value = module.level_2_sub_compartments["${var.app_compartment_name}-dr"].compartment_id
}

 