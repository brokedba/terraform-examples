## VPC OUTPUT
data "alicloud_vpcs" "terra_vpcs" {
  ids  =[alicloud_vpc.terra_vpc.id,]
  status     = "Available"
# name_regex = "^foo"
}

data "alicloud_vswitches" "terra_subs" {
  ids               = [alicloud_vswitch.terra_sub.id,]
  # name_regex = "${alicloud_vswitch.terra_subs.vswitch_name}"
}

data "alicloud_security_groups" "terra_sgs" {
  ids             = [alicloud_security_group.terra_sg.id,]
resource_group_id = alicloud_resource_manager_resource_group.rg.id
depends_on =  [ alicloud_security_group.terra_sg ]
}


output  vpc_name {
  description = "Name of created VPC. "
  value = "${data.alicloud_vpcs.terra_vpcs.vpcs.0.vpc_name}"
}

output "vpc_id" {
      description = "ID of created VPC. "
      value       = "${data.alicloud_vpcs.terra_vpcs.vpcs.0.id}"
    }

output "vpc_CIDR" {
      description = "cidr block of created VPC. "
      value       = "${data.alicloud_vpcs.terra_vpcs.vpcs.0.cidr_block}"
    }    
    
output "Subnet_Name" {
      description = "Name of created VPC's Subnet. "
      value       = "${data.alicloud_vswitches.terra_subs.vswitches.0.name}"
    }
 
output "Subnet_CIDR" {
      description = "cidr block of VPC's VSwitch. "
      value       = "${data.alicloud_vswitches.terra_subs.vswitches.0.cidr_block}"
    }



output "vpc_dedicated_security_group_Name" {
       description = "Security Group Name. "
       value       = "${data.alicloud_security_groups.terra_sgs.groups.0.name}"
   }

# Filter the security group rule by group
data "alicloud_security_group_rules" "ingress_rules" {
  group_id    = "${data.alicloud_security_groups.terra_sgs.groups.0.id}" # or ${var.security_group_id}
  nic_type    = "internet"
  direction   = "ingress"
  ip_protocol = "tcp"
  depends_on = [ alicloud_security_group.terra_sg ]
}

output "vpc_dedicated_security_ingress_rules" {
       description = "Shows ingress rules of the Security group "
       value       = formatlist("%s:  %s" ,data.alicloud_security_group_rules.ingress_rules.rules.*.description,formatlist("%s , CIDR: %s", data.alicloud_security_group_rules.ingress_rules.rules.*.port_range,data.alicloud_security_group_rules.ingress_rules.rules.*.source_cidr_ip))
   }          
##  INSTANCE OUTPUT
      output "instance_id" {
        description = " id of created instances. "
        value       = alicloud_instance.terra_inst.id
      }
      
      output "private_ip" {
        description = "Private IPs of created instances. "
        value       = alicloud_instance.terra_inst.primary_ip_address 
      }
      
      output "public_ip" {
        description = "Public IPs of created instances. "
        value       = alicloud_instance.terra_inst.public_ip
      }

 output "SSH_Connection" {
     value      = format("ssh connection to instance ${var.instance_name} ==> sudo ssh -i ~/.ssh/id_rsa_ali root@%s",alicloud_instance.terra_inst.public_ip)
}

  
  
    