## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_default_route_table.rt](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_default_route_table) | resource |
| [oci_core_internet_gateway.gtw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_security_list.terra_sl](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_subnet.terrasub](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcnterra](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_vcn) | resource |
| [oci_identity_availability_domains.ad1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.78.0/24"` | no |
| <a name="input_subnet_display_name"></a> [subnet\_display\_name](#input\_subnet\_display\_name) | n/a | `string` | `"terrasub"` | no |
| <a name="input_subnet_dns_label"></a> [subnet\_dns\_label](#input\_subnet\_dns\_label) | SUBNET INFO | `string` | `"terra"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_vcn_cidr"></a> [vcn\_cidr](#input\_vcn\_cidr) | n/a | `string` | `"192.168.64.0/20"` | no |
| <a name="input_vcn_display_name"></a> [vcn\_display\_name](#input\_vcn\_display\_name) | n/a | `string` | `"Terravcn"` | no |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | n/a | `string` | `"Terra"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_dhcp_options_id"></a> [default\_dhcp\_options\_id](#output\_default\_dhcp\_options\_id) | OCID of default DHCP options. |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | OCID of default route table. |
| <a name="output_default_security_list_id"></a> [default\_security\_list\_id](#output\_default\_security\_list\_id) | OCID of default security list. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | OCID of internet gateway. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | ocid of subnet ids. |
| <a name="output_vcn_id"></a> [vcn\_id](#output\_vcn\_id) | OCID of created VCN. |


this README was genrerated using https://terraform-docs.io/
