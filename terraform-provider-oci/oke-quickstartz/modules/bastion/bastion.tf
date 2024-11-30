

resource "oci_bastion_bastion" "mybastion" {
    #Required
    bastion_type = "standard"
    compartment_id = var.compartment_ocid
    target_subnet_id = var.k8s_endpoint_subnet_id
    name = var.bastion_name
    client_cidr_block_allow_list = [var.bastion_cidr_block_allow_list]
/*
    #Optional
    client_cidr_block_allow_list = var.bastion_cidr_block_allow_list
    #defined_tags = {"foo-namespace.bar-key"= "value"}
    freeform_tags = {"bar-key"= "value"}
    max_session_ttl_in_seconds = "10800"
    phone_book_entry = var.bastion_phone_book_entry
   # static_jump_host_ip_addresses = var.bastion_static_jump_host_ip_addresses
*/
}


##################################
#    Bastion Session
##################################
resource "oci_bastion_session" "mybastion_session" {
    #Required
    bastion_id = oci_bastion_bastion.mybastion.id
    key_details {
        #Required
        public_key_content = file(var.ssh_public_key)
    }
    target_resource_details {
        #Required
        session_type = var.bastion_session_type

        #Optional
        target_resource_port = "22" #var.bastion_session_port
        target_resource_private_ip_address = "192.168.78.10"  # oci_database_db_system.MYDBSYS.private_ip
        # target_resource_id = oci_bastion_target_resource.test_target_resource.id      -->MANAGED_SSH
        # target_resource_operating_system_user_name = oci_identity_user.test_user.name -->MANAGED_SSH
    }

    #Optional
    display_name = var.bastion_session_name  #Session-Mybastion
    key_type = "PUB"
    session_ttl_in_seconds = var.session_session_ttl_in_seconds #"10800"
     
}