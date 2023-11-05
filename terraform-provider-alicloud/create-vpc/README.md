## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | 1.211.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.211.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_resource_manager_resource_group.rg](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/resource_manager_resource_group) | resource |
| [alicloud_security_group.terra_sg](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/security_group) | resource |
| [alicloud_security_group_rule.allow_http_80](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/security_group_rule) | resource |
| [alicloud_security_group_rule.allow_https_22](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/security_group_rule) | resource |
| [alicloud_security_group_rule.allow_https_443](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/security_group_rule) | resource |
| [alicloud_vpc.terra_vpc](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/vpc) | resource |
| [alicloud_vswitch.terra_sub](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/resources/vswitch) | resource |
| [alicloud_security_group_rules.ingress_rules](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/data-sources/security_group_rules) | data source |
| [alicloud_security_groups.terra_sgs](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/data-sources/security_groups) | data source |
| [alicloud_vpcs.terra_vpcs](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.terra_subs](https://registry.terraform.io/providers/aliyun/alicloud/1.211.2/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ali_access_key"></a> [ali\_access\_key](#input\_ali\_access\_key) | Aws account region and autehntication | `any` | n/a | yes |
| <a name="input_ali_region"></a> [ali\_region](#input\_ali\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_ali_secret_key"></a> [ali\_secret\_key](#input\_ali\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_ali_zone"></a> [ali\_zone](#input\_ali\_zone) | n/a | `map` | <pre>{<br>  "UK": "eu-west-1a",<br>  "germany": "eu-central-1a",<br>  "hongkong": "cn-hongkong-b",<br>  "us-east-1": "us-east-1b",<br>  "us-west-1": "us-west-1a"<br>}</pre> | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | IGW INFO | `string` | `"terra-igw"` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . | `bool` | `true` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for the resources group in this example | `string` | `"TerraDemo"` | no |
| <a name="input_rt_name"></a> [rt\_name](#input\_rt\_name) | ROUTE TABLE INFO | `string` | `"terra-rt"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | ROUTE TABLE INFO | `string` | `"terra-sg"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC INFO | `string` | `"Terravpc"` | no |
| <a name="input_vswitch_cidr"></a> [vswitch\_cidr](#input\_vswitch\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_vswitch_name"></a> [vswitch\_name](#input\_vswitch\_name) | SUBNET/VSWITCH INFO | `string` | `"terrasub"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of VPC's VSwitch. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created VPC's Subnet. |
| <a name="output_vpc_CIDR"></a> [vpc\_CIDR](#output\_vpc\_CIDR) | cidr block of created VPC. |
| <a name="output_vpc_dedicated_security_group_Name"></a> [vpc\_dedicated\_security\_group\_Name](#output\_vpc\_dedicated\_security\_group\_Name) | Security Group Name. |
| <a name="output_vpc_dedicated_security_ingress_rules"></a> [vpc\_dedicated\_security\_ingress\_rules](#output\_vpc\_dedicated\_security\_ingress\_rules) | Shows ingress rules of the Security group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of created VPC. |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | Name of created VPC. |
