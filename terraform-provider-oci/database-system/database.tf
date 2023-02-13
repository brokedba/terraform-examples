
resource "oci_database_db_system" "MYDBSYS" {
  availability_domain = data.oci_identity_availability_domains.ad1.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  #cpu_core_count      = data.oci_database_db_system_shapes.db_system_shapes.db_system_shapes[0]["minimum_core_count"]
  database_edition = var.db_edition

  db_home {
    database {
      admin_password = var.db_admin_password
      db_name        = var.db_name
      pdb_name       = var.pdb_name
      character_set  = var.character_set
      ncharacter_set = var.n_character_set
      db_workload    = var.db_workload
      db_backup_config {
        auto_backup_enabled     = var.db_auto_backup_enabled
        auto_backup_window      = var.db_auto_backup_window
        recovery_window_in_days = var.db_recovery_window_in_days
      }
    }
    db_version = var.db_version
  }

  shape                   = var.db_system_shape
  license_model           = var.license_model
  subnet_id               = oci_core_subnet.terraDB.id
  private_ip              = var.db_system_private_ip
  ssh_public_keys         = [file(var.ssh_public_key),] 
  hostname                = var.hostname
  data_storage_size_in_gb = var.data_storage_size_in_gb
   node_count              = data.oci_database_db_system_shapes.db_system_shapes.db_system_shapes[0]["minimum_node_count"]
  display_name = var.db_system_display_name
  # defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}


/* Other optional arguments
- source - (Optional) The source of the database: Use NONE for creating a new database. 
  Use DB_BACKUP for creating a new database by restoring from a backup. 
  Use DATABASE for creating a new database from an existing database, including archive redo log data. The default is NONE.
- source_db_system_id - (Required when source=DB_SYSTEM) The OCID of the DB system.
*/
