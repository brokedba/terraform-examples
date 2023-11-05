 terraform {
 # required_version =  OpenTofu # The latest HashiCorp terraform release under MPL is 1.5.5
 required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.211.2"
    }
  }
    }
# Provider specific configs
provider "alicloud" {
  access_key = var.ali_access_key
  secret_key = var.ali_secret_key
  region     = var.ali_region
}
######################
# DATA SOURCE
######################

 /*
data "alicloud_vswitches" "terrasub" {
  name_regex   = "${alicloud_vswitch.vswitch.vswitch_name}"
  vpc_id       =
  vswitch_name =
  zone_id      =
}
*/
######################
# INSTANCE
######################

 data "alicloud_images" "centos7" {
 most_recent = true
 owners = "system"
 name_regex = "^centos_7"
}

resource "alicloud_key_pair" "key_pair" {
  key_pair_name     = var.key_name
  public_key        = file(var.ssh_public_key) # file(~/.ssh/id_rsa_ali.pub)
  resource_group_id = alicloud_resource_manager_resource_group.rg.id
}

resource "alicloud_instance" "terra_inst" {
  image_id              = var.img_id[var.OS]
  instance_type         = var.instance_type # "ecs.t5-lc1m1.small"  # Free Tier eligible
  host_name             = var.hostname
  availability_zone     = var.ali_zone[var.ali_region]
  resource_group_id     = alicloud_resource_manager_resource_group.rg.id
  security_groups       = [alicloud_security_group.terra_sg.id]
  internet_charge_type  = "PayByTraffic" # Set to PayByTraffic for Free Tier eligibility
  internet_max_bandwidth_out = 1   # Free Tier eligible / larger than 0 will allocate a public ip address
  instance_name         = "example-instance"
  instance_charge_type  = "PostPaid" # Set to Pay-As-You-Go for Free Tier eligibility
  stopped_mode          = "StopCharging"
  key_name              = var.key_name
  system_disk_name      = "root_disk"
  system_disk_category  = "cloud_efficiency"  # Use the free tier system disk
  system_disk_size      = var.boot_volume_size # Up to 40G for the free tier system disk size
  vswitch_id            = alicloud_vswitch.terra_sub.id  # Associate with a VSwitch
  private_ip            = var.private_ip  # Assign a private IP
  user_data             = filebase64(var.user_data) 
#  security_enhancement_strategy = "Active"

# allocate_public_ip   =  deprecated from version "1.7.0" see "internet_max_bandwidth_out"
# eip_options {  in case Elastic IP Address is needed 
#    bandwidth = 1
#    internet_charge_type = "PayByTraffic"
#    isp = "BGP"
#  }
## DATA DISKS
/*
  data_disks {
    name        = "disk1"
    size        = "20"
    category    = "cloud_efficiency"
    description = "disk1"
    delete_with_instance = true  # default
  }
  data_disks {
    name        = "disk2"
    size        = "20"
    category    = "cloud_ssd"
    description = "disk2"
    encrypted   = true
    kms_key_id  = alicloud_kms_key.key.id
    delete_with_instance = false
  }
  */
}

######################
# VOLUME
######################      
/*
resource "alicloud_ecs_disk" "disk" {
  zone_id           = var.ali_zone[var.ali_region] OR "instance_id = alicloud_instance.terra_inst.id"
  disk_name   = "terraform-example"
  description = "terraform-example"
  category          = var.disk_category
  size              = var.disk_size
  delete_with_instance = "true"
  count             = var.disk_number # 
}

resource "alicloud_ecs_disk_attachment" "instance-attachment" {
  count       = var.number
  disk_id     = alicloud_disk.disk.*.id[count.index]
  instance_id = alicloud_instance.terra_inst.id
}

*/