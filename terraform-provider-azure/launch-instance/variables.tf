# Aws account region and autehntication 
#variable "aws_access_key" {}
#variable "aws_secret_key" {}
variable "aws_region" {
    default = "us-east-1"
}
# VPC INFO
    variable "vpc_name" {
      default = "Terravpc"
    }
    
    variable "vpc_cidr" {
      default = "192.168.0.0/16"
    }

# SUBNET INFO
    variable "subnet_name"{
      default = "terrasub" 
      }

    variable "subnet_cidr"{
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

      variable "instance_name" {
        default = "TerraCompute"
      }

      variable "preserve_boot_volume" {
        default = false
      }
      variable "boot_volume_size_in_gbs" {
        default = "10"
      }
      variable "instance_type" {
        default = "t2.micro"
      }
      variable "instance_ami_id" {
        type = map

        default = {
        CENTOS8   = "ami-056d1e4814a97ac59"
        CENTOS7   = "ami-0d0db0aecada009c5"
        RHEL8     = "ami-09353c38276693bcb"
        RHEL7     = "ami-01f1bea9a9de3c605"
        UBUNTU    = "ami-0f40c8f97004632f9"
       AMAZON_LINUX  = "ami-0947d2ba12ee1ff75"  # Centos 7
       WINDOWS    = "ami-06f6f33114d2db0b1"
       SUSE       = "ami-08c68a700c45e62fa"
       }
     }  
variable "OS" {
  description = "the selected ami based OS"
  default       = "CENTOS7" 
}

# VNIC INFO
        variable "private_ip" {
        default = "192.168.10.51"
      }
      
# BOOT INFO      
  # user data
      variable "user_data" {
        default = "./cloud-init/vm.cloud-config"
      }     
      #variable "ssh_public_key" {}
      variable "block_storage_size_in_gbs" {
        default = "10"
      }
 # EBS 
      variable "vol_name" {
      type        = string
      default     = "vol_0"
      description = "The name of the EBS"
      }
      variable "ebs_volume_enabled" {
      type        = bool
      default     = true
      description = "Flag to control the ebs creation."
      }     
      variable "ebs_volume_type" {
      type        = string
      default     = "gp2"
      description = "The type of EBS volume. Can be standard, gp2 or io1."
      }
      variable "ebs_iops" {
      type        = number
      default     = 0
      description = "Amount of provisioned IOPS. This must be set with a volume_type of io1."
      }

      variable "ebs_volume_size" {
       type        = number
       default     = 8
       description = "Size of the ebs volume in gigabytes."
      }
      variable "ebs_device_name" {
      type        = list(string)
      default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
      description = "Name of the EBS device to mount."
      }

      variable "instance_cpus" {
      default = 1
      }        
#
variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}
  
