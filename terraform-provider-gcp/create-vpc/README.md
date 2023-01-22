## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.web-server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.terra_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.terra_sub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | n/a | `string` | `"terra_fw"` | no |
| <a name="input_gcp_credentials"></a> [gcp\_credentials](#input\_gcp\_credentials) | default location of your service account json key file | `string` | `"~/gcp-key.json"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"playground-s-11-83a5e4fc"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east1"` | no |
| <a name="input_subnet-02_cidr"></a> [subnet-02\_cidr](#input\_subnet-02\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | SUBNET INFO | `string` | `"terrasub"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | VPC INFO | `string` | `"Terravpc"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"us-east1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Subnet_CIDR"></a> [Subnet\_CIDR](#output\_Subnet\_CIDR) | cidr block of vpc's Subnet. |
| <a name="output_Subnet_Name"></a> [Subnet\_Name](#output\_Subnet\_Name) | Name of created vpc's Subnet. |
| <a name="output_Subnet_id"></a> [Subnet\_id](#output\_Subnet\_id) | id of created vpc. |
| <a name="output_fire_wall_rules"></a> [fire\_wall\_rules](#output\_fire\_wall\_rules) | Shows ingress rules of the Security group |
| <a name="output_firewall_Name"></a> [firewall\_Name](#output\_firewall\_Name) | Security Group Name. |
| <a name="output_project"></a> [project](#output\_project) | n/a |
| <a name="output_secondary_sub_ip_range"></a> [secondary\_sub\_ip\_range](#output\_secondary\_sub\_ip\_range) | Shows ingress rules of the Security group |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The Name of the newly created vpc |
