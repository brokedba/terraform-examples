provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "main_compartment_name" {
  default = "mycomp"
}
variable "main_compartment_desc" {
  default = "Enclosing compartment at root level"
}

variable "app_compartment_name" {
  default = "comp-app"
}
######################
# locals : compartment 
######################
# all cases in one map 
locals {
  compartments = {
    l1_subcomp = {
      comp-shared                = "for shared services like AD, Commvault,Monitoring"
      comp-network               = "for all FW, VCNs and LBRs"
      comp-security              = "for Security related resources like Vaults, keys"
      (var.app_compartment_name) = "Parent compartment for all application resources"
    },
    l2_subcomp = {
      "${var.app_compartment_name}-prod"  = " production VMs"
      "${var.app_compartment_name}-nprod" = "non-production VMs"
      "${var.app_compartment_name}-dr"    = "DR VMs"
      "${var.app_compartment_name}-db"    = "Database instances and resources"
    }
  }
}


############################
# Additional Configuration #
############################