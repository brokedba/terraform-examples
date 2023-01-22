## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.terra_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.terra_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.terra_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_location"></a> [az\_location](#input\_az\_location) | n/a | `string` | `"eastus"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for all resources in this example | `any` | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | n/a | `string` | `"terra_sg"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | VPC INFO | `string` | `"Terravnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of VNET's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created VNET's Subnet. |
| <a name="output_vnet_CIDR"></a> [vnet\_CIDR](#output\_vnet\_CIDR) | cidr block of created VNET. |
| <a name="output_vnet_dedicated_security_group_Name"></a> [vnet\_dedicated\_security\_group\_Name](#output\_vnet\_dedicated\_security\_group\_Name) | Security Group Name. |
| <a name="output_vnet_dedicated_security_ingress_rules"></a> [vnet\_dedicated\_security\_ingress\_rules](#output\_vnet\_dedicated\_security\_ingress\_rules) | Shows ingress rules of the Security group |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
