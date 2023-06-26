# ---- Terraform Version and configuration_aliases [primary Toronto, DR Montreal]
terraform {
required_version = ">= 1.0.3"     
required_providers {
 oci = {
      source  = "oracle/oci"
      version = "4.105.0"
      configuration_aliases =  [ oci.primary, oci.dr ]
   }
  }
}
 
 resource "oci_core_public_ip" "primary_firewall_public_ip" {
    provider = oci.primary
    #Required
    for_each = local.ips.primary_site
    compartment_id = var.tenancy_ocid
    lifetime = "RESERVED"
    #Optional
    display_name = each.key
    # ---- Vnics aren't available yet, No assignment needed
    #assignedEntityId = oci_core_private_ip.test_private_ip.id
    #public_ip_pool_id = oci_core_public_ip_pool.test_public_ip_pool.id
}

 resource "oci_core_public_ip" "dr_firewall_public_ip" {
    provider = oci.dr
    #Required
    for_each = local.ips.dr_site
    compartment_id = var.tenancy_ocid
    lifetime = "RESERVED"
    #Optional
    display_name = each.key

}