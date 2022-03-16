
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
  value       = oci_database_db_system.MYDBSYS.hostname
}

output "private_ip" {
  description = "Private IPs of created instances. "
  value       = oci_database_db_system.MYDBSYS.private_ip
}


output "DB_STATE" {
  value = oci_database_db_system.MYDBSYS.state
}

output "DB_Version" {
  value = oci_database_db_system.MYDBSYS.version

}
output "db_system_options" {
  value = oci_database_db_system.MYDBSYS.db_system_options

}

######### 
# BASTION
#########

output "bastion_name" {
  value = oci_bastion_session.mybastion_session.bastion_name 

}

output "bastion_session_name" {
  value = oci_bastion_session.mybastion_session.display_name

}

/*output "Bastion_session_key_details" {
  value = oci_bastion_session.mybastion_session.key_details
}
*/
output "bastion_session_state" {
  value = oci_bastion_session.mybastion_session.state

}

output "bastion_session_target_resource_details" {
  value = oci_bastion_session.mybastion_session.target_resource_details

}

output "bastion_session_ssh_connection" {
  value = oci_bastion_session.mybastion_session.ssh_metadata.command

} 

 
/*
output "bastion_session_target_IP" {
  value = oci_bastion_session.mybastion_session.target_resource_private_ip_address

}

output "bastion_session_target_port" {
  value = oci_bastion_session.mybastion_session.target_resource_port 

}
 
*/
