## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.terra_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.terra_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.terra_rt_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.terra_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.terra_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.terra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.ad](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Aws account region and autehntication variable "aws\_access\_key" {} variable "aws\_secret\_key" {} | `string` | `"us-east-1"` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | IGW INFO | `string` | `"terra-igw"` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . | `bool` | `true` | no |
| <a name="input_rt_name"></a> [rt\_name](#input\_rt\_name) | ROUTE TABLE INFO | `string` | `"terra-rt"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | ROUTE TABLE INFO | `string` | `"terra-sg"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC INFO | `string` | `"Terravpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of VPC's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created VPC's Subnet. |
| <a name="output_Subnet_id"></a> [Subnet\_id](#output\_Subnet\_id) | id of created VPC. |
| <a name="output_internet_gateway_Name"></a> [internet\_gateway\_Name](#output\_internet\_gateway\_Name) | Name of internet gateway. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | id of internet gateway. |
| <a name="output_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#output\_map\_public\_ip\_on\_launch) | Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . |
| <a name="output_route_table_Name"></a> [route\_table\_Name](#output\_route\_table\_Name) | Name of route table. |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | id of route table. |
| <a name="output_route_table_routes"></a> [route\_table\_routes](#output\_route\_table\_routes) | A list of routes. |
| <a name="output_vpc_CIDR"></a> [vpc\_CIDR](#output\_vpc\_CIDR) | cidr block of created VPC. |
| <a name="output_vpc_Name"></a> [vpc\_Name](#output\_vpc\_Name) | Name of created VPC. |
| <a name="output_vpc_dedicated_security_group_Name"></a> [vpc\_dedicated\_security\_group\_Name](#output\_vpc\_dedicated\_security\_group\_Name) | Security Group Name. |
| <a name="output_vpc_dedicated_security_group_id"></a> [vpc\_dedicated\_security\_group\_id](#output\_vpc\_dedicated\_security\_group\_id) | Security group id. |
| <a name="output_vpc_dedicated_security_ingress_rules"></a> [vpc\_dedicated\_security\_ingress\_rules](#output\_vpc\_dedicated\_security\_ingress\_rules) | Shows ingress rules of the Security group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | id of created VPC. |
