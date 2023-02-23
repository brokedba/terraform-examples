# ---- Terraform Version
terraform {
  required_version = ">= 1.0.3" # ">= 0.12, < 0.13" this example is intended to run with Terraform v0.12
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.105.0"
    }
  }
}
#########################################################
# compartement and two sub-compartemnt using iam modules.
# Author Brokedba https://twitter.com/BrokeDba
#########################################################

#module "iam" {
#  source  = "oracle-terraform-modules/iam/oci"
#  version = "2.0.2"
#}


resource "oci_identity_compartment" "iam_compartment_main" {
  #Required
  compartment_id = var.tenancy_ocid
  description    = var.main_compartment_desc
  name           = var.main_compartment_name
  #Optional
  #    defined_tags = {"Operations.CostCenter"= "42"}
  #    freeform_tags = {"Department"= "Finance"}
}


module "level_1_sub_compartments" {
  source   = "./modules/iam-compartment"
  for_each = local.compartments.l1_subcomp
  #tenancy_ocid            = var.tenancy_ocid # optional
  compartment_id          = oci_identity_compartment.iam_compartment_main.id # define the parent compartment. Here we make reference to the previous module
  compartment_name        = each.key
  compartment_description = each.value
  compartment_create      = true # if false, a data source with a matching name is created instead
  enable_delete           = true # if false, on `terraform destroy`, compartment is deleted from the terraform state but not from oci 
}

data "oci_identity_compartments" "app_comp" {
  #Required
  compartment_id = oci_identity_compartment.iam_compartment_main.id
  #Optional
  #compartment_id_in_subtree = true
  name       = var.app_compartment_name
  depends_on = [module.level_1_sub_compartments, ]
}


module "level_2_sub_compartments" {
  source                  = "./modules/iam-compartment"
  for_each                = local.compartments.l2_subcomp
  compartment_id          = data.oci_identity_compartments.app_comp.compartments[0].id # define the parent compartment. Here we make reference to the previous module
  compartment_name        = each.key
  compartment_description = each.value
  compartment_create      = true # if false, a data source with a matching name is created instead
  enable_delete           = true # if false, on `terraform destroy`, compartment is deleted from the terraform state but not from oci 

  depends_on = [module.level_1_sub_compartments, ]
}
