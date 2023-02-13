
## Getting started 
In order to deploy this terraform configuration you must:
1. adapt env-vars and source it 
```
$ . env-vars
```
or 
2. adapt terrafomr.tfvars 
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
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
| [oci_core_instance.terra_inst](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_internet_gateway.gtw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_security_list.terra_sl](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_subnet.terrasub](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_vcn.vcnterra](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_vcn) | resource |
| [oci_core_volume.terra_vol](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_volume) | resource |
| [oci_core_volume_attachment.terra_attach](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_volume_attachment) | resource |
| [oci_core_images.terra_img](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images) | data source |
| [oci_core_subnet.terrasub](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_subnet) | data source |
| [oci_identity_availability_domains.ad1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | n/a | `bool` | `true` | no |
| <a name="input_attachment_type"></a> [attachment\_type](#input\_attachment\_type) | n/a | `string` | `"iscsi"` | no |
| <a name="input_block_storage_size_in_gbs"></a> [block\_storage\_size\_in\_gbs](#input\_block\_storage\_size\_in\_gbs) | n/a | `string` | `"50"` | no |
| <a name="input_boot_volume_size_in_gbs"></a> [boot\_volume\_size\_in\_gbs](#input\_boot\_volume\_size\_in\_gbs) | n/a | `string` | `"50"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_extended_metadata"></a> [extended\_metadata](#input\_extended\_metadata) | n/a | `map` | `{}` | no |
| <a name="input_hostname_label"></a> [hostname\_label](#input\_hostname\_label) | VNIC INFO | `string` | `"terrahost"` | no |
| <a name="input_instance_display_name"></a> [instance\_display\_name](#input\_instance\_display\_name) | n/a | `string` | `"TerraCompute"` | no |
| <a name="input_instance_image_ocid"></a> [instance\_image\_ocid](#input\_instance\_image\_ocid) | n/a | `map` | <pre>{<br>  "ca-montreal-1": "ocid1.image.oc1.ca-montreal-1.aaaaaaaamcmyjjewzrw7qz66lnsl4hf7mkaznw6iyrrdwc22z56vltj36mka",<br>  "ca-toronto-1": "ocid1.image.oc1.ca-toronto-1.aaaaaaaaw6w5y4vbjdg6gqptyagaq2o7kdj6mupblphd73qvfszufbvv2rfa",<br>  "us-ashburn-1": "ocid1.image.oc1.iad.aaaaaaaahjkmmew2pjrcpylaf6zdddtom6xjnazwptervti35keqd4fdylca",<br>  "us-phoenix-1": "ocid1.image.oc1.phx.aaaaaaaav3isrmykdh6r3dwicrdgpmfdv3fb3jydgh4zqpgm6yr5x3somuza"<br>}</pre> | no |
| <a name="input_instance_ocpus"></a> [instance\_ocpus](#input\_instance\_ocpus) | n/a | `number` | `1` | no |
| <a name="input_instance_timeout"></a> [instance\_timeout](#input\_instance\_timeout) | n/a | `string` | `"25m"` | no |
| <a name="input_preserve_boot_volume"></a> [preserve\_boot\_volume](#input\_preserve\_boot\_volume) | n/a | `bool` | `false` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | n/a | `string` | `"192.168.78.51"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_resource_platform"></a> [resource\_platform](#input\_resource\_platform) | Platform to create resources in. | `string` | `"linux"` | no |
| <a name="input_shape"></a> [shape](#input\_shape) | n/a | `string` | `"VM.Standard.E2.1.Micro"` | no |
| <a name="input_skip_source_dest_check"></a> [skip\_source\_dest\_check](#input\_skip\_source\_dest\_check) | n/a | `bool` | `false` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | BOOT INFO | `any` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.78.0/24"` | no |
| <a name="input_subnet_display_name"></a> [subnet\_display\_name](#input\_subnet\_display\_name) | n/a | `string` | `"terrasub"` | no |
| <a name="input_subnet_dns_label"></a> [subnet\_dns\_label](#input\_subnet\_dns\_label) | SUBNET INFO | `string` | `"terra"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_use_chap"></a> [use\_chap](#input\_use\_chap) | Whether to use CHAP authentication for the volume attachment. | `bool` | `true` | no |
| <a name="input_vcn_cidr"></a> [vcn\_cidr](#input\_vcn\_cidr) | n/a | `string` | `"192.168.64.0/20"` | no |
| <a name="input_vcn_display_name"></a> [vcn\_display\_name](#input\_vcn\_display\_name) | VCN INFO | `string` | `"Terravcn"` | no |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | n/a | `string` | `"Terra"` | no |
| <a name="input_vnic_name"></a> [vnic\_name](#input\_vnic\_name) | n/a | `string` | `"eth01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_dhcp_options_id"></a> [default\_dhcp\_options\_id](#output\_default\_dhcp\_options\_id) | OCID of default DHCP options. |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | OCID of default route table. |
| <a name="output_default_security_list_id"></a> [default\_security\_list\_id](#output\_default\_security\_list\_id) | OCID of default security list. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ocid of created instances. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | OCID of internet gateway. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPs of created instances. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IPs of created instances. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | ocid of subnet ids. |
| <a name="output_vcn_id"></a> [vcn\_id](#output\_vcn\_id) | OCID of created VCN. |
