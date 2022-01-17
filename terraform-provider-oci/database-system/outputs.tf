
output "vcn_id" {
  description = "OCID of created VCN. "
  value       = oci_core_virtual_network.vcnterra.id
}
output "vcn_name" {
  description = "The Name of the newly created vpc"
  value       = oci_core_virtual_network.vcnterra.display_name
}


output "Subnet_Name_DB" {
  description = "Name of created vcn's Subnet. "
  value       = oci_core_subnet.terraDB.display_name
}
output "Subnet_CIDR_DB" {
  description = "cidr block of vcn's Subnet. "
  value       = oci_core_subnet.terraDB.cidr_block
}


##  INSTANCE OUTPUT

output "hostname" {
  description = " id of created instances. "
  value       = oci_database_db_system.MYSYSDB.hostname
}

output "private_ip" {
  description = "Private IPs of created instances. "
  value       = oci_database_db_system.MYSYSDB.private_ip
}


output "DB_STATE" {
  value = oci_database_db_system.MYSYSDB.state
}

output "DB_Version" {
  value = oci_database_db_system.MYSYSDB.version

}
output "db_system_options" {
  value = oci_database_db_system.MYSYSDB.db_system_options

}
       
