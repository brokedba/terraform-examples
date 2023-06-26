#########################################################
# Public IPs.
# Author Brokedba https://twitter.com/BrokeDba
#########################################################
provider "oci" {
  alias            = "primary"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

provider "oci" {
  alias            = "dr"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.dr_region
}
############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "dr_region" {}

######################
# locals : 
######################
# all cases in one map 
locals {
  ips = {
    primary_site = {  # key (display_name) => value (description)
      mgmt-public_ip-vm-a = "Public IP for Firewall Primary VM management Interface" 
      mgmt-public_ip-vm-b = "Public IP for Firewall Secondary VM management Interface" 
      untrust-floating-public_ip = "Floating Public IP for Firewall Untrust Interface" 
      untrust-floating-public_ip_frontend_1 = "Floating Public IP for Firewall Untrust Interface inbound (frontend cluster ip)"
    },
    dr_site = {
      dr-mgmt-public_ip-vm-c = "DR Public IP for Firewall Primary VM management Interface" 
      dr-mgmt-public_ip-vm-d = "DR Public IP for Firewall Secondary VM management Interface"
      dr-untrust-floating-public_ip = "DR Floating Public IP for Firewall Untrust Interface"
      dr-untrust-floating-public_ip_frontend_1 = "DR Floating Public IP for Firewall Untrust Interface inbound (frontend cluster ip)"
      }
}
}