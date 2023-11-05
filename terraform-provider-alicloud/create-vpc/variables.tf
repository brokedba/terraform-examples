# Aws account region and autehntication 
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
        us-east-1   = "us-east-1b"
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


