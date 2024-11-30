variable "compartment_ocid" {}
# Network Details
variable "vcn_id" { description = "VCN OCID to deploy OKE Cluster" }
variable "k8s_endpoint_subnet_id" { description = "Kubernetes Endpoint Subnet OCID to deploy OKE Cluster" }
variable "cluster_workers_visibility" {
  default     = "Private"
  description = "The Kubernetes worker nodes that are created will be hosted in public or private subnet(s)"
}
variable "cluster_endpoint_visibility" {
  default     = "Public"
  description = "The Kubernetes cluster that is created will be hosted on a public subnet with a public IP address auto-assigned or on a private subnet. If Private, additional configuration will be necessary to run kubectl commands"
}

# Bastion details 
variable "bastion_cidr_block_allow_list" {
    default= "0.0.0.0/0"
}

variable "bastion_name" {
    default = "oke-Bastion"
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
    default = "oke-bastion-session1"
  
}

variable "public_ssh_key" {
  default     = ""
  description = "In order to access your private nodes with a public SSH key you will need to set up a bastion host (a.k.a. jump box). If using public nodes, bastion is not needed. Left blank to not import keys."
}
