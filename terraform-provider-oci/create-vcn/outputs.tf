
    output "vcn_id" {
      description = "OCID of created VCN. "
      value       = oci_core_vcn.vcnterra.id
    }
    
    output "default_security_list_id" {
      description = "OCID of default security list. "
      value       = oci_core_vcn.vcnterra.default_security_list_id
    }
    
    output "default_dhcp_options_id" {
      description = "OCID of default DHCP options. "
      value       = oci_core_vcn.vcnterra.default_dhcp_options_id
    }
    
    output "default_route_table_id" {
      description = "OCID of default route table. "
      value       = oci_core_vcn.vcnterra.default_route_table_id
    }
    
    output "internet_gateway_id" {
      description = "OCID of internet gateway. "
      value       = oci_core_internet_gateway.gtw.id
    }
    
    output "subnet_ids" {
      description = "ocid of subnet ids. "
      value       = oci_core_subnet.terrasub.*.id
    }
    