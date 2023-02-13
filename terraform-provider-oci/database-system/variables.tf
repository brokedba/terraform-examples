
variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "region" {}
variable "fingerprint" {}
variable "user_ocid" {}
#variable "public_key_path" {}
variable "private_key_path" {}
variable "availability_domain" {
  default = "BahF:CA-TORONTO-1-AD-1"
    }    # CHANGE ME
variable "vcn_display_name" {
  default = "db-vcn"
}

variable "vcn_cidr" {
  default = "192.168.64.0/20"
}

variable "vcn_dns_label" {
  default = "terravcn"
}
# SUBNET INFO
variable "subnet_db_dns_label" {
  default = "dbsubnet"
}
variable "subnet_db_display_name" {
  default = "db-sub"
}
variable "subnet_app_dns_label" {
  default = "appsubnet"
}
variable "subnet_app_display_name" {
  default = "app-sub"
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
  default = "MYCDB"
}

variable "db_version" {
  default = "21.0.0.0"
}

/* 
valid list : 
11.2.0.4 or 11.2.0.4.201020 or 11.2.0.4.210119 or 11.2.0.4.210420 or 12.1.0.2 or 12.1.0.2.210420 or 12.1.0.2.210720 or 
12.1.0.2.211019 or 12.2.0.1 or 12.2.0.1.210420 or 12.2.0.1.210720 or 12.2.0.1.211019 or 18.0.0.0 or 18.13.0.0 or 
18.14.0.0 or 18.16.0.0 or 19.0.0.0 or 19.11.0.0 or 19.12.0.0 or 19.13.0.0 or 21.0.0.0 or 21.3.0.0 or 21.4.0.0.
*/

variable "db_home_display_name" {
  default = "DBHome19"
}

variable "db_disk_redundancy" {
  default = "HIGH"
}

variable "db_system_display_name" {
  default = "DBCSDEMO"
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
  default = "PDB1"
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

variable "db_system_cpu_core_count" {
default = "2"
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
  # default = "~/id_rsa_oci.pub"
}


##############
# Object Storage
##############
variable "bucket_name" {
  default = "Mybucket"
}

# Dictionary Locals
locals {
}

##########################
#   BASTION SERVICE
##########################

variable "bastion_cidr_block_allow_list" {
    default= "0.0.0.0/0"
}

variable "bastion_name" {
    default = "BastionMyDB"
}

variable "session_session_ttl_in_seconds" {
    default = "10800"
  
}

variable "session_target_resource_details_session_type" {
 default = ""
 }

variable "bastion_session_type" {
default = "PORT_FORWARDING"

}
variable "bastion_session_name" {
    default = "Session-Mybastion"
  
}

