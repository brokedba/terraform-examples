
# This deployment includes a DB system  
- version : 21c
- Two subnets private subnet for the DB backend and a public subnet for  the front end
- Bastion Service : which is a remote connection to your private database instance using ssh without needing to create a Host bation

![image](https://user-images.githubusercontent.com/29458929/213897665-69366074-458d-45ec-8bd2-89355ddba584.png)

More info in my [blog- Terraform for dummies part 6: Deploy Oracle DB System 21c using terraform](http://www.brokedba.com/2022/04/terraform-for-dummies-part-6-deploy.html)   
# Known issues
- The database admin Password should not contain word Oracle or Username(sys).
- The database version must be one of
```
 11.2.0.4 or 11.2.0.4.201020 or 11.2.0.4.210119 or 11.2.0.4.210420 or 12.1.0.2 or 12.1.0.2.210720 or 12.1.0.2.211019 or 
12.1.0.2.220118 or 12.2.0.1 or 12.2.0.1.210720 or 12.2.0.1.211019 or 12.2.0.1.220118 or 18.0.0.0 or 18.13.0.0 or 18.14.0.0 
or 18.16.0.0 or 19.0.0.0 or 19.12.0.0 or 19.13.0.0 or 19.14.0.0 or 21.0.0.0 or 21.3.0.0 or 21.4.0.0 or 21.5.0.0.
```

- Terraform registry Doc for oci provider is not up to date or the provider has still some bugs not fixed. Example  node_count in db_system resource :

 ![image](https://user-images.githubusercontent.com/29458929/150219444-eb080f56-0d5e-40ea-9276-72e3860755a2.png)
- Please check provider (github issues https://github.com/terraform-providers/terraform-provider-oci/issues) to be sure 
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_bastion_bastion.mybastion](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/bastion_bastion) | resource |
| [oci_bastion_session.mybastion_session](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/bastion_session) | resource |
| [oci_core_default_route_table.rt](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_default_route_table) | resource |
| [oci_core_drg.drgw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_drg) | resource |
| [oci_core_drg_attachment.drgw_attachment](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_drg_attachment) | resource |
| [oci_core_internet_gateway.igtw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_nat_gateway.natgw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_nat_gateway) | resource |
| [oci_core_route_table.apprt](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_route_table) | resource |
| [oci_core_security_list.terraApp_sl](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_security_list.terra_sl](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list) | resource |
| [oci_core_service_gateway.obj-svcgw](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_service_gateway) | resource |
| [oci_core_subnet.terraApp](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_subnet.terraDB](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet) | resource |
| [oci_core_virtual_network.vcnterra](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_virtual_network) | resource |
| [oci_database_db_system.MYDBSYS](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/database_db_system) | resource |
| [oci_core_services.object_storage_svcs](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_services) | data source |
| [oci_core_services.oci_services](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_services) | data source |
| [oci_core_vnic.db_node_vnic1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vnic) | data source |
| [oci_database_databases.databases1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_databases) | data source |
| [oci_database_db_home_patch_history_entries.patches_history1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_home_patch_history_entries) | data source |
| [oci_database_db_home_patches.patches1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_home_patches) | data source |
| [oci_database_db_homes.db_homes1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_homes) | data source |
| [oci_database_db_node.db_node_details1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_node) | data source |
| [oci_database_db_nodes.db_nodes1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_nodes) | data source |
| [oci_database_db_system_patch_history_entries.patches_history1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_system_patch_history_entries) | data source |
| [oci_database_db_system_patches.patches1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_system_patches) | data source |
| [oci_database_db_system_shapes.db_system_shapes](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_system_shapes) | data source |
| [oci_database_db_versions.test_db_versions_by_db_system_id1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/database_db_versions) | data source |
| [oci_identity_availability_domains.ad1](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | n/a | `string` | `"BahF:CA-TORONTO-1-AD-1"` | no |
| <a name="input_bastion_cidr_block_allow_list"></a> [bastion\_cidr\_block\_allow\_list](#input\_bastion\_cidr\_block\_allow\_list) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | n/a | `string` | `"BastionMyDB"` | no |
| <a name="input_bastion_session_name"></a> [bastion\_session\_name](#input\_bastion\_session\_name) | n/a | `string` | `"Session-Mybastion"` | no |
| <a name="input_bastion_session_type"></a> [bastion\_session\_type](#input\_bastion\_session\_type) | n/a | `string` | `"PORT_FORWARDING"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | ############# Object Storage ############# | `string` | `"Mybucket"` | no |
| <a name="input_character_set"></a> [character\_set](#input\_character\_set) | n/a | `string` | `"WE8ISO8859P15"` | no |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_data_storage_percentage"></a> [data\_storage\_percentage](#input\_data\_storage\_percentage) | n/a | `string` | `"40"` | no |
| <a name="input_data_storage_size_in_gb"></a> [data\_storage\_size\_in\_gb](#input\_data\_storage\_size\_in\_gb) | n/a | `string` | `"256"` | no |
| <a name="input_db_admin_password"></a> [db\_admin\_password](#input\_db\_admin\_password) | n/a | `any` | n/a | yes |
| <a name="input_db_auto_backup_enabled"></a> [db\_auto\_backup\_enabled](#input\_db\_auto\_backup\_enabled) | n/a | `string` | `"true"` | no |
| <a name="input_db_auto_backup_window"></a> [db\_auto\_backup\_window](#input\_db\_auto\_backup\_window) | n/a | `string` | `"SLOT_TWO"` | no |
| <a name="input_db_disk_redundancy"></a> [db\_disk\_redundancy](#input\_db\_disk\_redundancy) | n/a | `string` | `"HIGH"` | no |
| <a name="input_db_edition"></a> [db\_edition](#input\_db\_edition) | n/a | `string` | `"STANDARD_EDITION"` | no |
| <a name="input_db_home_display_name"></a> [db\_home\_display\_name](#input\_db\_home\_display\_name) | n/a | `string` | `"DBHome19"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | `"MYCDB"` | no |
| <a name="input_db_recovery_window_in_days"></a> [db\_recovery\_window\_in\_days](#input\_db\_recovery\_window\_in\_days) | n/a | `string` | `"45"` | no |
| <a name="input_db_system_display_name"></a> [db\_system\_display\_name](#input\_db\_system\_display\_name) | n/a | `string` | `"DBCSDEMO"` | no |
| <a name="input_db_system_private_ip"></a> [db\_system\_private\_ip](#input\_db\_system\_private\_ip) | VNIC INFO | `string` | `"192.168.78.10"` | no |
| <a name="input_db_system_shape"></a> [db\_system\_shape](#input\_db\_system\_shape) | n/a | `string` | `"VM.Standard2.4"` | no |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version) | n/a | `string` | `"21.0.0.0"` | no |
| <a name="input_db_workload"></a> [db\_workload](#input\_db\_workload) | n/a | `string` | `"OLTP"` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `any` | n/a | yes |
| <a name="input_host_user_name"></a> [host\_user\_name](#input\_host\_user\_name) | n/a | `string` | `"opc"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | n/a | `string` | `"hostdb-oci"` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | n/a | `string` | `"LICENSE_INCLUDED"` | no |
| <a name="input_n_character_set"></a> [n\_character\_set](#input\_n\_character\_set) | n/a | `string` | `"AL16UTF16"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `string` | `"1"` | no |
| <a name="input_pdb_name"></a> [pdb\_name](#input\_pdb\_name) | n/a | `string` | `"PDB1"` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | variable "public\_key\_path" {} | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_session_session_ttl_in_seconds"></a> [session\_session\_ttl\_in\_seconds](#input\_session\_session\_ttl\_in\_seconds) | n/a | `string` | `"10800"` | no |
| <a name="input_session_target_resource_details_session_type"></a> [session\_target\_resource\_details\_session\_type](#input\_session\_target\_resource\_details\_session\_type) | n/a | `string` | `""` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | n/a | `any` | n/a | yes |
| <a name="input_subnet_app_display_name"></a> [subnet\_app\_display\_name](#input\_subnet\_app\_display\_name) | n/a | `string` | `"app-sub"` | no |
| <a name="input_subnet_app_dns_label"></a> [subnet\_app\_dns\_label](#input\_subnet\_app\_dns\_label) | n/a | `string` | `"appsubnet"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.78.0/24"` | no |
| <a name="input_subnet_cidr2"></a> [subnet\_cidr2](#input\_subnet\_cidr2) | n/a | `string` | `"192.168.79.0/24"` | no |
| <a name="input_subnet_db_display_name"></a> [subnet\_db\_display\_name](#input\_subnet\_db\_display\_name) | n/a | `string` | `"db-sub"` | no |
| <a name="input_subnet_db_dns_label"></a> [subnet\_db\_dns\_label](#input\_subnet\_db\_dns\_label) | SUBNET INFO | `string` | `"dbsubnet"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_vcn_cidr"></a> [vcn\_cidr](#input\_vcn\_cidr) | n/a | `string` | `"192.168.64.0/20"` | no |
| <a name="input_vcn_display_name"></a> [vcn\_display\_name](#input\_vcn\_display\_name) | n/a | `string` | `"db-vcn"` | no |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | n/a | `string` | `"terravcn"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DB_STATE"></a> [DB\_STATE](#output\_DB\_STATE) | n/a |
| <a name="output_DB_Version"></a> [DB\_Version](#output\_DB\_Version) | n/a |
| <a name="output_Subnet_CIDR_DB"></a> [Subnet\_CIDR\_DB](#output\_Subnet\_CIDR\_DB) | cidr block of vcn's Subnet. |
| <a name="output_Subnet_Name_DB"></a> [Subnet\_Name\_DB](#output\_Subnet\_Name\_DB) | Name of created vcn's Subnet. |
| <a name="output_bastion_name"></a> [bastion\_name](#output\_bastion\_name) | n/a |
| <a name="output_bastion_session_name"></a> [bastion\_session\_name](#output\_bastion\_session\_name) | n/a |
| <a name="output_bastion_session_ssh_connection"></a> [bastion\_session\_ssh\_connection](#output\_bastion\_session\_ssh\_connection) | n/a |
| <a name="output_bastion_session_state"></a> [bastion\_session\_state](#output\_bastion\_session\_state) | n/a |
| <a name="output_bastion_session_target_resource_details"></a> [bastion\_session\_target\_resource\_details](#output\_bastion\_session\_target\_resource\_details) | n/a |
| <a name="output_db_system_options"></a> [db\_system\_options](#output\_db\_system\_options) | n/a |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | id of created instances. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IPs of created instances. |
| <a name="output_vcn_id"></a> [vcn\_id](#output\_vcn\_id) | OCID of created VCN. |
| <a name="output_vcn_name"></a> [vcn\_name](#output\_vcn\_name) | The Name of the newly created vpc |
