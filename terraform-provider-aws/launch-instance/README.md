## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.terra_vol](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_instance.terra_inst](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.terra_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.terra_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route_table.terra_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.terra_rt_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.terra_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.terra_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_volume_attachment.terra_vol_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_vpc.terra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.terra_img](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.ad](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_OS"></a> [OS](#input\_OS) | the selected ami based OS | `string` | `"CENTOS7"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Aws account region and autehntication variable "aws\_access\_key" {} variable "aws\_secret\_key" {} | `string` | `"us-east-1"` | no |
| <a name="input_block_storage_size_in_gbs"></a> [block\_storage\_size\_in\_gbs](#input\_block\_storage\_size\_in\_gbs) | variable "ssh\_public\_key" {} | `string` | `"10"` | no |
| <a name="input_boot_volume_size_in_gbs"></a> [boot\_volume\_size\_in\_gbs](#input\_boot\_volume\_size\_in\_gbs) | n/a | `string` | `"10"` | no |
| <a name="input_dummy"></a> [dummy](#input\_dummy) | n/a | `any` | n/a | yes |
| <a name="input_ebs_device_name"></a> [ebs\_device\_name](#input\_ebs\_device\_name) | Name of the EBS device to mount. | `list(string)` | <pre>[<br>  "/dev/xvdb",<br>  "/dev/xvdc",<br>  "/dev/xvdd",<br>  "/dev/xvde",<br>  "/dev/xvdf",<br>  "/dev/xvdg",<br>  "/dev/xvdh",<br>  "/dev/xvdi",<br>  "/dev/xvdj",<br>  "/dev/xvdk",<br>  "/dev/xvdl",<br>  "/dev/xvdm",<br>  "/dev/xvdn",<br>  "/dev/xvdo",<br>  "/dev/xvdp",<br>  "/dev/xvdq",<br>  "/dev/xvdr",<br>  "/dev/xvds",<br>  "/dev/xvdt",<br>  "/dev/xvdu",<br>  "/dev/xvdv",<br>  "/dev/xvdw",<br>  "/dev/xvdx",<br>  "/dev/xvdy",<br>  "/dev/xvdz"<br>]</pre> | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | Amount of provisioned IOPS. This must be set with a volume\_type of io1. | `number` | `0` | no |
| <a name="input_ebs_volume_enabled"></a> [ebs\_volume\_enabled](#input\_ebs\_volume\_enabled) | Flag to control the ebs creation. | `bool` | `true` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Size of the ebs volume in gigabytes. | `number` | `8` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | The type of EBS volume. Can be standard, gp2 or io1. | `string` | `"gp2"` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | IGW INFO | `string` | `"terra-igw"` | no |
| <a name="input_instance_ami_id"></a> [instance\_ami\_id](#input\_instance\_ami\_id) | n/a | `map(any)` | <pre>{<br>  "AMAZON_LINUX": "ami-0947d2ba12ee1ff75",<br>  "CENTOS7": "ami-0d0db0aecada009c5",<br>  "CENTOS8": "ami-056d1e4814a97ac59",<br>  "RHEL7": "ami-01f1bea9a9de3c605",<br>  "RHEL8": "ami-09353c38276693bcb",<br>  "SUSE": "ami-08c68a700c45e62fa",<br>  "UBUNTU": "ami-0f40c8f97004632f9",<br>  "WINDOWS": "ami-06f6f33114d2db0b1"<br>}</pre> | no |
| <a name="input_instance_cpus"></a> [instance\_cpus](#input\_instance\_cpus) | n/a | `number` | `1` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | `"TerraCompute"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | resource "aws\_key\_pair" "terraform-demo" { key\_name   = "var.key\_KeyPair" public\_key = "${file("/home/brokedba/id\_rsa\_aws.pub")}" } data  "aws\_subnet" "terra\_sub" { Required count     = length(data.oci\_core\_subnet.terrasub.id) subnet\_id =lookup(oci\_core\_subnet.terrasub[count.index],id) subnet\_id =  aws\_subnet.terra\_sub.id } ##################### INSTANCE ##################### data "template\_file" "user\_data" { template = file("../scripts/add-ssh-web-app.yaml") } | `string` | `"demo_aws_KeyPair"` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . | `bool` | `true` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Customize network interfaces to be attached at instance boot time | `list(map(string))` | `[]` | no |
| <a name="input_preserve_boot_volume"></a> [preserve\_boot\_volume](#input\_preserve\_boot\_volume) | n/a | `bool` | `false` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | VNIC INFO | `string` | `"192.168.10.51"` | no |
| <a name="input_rt_name"></a> [rt\_name](#input\_rt\_name) | ROUTE TABLE INFO | `string` | `"terra-rt"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | ROUTE TABLE INFO | `string` | `"terra-sg"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | BOOT INFO user data | `string` | `"./cloud-init/vm.cloud-config"` | no |
| <a name="input_vol_name"></a> [vol\_name](#input\_vol\_name) | The name of the EBS | `string` | `"vol_0"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC INFO | `string` | `"Terravpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_SSH_Connection"></a> [SSH\_Connection](#output\_SSH\_Connection) | n/a |
| <a name="output_SecurityGroup_ingress_rules"></a> [SecurityGroup\_ingress\_rules](#output\_SecurityGroup\_ingress\_rules) | Shows ingress rules of the Security group |
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of VPC's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created VPC's Subnet. |
| <a name="output_Subnet_id"></a> [Subnet\_id](#output\_Subnet\_id) | id of created VPC. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | id of created instances. |
| <a name="output_internet_gateway_Name"></a> [internet\_gateway\_Name](#output\_internet\_gateway\_Name) | Name of internet gateway. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | id of internet gateway. |
| <a name="output_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#output\_map\_public\_ip\_on\_launch) | Indicate if instances launched into the VPC's Subnet will be assigned a public IP address . |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPs of created instances. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IPs of created instances. |
| <a name="output_route_table_Name"></a> [route\_table\_Name](#output\_route\_table\_Name) | Name of route table. |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | id of route table. |
| <a name="output_route_table_routes"></a> [route\_table\_routes](#output\_route\_table\_routes) | A list of routes. |
| <a name="output_vpc_CIDR"></a> [vpc\_CIDR](#output\_vpc\_CIDR) | cidr block of created VPC. |
| <a name="output_vpc_Name"></a> [vpc\_Name](#output\_vpc\_Name) | Name of created VPC. |
| <a name="output_vpc_dedicated_security_group_Name"></a> [vpc\_dedicated\_security\_group\_Name](#output\_vpc\_dedicated\_security\_group\_Name) | Security Group Name. |
| <a name="output_vpc_dedicated_security_group_id"></a> [vpc\_dedicated\_security\_group\_id](#output\_vpc\_dedicated\_security\_group\_id) | Security group id. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | id of created VPC. |
