output "vpc_Name" {
      description = "Name of created VPC. "
      value       = "${lookup(aws_vpc.terra_vpc.tags, "Name")}"
    }
output "vpc_id" {
      description = "id of created VPC. "
      value       = aws_vpc.terra_vpc.id
    }
output "vpc_CIDR" {
      description = "cidr block of created VPC. "
      value       = aws_vpc.terra_vpc.cidr_block
    }    
    
output "Subnet_Name" {
      description = "Name of created VPC's Subnet. "
      value       = "${lookup(aws_subnet.terra_sub.tags, "Name")}"
    }
output "Subnet_id" {
      description = "id of created VPC. "
      value       = aws_subnet.terra_sub.id
    }
output "Subnet_CIDR" {
      description = "cidr block of VPC's Subnet. "
      value       = aws_subnet.terra_sub.cidr_block
    }

output "map_public_ip_on_launch" {
      description = "Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . "
      value       = aws_subnet.terra_sub.map_public_ip_on_launch
    }
  
output "internet_gateway_id" {
       description = "id of internet gateway. "
       value       = aws_internet_gateway.terra_igw.id
    }
output "internet_gateway_Name" {
       description = "Name of internet gateway. "
       value       = "${lookup(aws_internet_gateway.terra_igw.tags, "Name")}"
    }    

output "route_table_id" {
       description = "id of route table. "
       value       = aws_route_table.terra_rt.id
    }
output "route_table_Name" {
       description = "Name of route table. "
       value       = "${lookup(aws_route_table.terra_rt.tags, "Name")}"
    }    
 
output "route_table_routes" {
       description = "A list of routes. "
       value       = aws_route_table.terra_rt.route
    } 

output "vpc_dedicated_security_group_Name" {
       description = "Security Group Name. "
       value       = aws_security_group.terra_sg.name
   }
output "vpc_dedicated_security_group_id" {
       description = "Security group id. "
       value       = aws_security_group.terra_sg.id
   }
output "vpc_dedicated_security_ingress_rules" {
      description = "Shows ingress rules of the Security group "
      #value       = {for k,v in aws_security_group_rule.terra_sg_rule : k => v.to_port}
      value        = { for sg,p in  aws_security_group_rule.terra_sg_rule : sg => format("%s => CIDR %s",p.to_port,p.cidr_blocks[0]) }
}