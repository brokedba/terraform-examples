# Azure account region and authentication 

variable "prefix" {
  description = "The prefix used for all resources in this example"
  default = "TerraDemo"
}
variable "az_location" {
    default = "eastus"
}
# VPC INFO
    variable "vnet_name" {
      default = "Terravnet"
    }
    
    variable "vnet_cidr" {
      default = "192.168.0.0/16"
    }

# SUBNET INFO
    variable "subnet_name"{
      default = "terrasub" 
      }

    variable "subnet_cidr"{
      default = "192.168.10.0/24"
      } 
    variable "sg_name" {
    default = "terra_sg"
    }
   

# COMPUTE INSTANCE INFO

      variable "instance_name" {
        default = "TerraCompute"
      }


      variable "osdisk_size" {
        default = "30"
      }
      variable "vm_size" {
        default = "Basic_A2"
      }

variable  "os_publisher" {
  default = {
    CENTOS7 = {
           publisher = "OpenLogic"
           offer     = "CentOS"
           sku       = "7.7"
           admin     = "centos"
        },
    RHEL7  =  {
          publisher = "RedHat"
          offer     = "RHEL"
          sku       = "7lvm-gen2"
          admin     = "azureuser"
        },
    OL7    =  {
          publisher = "Oracle"
          offer     = "racle-Linux"
          sku       = "ol77-ci-gen2"
        },     
    WINDOWS    =  {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2016-Datacenter"
          admin     = "azureuser"
        },
    SUSE       =  {
          publisher = "SUSE"
          offer     = "sles-15-sp2-byos"
          sku       = "gen2"
          admin     = "azureuser"
        },
    UBUNTU       =  {
          publisher = "Canonical"
          offer     = "UbuntuServer"
          sku       = "19_10-daily-gen2"
          admin     = "azureuser"
        }
    


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
  default = "./cloud-init/centos_userdata.txt"
  }     

 # EBS 
#
variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}
  
