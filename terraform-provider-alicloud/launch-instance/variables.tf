# AliCloud account region and autehntication 
variable "ali_access_key" {}
variable "ali_secret_key" {}

variable "prefix" {
  description = "The prefix used for the resources group in this example"
  default = "TerraDemo"
}

# Ali Cloud Zone

      variable  "ali_zone" {
        type = map
        default = {
        us-east-1   = "us-east-1a"
        hongkong    = "cn-hongkong-b" # Centos 7
        germany     = "eu-central-1a" #8.8
        UK          = "eu-west-1a"
        us-west-1   = "us-west-1a"  
       }
     } 

variable "ali_region" {
    default = "us-east-1"   # "hongkong" have only # 2C4G free tier 3 months , not 1C1G free tier CPus
}

# VPC INFO
    variable "vpc_name" {
      default = "Terravpc"
    }
    
    variable "vpc_cidr" {
      default = "192.168.0.0/16"
    }

# SUBNET/VSWITCH INFO
    variable "vswitch_name"{
      default = "terrasub" 
      }

    variable "vswitch_cidr"{
      default = "192.168.10.0/24"
      } 
    variable "map_public_ip_on_launch" { 
      description = "Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . "
      default = true   
    }  

# IGW INFO
    variable "igw_name"{
      default = "terra-igw" 
      }

# ROUTE TABLE INFO
    variable "rt_name"{
      default = "terra-rt" 
      }
# ROUTE TABLE INFO
    variable "sg_name"{
      default = "terra-sg" 
      }      

# COMPUTE INSTANCE INFO
  variable hostname {
    default = "TerraHost"
}
  variable "instance_name" {
        default = "TerraCompute"
      }

 
  variable "instance_type" {
        default = "ecs.c5.large" # FREE TIERE for 3 months or ecs.t5-lc1m1.small for 1 year
        #shared ecs.n1.tiny ecs.xn4.small
        # 2C4G free tier 3 months > 2x ecs.c6.large . 100G .5/mbs (enteprise)
        # 1C1G free tier 1 YEAR >  1x ecs.t5-lc1m1.small 40g 1/mbs | burstable only available in APAC regions 
        # region supporting 1 year Free tier without ID: "cn-hongkong" i.e Zone:cn-hongkong-b
      }
  variable "img_id" {
        type = map

        default = {
        CENTOS8   = "centos_8_5_uefi_x64_20G_alibase_20220328.vhd"
        CENTOS7   = "centos_7_9_uefi_x64_20G_alibase_20230816.vhd" # Centos 7
        RHEL8     = "m-t4n1vfii5zftauvd5axj" #8.8
        UBUNTU    = "ubuntu_22_04_uefi_x64_20G_alibase_20230515.vhd"
        ROCKY9    = "rockylinux_9_2_x64_20G_alibase_20230613.vhd"  
        WINDOWS   = "win2022_21H2_x64_dtc_en-us_40G_alibase_20230915.vhd"
        SUSE      = "sles_12_sp4_x64_20G_alibase_20200319.vhd"
        Aliyun    = "aliyun_3_x64_20G_qboot_alibase_20230727.vhd"
       }
     }  

  variable "OS" {
  description = "the selected ami based OS"
  default       = "CENTOS7" 
}


# BOOT INFO   
 variable "preserve_boot_volume" {
    default = false
      }
 variable "boot_volume_size" {
      default = "20"
      }   
variable "data_diks_size" {
      default = "20"
      }
# user data
variable "user_data" {
        default = "./cloud-init/centos_userdata.txt" # "./cloud-init/vm.cloud-config"
      }     

variable "key_name" {
      default= "demo_ali_KeyPair"
      }


variable ssh_public_key {
  default = "~/.ssh/id_rsa_ali.pub"

}
# VNIC INFO
        variable "private_ip" {
        default = "192.168.10.51"
      }

 # EBS 
/*
variable "ebs_volume_size" {
       type        = number
       default     = 20 # up to 40GB fr free tier
       description = "Size of the ebs volume in gigabytes."
      }
      variable "ebs_device_name" {
      type        = list(string)
      default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
      description = "Name of the EBS device to mount."
      }
*/ 

  
