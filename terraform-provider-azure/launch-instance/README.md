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
| [azurerm_linux_virtual_machine.terravm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.Terranic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.terra_assos_pubip_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.terra_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.terrapubip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.terra_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsg_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.terra_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_OS"></a> [OS](#input\_OS) | the selected ami based OS | `string` | `"CENTOS7"` | no |
| <a name="input_az_location"></a> [az\_location](#input\_az\_location) | n/a | `string` | `"eastus"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `string` | `"TerraCompute"` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Customize network interfaces to be attached at instance boot time | `list(map(string))` | `[]` | no |
| <a name="input_os_publisher"></a> [os\_publisher](#input\_os\_publisher) | n/a | `map` | <pre>{<br>  "CENTOS7": {<br>    "admin": "centos",<br>    "offer": "CentOS",<br>    "publisher": "OpenLogic",<br>    "sku": "7.7"<br>  },<br>  "OL7": {<br>    "offer": "racle-Linux",<br>    "publisher": "Oracle",<br>    "sku": "ol77-ci-gen2"<br>  },<br>  "RHEL7": {<br>    "admin": "azureuser",<br>    "offer": "RHEL",<br>    "publisher": "RedHat",<br>    "sku": "7lvm-gen2"<br>  },<br>  "SUSE": {<br>    "admin": "azureuser",<br>    "offer": "sles-15-sp2-byos",<br>    "publisher": "SUSE",<br>    "sku": "gen2"<br>  },<br>  "UBUNTU": {<br>    "admin": "azureuser",<br>    "offer": "UbuntuServer",<br>    "publisher": "Canonical",<br>    "sku": "19_10-daily-gen2"<br>  },<br>  "WINDOWS": {<br>    "admin": "azureuser",<br>    "offer": "WindowsServer",<br>    "publisher": "MicrosoftWindowsServer",<br>    "sku": "2016-Datacenter"<br>  }<br>}</pre> | no |
| <a name="input_osdisk_size"></a> [osdisk\_size](#input\_osdisk\_size) | n/a | `string` | `"30"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix used for all resources in this example | `string` | `"TerraDemo"` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | VNIC INFO | `string` | `"192.168.10.51"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | n/a | `string` | `"terra_sg"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `string` | `"./cloud-init/centos_userdata.txt"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | n/a | `string` | `"Standard_B1s"` | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | VPC INFO | `string` | `"Terravnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_SSH_Connection"></a> [SSH\_Connection](#output\_SSH\_Connection) | n/a |
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of VNET's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created VNET's Subnet. |
| <a name="output_Subnet_id"></a> [Subnet\_id](#output\_Subnet\_id) | id of created VNET. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | id of created instances. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPs of created instances. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IPs of created instances. |
| <a name="output_vnet_CIDR"></a> [vnet\_CIDR](#output\_vnet\_CIDR) | cidr block of created VNET. |
| <a name="output_vnet_dedicated_security_group_Name"></a> [vnet\_dedicated\_security\_group\_Name](#output\_vnet\_dedicated\_security\_group\_Name) | Security Group Name. |
| <a name="output_vnet_dedicated_security_group_id"></a> [vnet\_dedicated\_security\_group\_id](#output\_vnet\_dedicated\_security\_group\_id) | Security group id. |
| <a name="output_vnet_dedicated_security_ingress_rules"></a> [vnet\_dedicated\_security\_ingress\_rules](#output\_vnet\_dedicated\_security\_ingress\_rules) | Shows ingress rules of the Security group |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | id of created VNET. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
