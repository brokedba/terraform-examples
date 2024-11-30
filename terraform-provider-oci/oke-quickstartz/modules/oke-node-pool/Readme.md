<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4, < 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | n/a |
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 4, < 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_containerengine_node_pool.oke_node_pool](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool) | resource |
| [cloudinit_config.nodes](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [oci_containerengine_node_pool_option.node_pool](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_node_pool_option) | data source |
| [oci_core_images.node_pool_images](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_images) | data source |
| [oci_identity_availability_domain.specfic](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domain) | data source |
| [oci_identity_availability_domains.ADs](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cni_type"></a> [cni\_type](#input\_cni\_type) | The CNI type to use for the cluster. Valid values are: FLANNEL\_OVERLAY or OCI\_VCN\_IP\_NATIVE | `string` | `"FLANNEL_OVERLAY"` | no |
| <a name="input_create_new_node_pool"></a> [create\_new\_node\_pool](#input\_create\_new\_node\_pool) | Create a new node pool if true or use an existing one if false | `bool` | `true` | no |
| <a name="input_existent_oke_nodepool_id_for_autoscaler"></a> [existent\_oke\_nodepool\_id\_for\_autoscaler](#input\_existent\_oke\_nodepool\_id\_for\_autoscaler) | Nodepool Id of the existent OKE to use with Cluster Autoscaler | `string` | `""` | no |
| <a name="input_extra_initial_node_labels"></a> [extra\_initial\_node\_labels](#input\_extra\_initial\_node\_labels) | Extra initial node labels to be added to the node pool | `map` | `{}` | no |
| <a name="input_image_operating_system"></a> [image\_operating\_system](#input\_image\_operating\_system) | The OS/image installed on all nodes in the node pool. | `string` | `"Oracle Linux"` | no |
| <a name="input_image_operating_system_version"></a> [image\_operating\_system\_version](#input\_image\_operating\_system\_version) | The OS/image version installed on all nodes in the node pool. | `string` | `"8"` | no |
| <a name="input_node_k8s_version"></a> [node\_k8s\_version](#input\_node\_k8s\_version) | Kubernetes version installed on your worker nodes | `string` | `"v1.29.1"` | no |
| <a name="input_node_pool_autoscaler_enabled"></a> [node\_pool\_autoscaler\_enabled](#input\_node\_pool\_autoscaler\_enabled) | Enable Cluster Autoscaler for the node pool | `bool` | `true` | no |
| <a name="input_node_pool_boot_volume_size_in_gbs"></a> [node\_pool\_boot\_volume\_size\_in\_gbs](#input\_node\_pool\_boot\_volume\_size\_in\_gbs) | Specify a custom boot volume size (in GB) | `string` | `"50"` | no |
| <a name="input_node_pool_cloud_init_parts"></a> [node\_pool\_cloud\_init\_parts](#input\_node\_pool\_cloud\_init\_parts) | Node Pool nodes Cloud init parts | <pre>list(object({<br/>    content_type = string<br/>    content      = string<br/>    filename     = string<br/>  }))</pre> | `[]` | no |
| <a name="input_node_pool_max_nodes"></a> [node\_pool\_max\_nodes](#input\_node\_pool\_max\_nodes) | The max number of worker nodes in the node pool if using Cluster Autoscaler. | `number` | `2` | no |
| <a name="input_node_pool_min_nodes"></a> [node\_pool\_min\_nodes](#input\_node\_pool\_min\_nodes) | The number of worker nodes in the node pool. If select Cluster Autoscaler, will assume the minimum number of nodes configured | `number` | `2` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Name of the node pool | `string` | `"pool1"` | no |
| <a name="input_node_pool_node_shape_config_memory_in_gbs"></a> [node\_pool\_node\_shape\_config\_memory\_in\_gbs](#input\_node\_pool\_node\_shape\_config\_memory\_in\_gbs) | You can customize the amount of memory allocated to a flexible shape | `string` | `"16"` | no |
| <a name="input_node_pool_node_shape_config_ocpus"></a> [node\_pool\_node\_shape\_config\_ocpus](#input\_node\_pool\_node\_shape\_config\_ocpus) | You can customize the number of OCPUs to a flexible shape | `string` | `"2"` | no |
| <a name="input_node_pool_oke_init_params"></a> [node\_pool\_oke\_init\_params](#input\_node\_pool\_oke\_init\_params) | OKE Init params | `string` | `""` | no |
| <a name="input_node_pool_shape"></a> [node\_pool\_shape](#input\_node\_pool\_shape) | A shape is a template that determines the number of OCPUs, amount of memory, and other resources allocated to a newly created instance for the Worker Node | `string` | `"VM.Standard.E4.Flex"` | no |
| <a name="input_node_pool_shape_specific_ad"></a> [node\_pool\_shape\_specific\_ad](#input\_node\_pool\_shape\_specific\_ad) | The number of the AD to get the shape for the node pool | `number` | `0` | no |
| <a name="input_node_pools_tags"></a> [node\_pools\_tags](#input\_node\_pools\_tags) | Tags to be added to the node pools resources | `any` | n/a | yes |
| <a name="input_nodes_subnet_id"></a> [nodes\_subnet\_id](#input\_nodes\_subnet\_id) | Nodes Subnet OCID to deploy OKE Cluster | `any` | n/a | yes |
| <a name="input_oci_vault_key_id_oke_node_boot_volume"></a> [oci\_vault\_key\_id\_oke\_node\_boot\_volume](#input\_oci\_vault\_key\_id\_oke\_node\_boot\_volume) | OCI Vault Key OCID used to encrypt the OKE node boot volume | `string` | `null` | no |
| <a name="input_oke_cluster_compartment_ocid"></a> [oke\_cluster\_compartment\_ocid](#input\_oke\_cluster\_compartment\_ocid) | Compartment OCID used by the OKE Cluster | `string` | n/a | yes |
| <a name="input_oke_cluster_ocid"></a> [oke\_cluster\_ocid](#input\_oke\_cluster\_ocid) | OKE cluster OCID | `string` | n/a | yes |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | In order to access your private nodes with a public SSH key you will need to set up a bastion host (a.k.a. jump box). If using public nodes, bastion is not needed. Left blank to not import keys. | `string` | `""` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCI Provider | `any` | n/a | yes |
| <a name="input_vcn_native_pod_networking_subnet_ocid"></a> [vcn\_native\_pod\_networking\_subnet\_ocid](#input\_vcn\_native\_pod\_networking\_subnet\_ocid) | VCN Native Pod Networking Subnet OCID used by the OKE Cluster | `any` | `null` | no |
| <a name="input_worker_nodes_tags"></a> [worker\_nodes\_tags](#input\_worker\_nodes\_tags) | Tags to be added to the worker nodes resources | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node_k8s_version"></a> [node\_k8s\_version](#output\_node\_k8s\_version) | n/a |
| <a name="output_node_pool_autoscaler_enabled"></a> [node\_pool\_autoscaler\_enabled](#output\_node\_pool\_autoscaler\_enabled) | n/a |
| <a name="output_node_pool_id"></a> [node\_pool\_id](#output\_node\_pool\_id) | n/a |
| <a name="output_node_pool_max_nodes"></a> [node\_pool\_max\_nodes](#output\_node\_pool\_max\_nodes) | n/a |
| <a name="output_node_pool_min_nodes"></a> [node\_pool\_min\_nodes](#output\_node\_pool\_min\_nodes) | n/a |
| <a name="output_node_pool_name"></a> [node\_pool\_name](#output\_node\_pool\_name) | n/a |
<!-- END_TF_DOCS -->