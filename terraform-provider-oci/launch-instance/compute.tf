
      terraform {
        required_version = ">= 0.12.0"
      }
######################
# DATA SOURCE
######################
      data "oci_core_images" "terra_img" {
        #Required
        compartment_id = var.compartment_ocid
        #Optional
        operating_system = "CentOS"
        operating_system_version = 7
        shape = var.shape         # "VM.Standard2.1" or  "VM.Standard.E2.1.Micro" 
        state = "AVAILABLE"
      }

      data "oci_core_subnet" "terrasub" {
    #Required
    #count     = length(data.oci_core_subnet.terrasub.id)
    #subnet_id =lookup(oci_core_subnet.terrasub[count.index],id)
    subnet_id = oci_core_subnet.terrasub[0].id
}
######################
# INSTANCE
######################

      resource "oci_core_instance" "terra_inst" {
        availability_domain  = data.oci_core_subnet.terrasub.availability_domain
        compartment_id       = var.compartment_ocid
        display_name         = var.instance_display_name  # "TerraCompute"
        preserve_boot_volume = var.preserve_boot_volume   # false
        shape                = var.shape                  # "VM.Standard2.1"

        create_vnic_details {
          assign_public_ip       = var.assign_public_ip       # true
          display_name           = var.vnic_name              # eth01
          hostname_label         = var.hostname_label         # terrahost
          private_ip             = var.private_ip             # true
          skip_source_dest_check = var.skip_source_dest_check # false
          subnet_id              = data.oci_core_subnet.terrasub.id
        }

        metadata = {
          ssh_authorized_keys = file("../../.ssh/id_rsa.pub")
          user_data = base64encode(file("./cloud-init/vm.cloud-config"))
        }

        source_details {
          boot_volume_size_in_gbs = var.boot_volume_size_in_gbs # 20G
          source_type = "image"
          source_id   = data.oci_core_images.terra_img.images[0].id
        }

        timeouts {
          create = var.instance_timeout # 25m
        }
      }
######################
# VOLUME
######################      

      resource "oci_core_volume" "terra_vol" {
        availability_domain = oci_core_instance.terra_inst.availability_domain
        compartment_id      = var.compartment_ocid
        display_name        = "${oci_core_instance.terra_inst.display_name}_volume_0"
        size_in_gbs         = var.block_storage_size_in_gbs # 20G
      }

      resource "oci_core_volume_attachment" "terra_attach" {
        attachment_type = var.attachment_type
        compartment_id  = var.compartment_ocid
        instance_id     = oci_core_instance.terra_inst.id
        volume_id       = oci_core_volume.terra_vol.id
        use_chap        = var.use_chap  # true
      }
    