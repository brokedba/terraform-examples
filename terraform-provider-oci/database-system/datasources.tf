## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Get the latest Oracle Linux image


# Get DB node list
data "oci_database_db_nodes" "db_nodes1" {
  compartment_id = var.compartment_ocid
  db_system_id   = oci_database_db_system.MYDBSYS.id
}

## Get DB node details
data "oci_database_db_node" "db_node_details1" {
  db_node_id = data.oci_database_db_nodes.db_nodes1.db_nodes[0]["id"]
}


# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "db_node_vnic1" {
  vnic_id = data.oci_database_db_node.db_node_details1.vnic_id
}


data "oci_database_db_homes" "db_homes1" {
  compartment_id = var.compartment_ocid
  db_system_id   = oci_database_db_system.MYDBSYS.id
}


data "oci_database_databases" "databases1" {
  compartment_id = var.compartment_ocid
  db_home_id     = data.oci_database_db_homes.db_homes1.db_homes[0].db_home_id
}


data "oci_database_db_system_patches" "patches1" {
  db_system_id = oci_database_db_system.MYDBSYS.id
}

data "oci_database_db_system_patch_history_entries" "patches_history1" {
  db_system_id = oci_database_db_system.MYDBSYS.id
}


data "oci_database_db_home_patches" "patches1" {
  db_home_id = data.oci_database_db_homes.db_homes1.db_homes[0].db_home_id
}


data "oci_database_db_home_patch_history_entries" "patches_history1" {
  db_home_id = data.oci_database_db_homes.db_homes1.db_homes[0].db_home_id
}


data "oci_database_db_versions" "test_db_versions_by_db_system_id1" {
  compartment_id = var.compartment_ocid
  db_system_id   = oci_database_db_system.MYDBSYS.id
}


data "oci_database_db_system_shapes" "db_system_shapes" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid

  filter {
    name   = "shape"
    values = [var.db_system_shape]
  }
}

 
