
variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "region" {}
variable "fingerprint" {}
variable "user_ocid" {}
variable "public_key_path" {}
variable "private_key_path" {}
variable "availability_domain" {}

variable "vcn_display_name" {
  default = "cin-vcn"
}

variable "vcn_cidr" {
  default = "192.168.64.0/20"
}

variable "vcn_dns_label" {
  default = "cin-vcn"
}
# SUBNET INFO
variable "subnet_dns_label" {
  default = "cin-subnet"
}
variable "subnet_display_name" {
  default = "cin-sub"
}

variable "subnet_cidr" {
  default = "192.168.78.0/24"
}
variable "subnet_cidr2" {
  default = "192.168.79.0/24"
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}
#################
# DB System
#################

variable "db_system_shape" {
  default = "VM.Standard2.4"
}

variable "db_edition" {
  default = "STANDARD_EDITION"
}

# VNIC INFO
variable "db_system_private_ip" {
  default = "192.168.78.10"
}
variable "db_admin_password" {
}

variable "db_name" {
  default = "FSCDB"
}

variable "db_version" {
  default = "19.9.0.0"
}

variable "db_home_display_name" {
  default = "DBHome19"
}

variable "db_disk_redundancy" {
  default = "HIGH"
}

variable "db_system_display_name" {
  default = "FSPRODEMO"
}

variable "hostname" {
  default = "hopsdb-oci"
}

variable "host_user_name" {
  default = "opc"
}

variable "n_character_set" {
  default = "AL16UTF16"
}

variable "character_set" {
  default = "WE8ISO8859P15"
}

variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "FSPROD"
}

variable "data_storage_size_in_gb" {
  default = "256"
}

variable "license_model" {
  default = "LICENSE_INCLUDED"
}

variable "node_count" {
  default = "1"
}

variable "data_storage_percentage" {
  default = "40"
}


variable "db_auto_backup_enabled" {
  default = "true"
}

variable "db_auto_backup_window" {
  default = "SLOT_TWO"
}

variable "db_recovery_window_in_days" {
  default = "45"
}

variable "ssh_public_key" {
  default = "~/id_rsa_oci.pub"
}


##############
# Object Storage
##############
variable "bucket_name" {
  default = "Cinbucket"
}

# Dictionary Locals
locals {
}

