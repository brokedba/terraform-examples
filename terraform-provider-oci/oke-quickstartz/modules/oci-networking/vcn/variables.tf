# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

variable "compartment_ocid" {}
variable "create_new_vcn" {
  default     = true
  description = "Creates a new Virtual Cloud Network (VCN). If false, the VCN OCID must be provided in the variable 'existent_vcn_ocid'."
}
variable "existent_vcn_ocid" {
  default     = ""
  description = "Using existent Virtual Cloud Network (VCN) OCID."
}
variable "cidr_blocks" {
  default     = ["10.20.0.0/16"]
  description = "IPv4 CIDR Blocks for the Virtual Cloud Network (VCN). If use more than one block, separate them with comma. e.g.: 10.20.0.0/16,10.80.0.0/16"
}
variable "display_name" {
  default     = "Dev VCN 1"
  description = "Display name for the Virtual Cloud Network (VCN)."
}
variable "dns_label" {
  default     = "vcn1"
  description = "DNS Label for Virtual Cloud Network (VCN)."
}
variable "is_ipv6enabled" {
  default     = false
  description = "Whether IPv6 is enabled for the Virtual Cloud Network (VCN)."
}
variable "ipv6private_cidr_blocks" {
  default     = []
  description = "The list of one or more ULA or Private IPv6 CIDR blocks for the Virtual Cloud Network (VCN)."
}

# Deployment Details + Freeform Tags + Defined Tags
variable "vcn_tags" {
  description = "Tags to be added to the VCN resources"
}