
terraform {
  required_version = ">= 0.12.0"
}
#################
# VCN
#################

resource "oci_core_virtual_network" "vcnterra" {
  dns_label      = var.vcn_dns_label
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}

#################
# Storage Services
#################
data "oci_core_services" "oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}
data "oci_core_services" "object_storage_svcs" {
  filter {
    name   = "name"
    values = [".*Object.*Storage"]
    regex  = true
  }
}

######################
# Internet Gateway
######################    
resource "oci_core_internet_gateway" "igtw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcnterra.id
  display_name   = "terra-igw"
  enabled        = "true"
}
#####################
# NAT Gateway
#####################

resource "oci_core_nat_gateway" "natgw" {
  compartment_id = var.compartment_ocid
  display_name   = "${lower(var.vcn_display_name)}-natgw"
  vcn_id         = oci_core_virtual_network.vcnterra.id
  # defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}
########################
# Object Service gateway
########################
resource "oci_core_service_gateway" "obj-svcgw" {
  compartment_id = oci_core_virtual_network.vcnterra.compartment_id

  services {
    service_id = data.oci_core_services.object_storage_svcs.services[0]["id"]
  }

  vcn_id       = oci_core_virtual_network.vcnterra.id
  display_name = "${lower(var.vcn_display_name)}-obj-storage-svcgw"
}

/*  Service gateway if DBCS needed more than object storage access
resource "oci_core_service_gateway" "sg" {
  compartment_id = var.compartment_ocid
  services {
    service_id = data.oci_core_services.oci_services.services.0.id
  }
  display_name = "service-gateway"
  vcn_id       = oci_core_virtual_network.vcnterra.id
}
*/
#####################
# Dynamic Routing GW
#####################
resource "oci_core_drg" "drgw" {
  compartment_id = oci_core_virtual_network.vcnterra.compartment_id
  display_name   = "${lower(var.vcn_display_name)}-drgw"
}

resource "oci_core_drg_attachment" "drgw_attachment" {
  drg_id = oci_core_drg.drgw.id
  vcn_id = oci_core_virtual_network.vcnterra.id
}
######################
# Route Tables
######################       
#default
resource "oci_core_default_route_table" "rt" {
  manage_default_resource_id = oci_core_virtual_network.vcnterra.default_route_table_id
  /*   route_rules {
        destination       = Onprem_servers
        destination_type  = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.drgw.id
    }
    */
  route_rules {
    destination       = data.oci_core_services.object_storage_svcs.services[0]["cidr_block"]
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.obj-svcgw.id
  }

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.natgw.id
  }
}

resource "oci_core_route_table" "apprt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcnterra.id
  display_name   = "App-rt-table"
/* No need for a service gateway route for public subnets  
 # route_rules {
 #   destination       = lookup(data.oci_core_services.oci_services.services[0], "cidr_block")
 #   destination_type  = "SERVICE_CIDR_BLOCK"
 #   network_entity_id = oci_core_service_gateway.sg.id
 # }
 */
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igtw.id
  }

#     route_rules {
#    destination       = "0.0.0.0/0"
#    destination_type  = "CIDR_BLOCK"
#    network_entity_id = oci_core_nat_gateway.natgw.id
#  }
}

######################
# Security Lists
######################

resource "oci_core_security_list" "terra_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcnterra.id
  display_name   = "terra-sl"
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
  # ingress_security_rules {
  #   protocol = "6"
  #   source   = "0.0.0.0/0"

  #    tcp_options {
  #      min = 80
  #      max = 80
  #    }
  #  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.subnet_cidr2

    tcp_options {
      max = 1521
      min = 1521
    }
  }
}

resource "oci_core_security_list" "terraApp_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcnterra.id
  display_name   = "terra-sl"
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
        // Unrestricted access within local APP subnet
        protocol = "all"
        source   = var.subnet_cidr2
    }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"

    tcp_options {
      max = 1521
      min = 1521
    }
  }
}

######################
# Availability Domains
######################
data "oci_identity_availability_domains" "ad1" {
  compartment_id = var.compartment_ocid
}
######################
# Subnet
######################

resource "oci_core_subnet" "terraDB" {
  availability_domain        = data.oci_identity_availability_domains.ad1.availability_domains[0].name
  cidr_block                 = var.subnet_cidr
  display_name               = var.subnet_db_display_name
  prohibit_public_ip_on_vnic = false
  dns_label                  = var.subnet_db_dns_label #"${var.subnet_dns_label}${count.index + 1}"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcnterra.id
  route_table_id             = oci_core_default_route_table.rt.id
  security_list_ids          = ["${oci_core_security_list.terra_sl.id}"]
  dhcp_options_id            = oci_core_virtual_network.vcnterra.default_dhcp_options_id
  #security_list_ids   = ["${oci_core_virtual_network.vcnterra.default_security_list_id}"]
}

resource "oci_core_subnet" "terraApp" {
  availability_domain        = data.oci_identity_availability_domains.ad1.availability_domains[0].name
  cidr_block                 = var.subnet_cidr2
  display_name               = var.subnet_app_display_name
  prohibit_public_ip_on_vnic = false
  dns_label                  = var.subnet_app_dns_label #"(${var.subnet_dns_label})-2"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcnterra.id
  route_table_id             = oci_core_route_table.apprt.id
  security_list_ids          = ["${oci_core_security_list.terraApp_sl.id}"]
  dhcp_options_id            = oci_core_virtual_network.vcnterra.default_dhcp_options_id
  #security_list_ids   = ["${oci_core_virtual_network.vcnterra.default_security_list_id}"]
}


